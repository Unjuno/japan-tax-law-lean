import JapanTaxLaw.TaxFinance
import JapanTaxLaw.CorporateTaxRate

/-!
# PhaseECorpRates — Phase E: cross-law consistency of corporate income tax rates
  between 法人税法 art. 66 and 租税特別措置法 art. 67の2 / art. 68

Sources (both pinned; Phase E checks both pins against the ledger):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models, and mechanically checks the cross-law consistency of, the following rate systems:

* **法人税法 art. 66(1)–(3)** (`JapanTaxLaw/CorporateTaxRate.lean`): ordinary corporations
  23.2% — SME-eligible ordinary corporations 19% up to ¥8,000,000 and 23.2% above —
  public-interest / cooperative corporations flat 19%.
* **租税特別措置法 art. 67の2(1)（特定の医療法人の法人税率の特例）**: 承認を受けた
  特定の医療法人の所得には「法人税法第六十六条第一項、第二項及び第六項の規定にかかわらず」
  **百分の十九**の税率が適用される（art. 67の2(2)–(5)（取消し・通知・手続）は非モデル化）。
* **租税特別措置法 art. 68(1)(2)（特定の協同組合等の法人税率の特例）**: 特定の協同組合等の
  art. 66(3) の「百分の十九」とあるのを「百分の十九（各事業年度の所得の金額のうち
  **十億円**（事業年度が一年に満たない協同組合等は当該事業年度の月数を乗じて十二で除した
  金額）を超える部分の金額については、**百分の二十二**）」と読み替える。
  (art. 68(2): 月数は暦に従って計算し、一月に満たない端数を生じたときは、これを一月とする)

Cross-law facts verified here (claims about the **models**, never about the real legal
semantics; Pin ↔ 原文一致 is the trust boundary):

1. `rate_band_order` — the special bands sit strictly between the two general bands:
   19% < 22% < 23.2% (19/100 < 22/100 < 232/1000).
2. `med_spec_eq_public_rate` — art. 67の2(1)'s rate IS the art. 66(3) flat 19% rate;
   the special provision's operative content is the explicit "かかわらず" override of
   art. 66(1),(2),(6) (i.e. it also displaces the SME cap regime, not merely the
   ordinary rate). Here the override is pinned in comments, not enforced by the model.
3. `coop_eq_public_rate_below_cap` — for 12-month business years with income ≤ ¥1,000,000,000,
   the art. 68 special tax equals art. 66(3) exactly (the special provision changes nothing
   below ¥10億； its only effect is the excess band).
4. `coop_excess_band_composition` — above the cap the tax splits deterministically as
   (19% × cap) + (22% × excess) — the §68 surcharge is confined to the excess.
