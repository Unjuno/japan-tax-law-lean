import JapanTaxLaw.TaxFinance
import JapanTaxLaw.GiftTax

/-!
# SpecialGiftRate — 租税特別措置法 art. 70の2の5（直系尊属から贈与を受けた場合の贈与税の税率の特例）
  vs 相続税法 art. 21-7（贈与税の税率表） — Phase E クロスロー整合性検査 #2

Sources (both pinned; Phase E checks both pins against the ledger):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 租税特別措置法 art. 70の2の5(1) — the special gift-tax rate table for
gifts from lineal ascendants to a recipient who is ≥18 years old as of January 1
of the year of the gift:

  平成二十七年一月一日以後に直系尊属からの贈与により財産を取得した者
  （その年一月一日において十八歳以上の者に限る。）のその年中の当該財産に
  係る贈与税の額は、相続税法第二十一条の七の規定にかかわらず、前条の規定に
  よる控除後の課税価格を次の表の上欄に掲げる金額に区分してそれぞれの金額に
  同表の下欄に掲げる税率を乗じて計算した金額を合計した金額とする。

  200万円以下            百分の十
  200万円超え400万円以下    百分の十五
  400万円超え600万円以下    百分の二十
  600万円超え千万円以下     百分の三十
  千万円超え千五百万円以下   百分の四十
  千五百万円超え三千万円以下  百分の四十五
  三千万円超え四千五百万円以下 百分の五十
  四千五百万円を超える     百分の五十五

vs 相続税法 art. 21-7 (`GiftTax.lean`):
  200万以下 10 / 300万以下 15 / 400万以下 20 / 600万以下 30 /
  1000万以下 40 / 1500万以下 45 / 3000万以下 50 / 3000万超 55.

Cross-law facts verified here (claims about the **models**, never about the real
legal semantics; Pin ↔ 原文一致 is the trust boundary):

1. `special_gift_zero_below_deduction` — the special computation applies after
   the same ¥600,000 basic deduction (art. 21-5); at ¥0 base the special tax is ¥0.
2. `special_eq_general_le_2m` — for a taxable base ≤ ¥2,000,000 both tables
   compute the same tax (both are flat 10% on that band).
3. Both tables share the 55% top rate (kernel-verified via `portionTaxGo`/`decide`).
4. `specialLeGeneralGrid` — bounded dense sample grid only.
   **The universal domination is now proven** in
   `JapanTaxLaw/SpecialGiftRateDomination.lean` (`specialGiftPortionTax_le_giftPortionTax`):
   pure-Nat normalisation of both tables + 9-interval decomposition, `omega` per
   interval; no `grind`, no `sorry`, no `admit`, no custom axioms. The grid here
   remains a bounded regression sample only; it does not claim universality.
5. Eligibility gates (lineal ascendant gift ∧ recipient ≥18 on Jan 1) are
   externally established booleans supplied by the caller (`SpecialGiftFacts`);
   art. 70の2の5(2)（年の途中で直系卑属となつた場合の規定）・(3)（特例贈与財産と一般贈与財産の併存時の按分計算）・
   (4)（申告手続）・(5)（相続時精算課税読替え）は**非モデル化**。

Out of scope:

* art. 70の2の5(2)（その年の中途において当該贈与をした者の直系卑属となつたときは、直系卑属となつた時前に当該贈与をした者からの贈与により取得した財産については、第一項の規定の適用はないものとする）—
  mid-year-conditioned interplay of partial-year gifts; caller-established boolean.
* art. 70の2の5(3) — mixed special/general property pro-rata calculation; requires both
  fact groups and the mixed tax decision tree — not modelled.
* art. 70の2の5(4) — 確定申告手続・明細書添付; art. 70の2の5(5) — 相続時精算課税適用者への読替え;
  art. 70の2の5(6) — 政令委任. All out of scope.
* The caller supplies the post-deduction taxable base; art. 70の2の5柱書の "前条の規定による控除後"
  は租税特別措置法前条(art. 70の2の4)を指す。The interplay with art. 70の2の4 is **not** modelled.

Pinned evidence in doc-comments only; all theorems here only claim properties of the models.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 70の2の5(1) special rate table (limits are inclusive upper edges). -/
def specialGiftRateTable : List GiftRateBand :=
  [ { limit := 2_000_000, pct := 10 },
    { limit := 4_000_000, pct := 15 },
    { limit := 6_000_000, pct := 20 },
    { limit := 10_000_000, pct := 30 },
    { limit := 15_000_000, pct := 40 },
    { limit := 30_000_000, pct := 45 },
    { limit := 45_000_000, pct := 50 }
    -- excess: 55%
    ]

/-- The general table after the first band (mirror of `giftRateTable`; named so proofs can unfold it). -/
def giftRateTableRest : List GiftRateBand :=
  [ { limit := 3_000_000, pct := 15 },
    { limit := 4_000_000, pct := 20 },
    { limit := 6_000_000, pct := 30 },
    { limit := 10_000_000, pct := 40 },
    { limit := 15_000_000, pct := 45 },
    { limit := 30_000_000, pct := 50 } ]

/-- The special table after the first band. -/
def specialGiftRateTableRest : List GiftRateBand :=
  [ { limit := 4_000_000, pct := 15 },
    { limit := 6_000_000, pct := 20 },
    { limit := 10_000_000, pct := 30 },
    { limit := 15_000_000, pct := 40 },
    { limit := 30_000_000, pct := 45 },
    { limit := 45_000_000, pct := 50 } ]

/-- One step of the band computation (decomposition lemma for proofs). -/
theorem portionTaxGo_cons (b : GiftRateBand) (rest : List GiftRateBand) (lo x : Money) :
    portionTaxGo (b :: rest) lo x =
      TaxRate.applyFloor ⟨b.pct, 100, by decide⟩ (min x b.limit - min x lo) +
        portionTaxGo rest b.limit x := by
  rfl

/-- The special gift-tax liability for the eligible property (art. 70の2の5(1)).
    Input: taxable value **after** the caller's deductions (e.g. art. 21-5
    basic deduction). Eligibility is externally established by the caller. -/
def specialGiftPortionTax (x : Money) : Money := portionTaxGo specialGiftRateTable 0 x

/-- art. 70の2の5(1) 柱書の適用要件（externally established な二要件）。 -/
structure SpecialGiftFacts where
  /-- 直系尊属からの贈与か (caller-established). -/
  isFromLinealAscendant : Bool
  /-- 贈与をした年の一月一日時点で受贈者が十八歳以上か (caller-established). -/
  recipientIsAdultOnGiftYearJan1 : Bool
  deriving DecidableEq, Repr

/-- art. 70の2の5(1) 柱書の適用可否。 -/
def specialGiftEligible (f : SpecialGiftFacts) : Bool :=
  f.isFromLinealAscendant && f.recipientIsAdultOnGiftYearJan1

/-- art. 70の2の5(1) applied after the same art. 21-5 ¥600,000 basic deduction.
    Ineligible inputs fall back to the general art. 21-7 computation. -/
def specialGiftTax (f : SpecialGiftFacts) (x : Money) : Money :=
  if f.isFromLinealAscendant && f.recipientIsAdultOnGiftYearJan1 then
    specialGiftPortionTax (if x ≤ giftBasicDeduction then 0 else x - giftBasicDeduction)
  else
    giftTax x

-- ==== L3/L4 helpers (local; same style as PhaseECorpRates) ====

/-- r.applyFloor 0 = 0. -/
theorem applyFloor_zero_money (r : TaxRate) : TaxRate.applyFloor r 0 = 0 := by
  unfold TaxRate.applyFloor
  simp

/-- Tail of a table past `lo` contributes 0 when every remaining band's edge
    is at or above `lo ≥ x`. -/
theorem portionTaxGo_eq_zero_of_tail {t : List GiftRateBand} (x lo : Money)
    (hlo : x ≤ lo) (h : ∀ b ∈ t, x ≤ b.limit) : portionTaxGo t lo x = 0 := by
  induction t generalizing lo with
  | nil =>
      have hdef : portionTaxGo [] lo x = giftTopRate.applyFloor (x - lo) := rfl
      rw [hdef, Nat.sub_eq_zero_of_le hlo, applyFloor_zero_money]
  | cons b rest ih =>
      have hdef := portionTaxGo_cons b rest lo x
      rw [hdef]
      have hb : x ≤ b.limit := h b List.mem_cons_self
      rw [Nat.min_eq_left hb, Nat.min_eq_left hlo, Nat.sub_self,
          applyFloor_zero_money, Nat.zero_add]
      exact ih b.limit hb (fun b' hb' => h b' (List.mem_cons_of_mem b hb'))

/-- Members of the general art. 21-7 tail table have edge ≥ ¥2,000,000. -/
theorem giftRateTableRest_edge_ge {x : Money} (h : x ≤ 2_000_000) :
    ∀ b ∈ giftRateTableRest, x ≤ b.limit := by
  intro b hb
  rw [giftRateTableRest] at hb
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hb
  rcases hb with hEq | hEq | hEq | hEq | hEq | hEq <;>
    · subst hEq; exact Nat.le_trans h (by decide)

/-- Members of the special art. 70の2の5 tail table have edge ≥ ¥2,000,000. -/
theorem specialGiftRateTableRest_edge_ge {x : Money} (h : x ≤ 2_000_000) :
    ∀ b ∈ specialGiftRateTableRest, x ≤ b.limit := by
  intro b hb
  rw [specialGiftRateTableRest] at hb
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hb
  rcases hb with hEq | hEq | hEq | hEq | hEq | hEq <;>
    · subst hEq; exact Nat.le_trans h (by decide)