5. `coopSpecialCap_mono` — the cap is monotone in the month-count (months ∈ [1,12]).
6. `coopSpecialTaxRaw_mono` — the special tax is monotone non-decreasing in income.
7. Eligibility gates of both special provisions (art. 67の2 政令要件・国税庁長官の承認；
   art. 68 の三要件（物品供給事業収入比率が50%超・組合員数50万人以上・店舗収入≥1000億/年））
   are externally established inputs supplied by the caller; this module does not derive them.
8. art. 68 division of the cap (months × 10億 ÷ 12) floors (**modeling candidate** — the
   statute does not specify division rounding; art. 68(2) の rounding rule applies to the
   month count, not to this division).

Out of scope:

* art. 67の2(2)（取消し遡及）・(3)（通知）・(4)（文言読替え）・(5)（手続）
* art. 68(2) の月数端数処理の適用そのもの（呼出元が `CoopFacts.monthsLived` で供給）
* art. 66(4)（一年未満事業年度の換算）・art. 66(6)（法人課税信託等）・art. 66(9)–(14)
  （特定同族会社・特定投資法人等）・次々年度以降の特例は非モデル化
* Whether art. 67の2 / art. 68 as lex specialis prevail **in general** over art. 66 is a
  legal-priority question; the statute answers it locally via "かかわらず" (art. 67の2) and
  "とあるのは…と読み替える" (art. 68), both of which are explicit and modelled above. General
  lex specialis reasoning is out of scope.

Pinned evidence in doc-comments only; all theorems here only claim properties of the models.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 67の2(1): 承認を受けた特定の医療法人の各事業年度の所得の法人税額
    （百分の十九）。承認の有無は externally established な呼出元入力として扱う —
    承認されていなければこの式は使わない（法人税法 art. 66 が適用される）。 -/
def specialMedicalCorpTax (income : Money) : Money :=
  TaxRate.applyFloor smeRate income

/-- art. 68(1): 協同組合等のうち、政令等で認められるものに係る各事業年度の所得の
    art. 66(3) の読替え後の税額。月数は暦に従って計算した事業月数（art. 68(2)）で、
    1ヶ月未満は1ヶ月とする端数処理は呼出元が済ませた値を渡す。
    適格要件を満たさない場合は本式を適用しない（法人税法 art. 66(3) ＝ 百分の十九 が適用される）。 -/
structure CoopFacts where
  /-- 三要件（物品供給事業収入比率>50%・組合員数≥50万人・店舗収入≥千億/年）を全て満たすか。 -/
  meetsRequirements : Bool
  /-- 当該事業年度の月数（art. 68(2)）。 -/
  monthsLived : Nat
  deriving DecidableEq, Repr

/-- art. 68 cap: 十億円 × 月数 / 12（十二で除した金額; 除算は切り捨て — modeling candidate）。 -/
def coopSpecialCap (monthsLived : Nat) : Money :=
  1_000_000_000 * monthsLived / 12

/-- art. 68(1) の百分の二十二の超過分部分の税率。 -/
def coopSpecialExcessRate : TaxRate := ⟨22, 100, by decide⟩

/-- art. 68(1) の額： cap 以下は百分の十九（法人税法 art. 66(3) と同値）、
    cap 超過部分のみ百分の二十二。 -/
def coopSpecialTaxRaw (income cap : Money) : Money :=
  TaxRate.applyFloor smeRate (min income cap) +
    TaxRate.applyFloor coopSpecialExcessRate (income - min income cap)

/-- art. 68(1) の税額。適格でなければ百分の十九の法人税法 art. 66(3) が適用されるため、
    本関数は適格な呼出しにのみ使う。 -/
def coopSpecialTax (f : CoopFacts) (income : Money) : Money :=
  if f.meetsRequirements then coopSpecialTaxRaw income (coopSpecialCap f.monthsLived)
  else TaxRate.applyFloor smeRate income

-- ==== L3/L4 helpers (local to this module; same style as found in TaxFinance) ====

theorem applyFloor_zero_money (r : TaxRate) : TaxRate.applyFloor r 0 = 0 := by
  unfold TaxRate.applyFloor
  simp

theorem applyFloor_mono (r : TaxRate) {a b : Money} (h : a ≤ b) :
    TaxRate.applyFloor r a ≤ TaxRate.applyFloor r b := by
  unfold TaxRate.applyFloor
  exact Nat.div_le_div_right (Nat.mul_le_mul_right _ h)

/-- min monotone in both arguments (local; core has no `min_le_min`). -/
theorem min_le_min' {a b c d : Nat} (h1 : a ≤ b) (h2 : c ≤ d) : min a c ≤ min b d := by
  by_cases h : a ≤ c
  · rw [Nat.min_eq_left h]
    by_cases h' : b ≤ d
    · rw [Nat.min_eq_left h']; exact h1
    · rw [Nat.min_eq_right (Nat.le_of_not_le h')]
      exact Nat.le_trans h h2
  · have hc : c ≤ a := Nat.le_of_not_le h
    rw [Nat.min_eq_right hc]
    by_cases h' : b ≤ d
    · rw [Nat.min_eq_left h']
      exact Nat.le_trans hc h1
    · rw [Nat.min_eq_right (Nat.le_of_not_le h')]
      exact h2

/-- x - min x cap = (if x ≤ cap then 0 else x - cap). -/
theorem sub_min_self (x cap : Money) : x - min x cap = if x ≤ cap then 0 else x - cap := by
  by_cases h : x ≤ cap
  · rw [ite_eq_left h, Nat.min_eq_left h, Nat.sub_self]
  · rw [ite_eq_right h, Nat.min_eq_right (Nat.le_of_not_le h)]

/-- The excess portion is monotone in income. -/
theorem sub_min_mono {a b cap : Money} (h : a ≤ b) :
    a - min a cap ≤ b - min b cap := by
  rw [sub_min_self, sub_min_self]
  by_cases ha : a ≤ cap
  · rw [ite_eq_left ha]
    by_cases hb : b ≤ cap
    · rw [ite_eq_left hb]
      exact Nat.le_refl 0
    · rw [ite_eq_right hb]
      exact Nat.zero_le _
  · rw [ite_eq_right ha]
    by_cases hb : b ≤ cap
    · rw [ite_eq_left hb]
      exact absurd (Nat.le_trans h hb) ha
    · rw [ite_eq_right hb]
      exact Nat.sub_le_sub_right h cap

/-- art. 68 excess tax is monotone in income for fixed cap. -/
theorem coopSpecialTaxRaw_mono {a b cap : Money} (h : a ≤ b) :
    coopSpecialTaxRaw a cap ≤ coopSpecialTaxRaw b cap := by
  unfold coopSpecialTaxRaw
  exact Nat.add_le_add
    (applyFloor_mono _ (min_le_min' h (Nat.le_refl cap)))
    (applyFloor_mono _ (sub_min_mono h))

/-- art. 68(1): above the cap, the tax splits as 19%×cap + 22%×excess (split-additivity). -/
theorem coop_excess_band_composition (income cap : Money) (h : cap ≤ income) :
    coopSpecialTaxRaw income cap =
      TaxRate.applyFloor smeRate cap + TaxRate.applyFloor coopSpecialExcessRate (income - cap) := by
  unfold coopSpecialTaxRaw
  rw [Nat.min_eq_right h]

/-- art. 68(1)(2): 12-month cap = exactly ¥1,000,000,000. -/
theorem coopSpecialCap_12 : coopSpecialCap 12 = 1_000_000_000 := by decide

/-- art. 68 cap is monotone in the month count. -/
theorem coopSpecialCap_mono {m₁ m₂ : Nat} (h : m₁ ≤ m₂) :
    coopSpecialCap m₁ ≤ coopSpecialCap m₂ := by
  unfold coopSpecialCap
  have hm : 1_000_000_000 * m₁ ≤ 1_000_000_000 * m₂ := Nat.mul_le_mul_left 1_000_000_000 h
  exact Nat.div_le_div_right hm

/-- Cross-law fact 2: art. 67の2(1)'s rate is the same 19% rate as art. 66(3);
    its operative novelty is the explicit override clause. -/
theorem med_spec_eq_public_rate (income : Money) {f : CorpFacts} :
    specialMedicalCorpTax income = corporateTax .publicInterestOrCoop f income := rfl

/-- Cross-law fact 3: below ¥10億 (12-month business year), the art. 68 special tax
    equals the art. 66(3) flat 19% computation exactly. -/
theorem coop_eq_public_rate_below_cap (income : Money) (h : income ≤ 1_000_000_000)
    {f : CorpFacts} :
    coopSpecialTaxRaw income (coopSpecialCap 12) =
      corporateTax .publicInterestOrCoop f income := by
  have hcap : coopSpecialCap 12 = 1_000_000_000 := by decide
  rw [hcap]
  unfold coopSpecialTaxRaw
  rw [Nat.min_eq_left h, Nat.sub_self, applyFloor_zero_money, Nat.add_zero]
  rfl

/-- Cross-law fact 1: the statutory special bands sit strictly between the two
    general bands (19% < 22% < 23.2%), expressed over a common denominator. -/
theorem rate_band_order :
    smeRate.num * ordinaryRate.den < coopSpecialExcessRate.num * ordinaryRate.den ∧
    coopSpecialExcessRate.num * ordinaryRate.den < ordinaryRate.num * smeRate.den := by
  decide

-- ==== kernel-decided smoke checks ====

-- art. 67の2(1): any income taxes at 19%
example : specialMedicalCorpTax 100_000_000 = 19_000_000 := by decide
example : specialMedicalCorpTax 0 = 0 := by decide
-- art. 68 below cap: identical to 19% flat (¥8億 < ¥10億）
example : coopSpecialTax ⟨true, 12⟩ 800_000_000 = 152_000_000 := by decide
example : coopSpecialTax ⟨true, 12⟩ 1_000_000_000 = 190_000_000 := by decide
-- art. 68 above cap: 19%×10億 + 22%×excess
example : coopSpecialTax ⟨true, 12⟩ 2_000_000_000 = 410_000_000 := by decide
-- art. 68(2): month-prorated cap (6-month year: cap ¥5億）
example : coopSpecialCap 6 = 500_000_000 := by decide
example : coopSpecialCap 1 = 83_333_333 := by decide
example : coopSpecialTax ⟨true, 6⟩ 700_000_000 =
    95_000_000 + TaxRate.applyFloor coopSpecialExcessRate 200_000_000 := by decide
-- not eligible → falls back to art. 66(3) flat 19% (special provision does not apply)
example : coopSpecialTax ⟨false, 12⟩ 2_000_000_000 = 380_000_000 := by decide

end JapanTaxLaw