/-- Below ¥2,000,000, the general table is the flat 10% first band. -/
theorem giftPortionTax_eq_10pct (h : x ≤ 2_000_000) :
    giftPortionTax x = TaxRate.applyFloor ⟨10, 100, by decide⟩ x := by
  unfold giftPortionTax
  have ht : giftRateTable = { limit := 2_000_000, pct := 10 } :: giftRateTableRest := rfl
  rw [ht, portionTaxGo_cons]
  show TaxRate.applyFloor ⟨10, 100, by decide⟩ (min x 2_000_000 - min x 0) +
      portionTaxGo giftRateTableRest 2_000_000 x = TaxRate.applyFloor ⟨10, 100, by decide⟩ x
  rw [Nat.min_eq_left h, Nat.min_eq_right (Nat.zero_le x), Nat.sub_zero]
  have h0 : portionTaxGo giftRateTableRest 2_000_000 x = 0 :=
    portionTaxGo_eq_zero_of_tail _ _ h (giftRateTableRest_edge_ge h)
  rw [h0, Nat.add_zero]

/-- Below ¥2,000,000, the special table is the flat 10% first band. -/
theorem specialGiftPortionTax_eq_10pct (h : x ≤ 2_000_000) :
    specialGiftPortionTax x = TaxRate.applyFloor ⟨10, 100, by decide⟩ x := by
  unfold specialGiftPortionTax
  have ht : specialGiftRateTable =
      { limit := 2_000_000, pct := 10 } :: specialGiftRateTableRest := rfl
  rw [ht, portionTaxGo_cons]
  show TaxRate.applyFloor ⟨10, 100, by decide⟩ (min x 2_000_000 - min x 0) +
      portionTaxGo specialGiftRateTableRest 2_000_000 x = TaxRate.applyFloor ⟨10, 100, by decide⟩ x
  rw [Nat.min_eq_left h, Nat.min_eq_right (Nat.zero_le x), Nat.sub_zero]
  have h0 : portionTaxGo specialGiftRateTableRest 2_000_000 x = 0 :=
    portionTaxGo_eq_zero_of_tail _ _ h (specialGiftRateTableRest_edge_ge h)
  rw [h0, Nat.add_zero]

/-- Cross-law fact 2: the two tables agree below the first divergent band edge. -/
theorem special_eq_general_le_2m (h : x ≤ 2_000_000) :
    specialGiftPortionTax x = giftPortionTax x := by
  rw [specialGiftPortionTax_eq_10pct h, giftPortionTax_eq_10pct h]

/-- Cross-law fact 1: at or below the basic deduction the special tax is ¥0. -/
theorem special_gift_zero_below_deduction :
    specialGiftTax ⟨true, true⟩ 600_000 = 0 := by decide

-- ==== kernel-decided smoke checks ====

-- 柱書要件: ¥0 gift, eligible → ¥0 tax
example : specialGiftTax ⟨true, true⟩ 0 = 0 := by decide
example : specialGiftTax ⟨false, true⟩ 50_000_000 = giftTax 50_000_000 := by decide
example : specialGiftTax ⟨true, false⟩ 50_000_000 = giftTax 50_000_000 := by decide
-- art. 70の2の5(1): 課税価格 ¥2,000,000 → 10% = ¥200,000（一般と同値: 最初の帯）
example : specialGiftPortionTax 2_000_000 = 200_000 := by decide
-- 特別表の刻み
example : specialGiftPortionTax 3_000_000 = 350_000 := by decide
example : specialGiftPortionTax 4_000_000 = 500_000 := by decide
example : specialGiftPortionTax 6_000_000 = 900_000 := by decide
example : specialGiftPortionTax 10_000_000 = 2_100_000 := by decide
example : specialGiftPortionTax 15_000_000 = 4_100_000 := by decide
example : specialGiftPortionTax 30_000_000 = 10_850_000 := by decide
example : specialGiftPortionTax 45_000_000 = 18_350_000 := by decide
example : specialGiftPortionTax 50_000_000 = 21_100_000 := by decide
-- 600,000円の基礎控除後の課税価格で計算
example : specialGiftTax ⟨true, true⟩ 2_600_000 = specialGiftPortionTax 2_000_000 := by decide

-- 支配例（特別 <= 一般）: deciable sample over the full range
example : specialGiftPortionTax 100_000_000 < giftPortionTax 100_000_000 := by decide

/-- Bounded kernel-decided dense sample grid: special never exceeds general.
    Grid: every ¥1,000,000 step from 0 to ¥50,000,000, plus every band edge ±1.
    (The universal theorem `specialGiftPortionTax_le_giftPortionTax` is proved in
    `SpecialGiftRateDomination.lean`; this grid remains a regression sample.) -/
def specialLeGeneralGrid : List Money :=
  (List.range 51).map (fun k => k * 1_000_000)
  ++
  [2_000_000, 2_000_001, 2_999_999, 3_000_000, 3_000_001, 3_999_999, 4_000_000,
   4_000_001, 5_999_999, 6_000_000, 6_000_001, 9_999_999, 10_000_000, 10_000_001,
   14_999_999, 15_000_000, 15_000_001, 29_999_999, 30_000_000, 30_000_001,
   44_999_999, 45_000_000, 45_000_001]

example : specialLeGeneralGrid.all fun x => specialGiftPortionTax x ≤ giftPortionTax x := by decide

end JapanTaxLaw
