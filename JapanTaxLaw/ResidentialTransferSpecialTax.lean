import JapanTaxLaw.TaxFinance

/-!
# ResidentialTransferSpecialTax — 租税特別措置法 art. 31の3（居住用財産を譲渡した場合の長期譲渡所得の課税の特例）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as SpecialGiftRate.lean / DeemedCapitalGainsCost.lean / PhaseECorpRates.lean /
   StampDutySpecial91.lean)

Models art. 31の3(1) (verbatim from pinned revision; art. 31の3(2)（居住用財産の定義）・(3)（確定申告要件・取得費加算）は
**非モデル化**):

  「個人が、その有する土地等又は建物等でその年一月一日において
    第三十一条第二項に規定する所有期間が十年を超えるもののうち居住用財産に
    該当するものの譲渡（当該個人の配偶者その他の当該個人と政令で定める特別の関係がある者に
    対してするもの及び … の規定の適用を受けるものを除く。
    以下この条において同じ。）をした場合（当該個人がその年の前年又は前々年において
    既にこの項の規定の適用を受けている場合を除く。）には、
    当該譲渡による譲渡所得については、第三十一条第一項前段の規定により
    当該譲渡に係る課税長期譲渡所得金額に対し課する所得税の額は、
    同項前段の規定にかかわらず、次の各号に掲げる場合の区分に応じ当該各号に定める金額
    に相当する額とする。
    一課税長期譲渡所得金額が六千万円以下である場合当該課税長期譲渡所得金額の
      百分の十に相当する金額
    二課税長期譲渡所得金額が六千万円を超える場合次に掲げる金額の合計額
      イ六百万円
      ロ当該課税長期譲渡所得金額から六千万円を控除した金額の百分の十五に相当
        する金額」

Computation shape:

  if 課税長期譲渡所得金額 ≤ ¥60,000,000 then 10% × その額
  else ¥6,000,000 + 15% × (その額 − ¥60,000,000)

Eligibility gates (所有期間の十年要件・居住用財産該当性・配偶者等除外・過去2年非適用) は
externally established booleans; art. 31の3(2)（定義）・(3)（手続・取得費加算）は非モデル化。

Out of scope:

* art. 31の3(2)（居住用財産の定義）— 適格性は caller-established boolean
* art. 31の3(3)（申告手続・取得費加算）— 非モデル化
* art. 31（長期譲渡所得の課税の特例本体・百分の十五）の独立モデル化は別スライス。
  ここでは `longTermGainRate` として fallback 適用のみ（15%）を表現する。

Eligibility-false fallback returns the art. 31(1) long-term rate (15%), as does the
house pattern in `SpecialGiftRate.lean` and `StampDutySpecial91.lean`
("special provision → general regime" fallback).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 31の3(1) の柱書要件を externally established booleans で表す。 -/
structure ResidentialTransferFacts where
  /-- art. 31の3(2) 居住用財産のいずれの区分にも該当するか（該当しなければ特例非適用）。 -/
  isResidentialProperty : Bool
  /-- その年一月一日において所有期間が十年を超えるか。 -/
  overTenYears : Bool
  /-- 配偶者等政令で定める特別の関係がある者に対してするもの、若しくは
      art. 33-33の3, 35の3, 36の2, 36の5, 37, 37の4, 37の5（同条第六項を除く）,
      37の6, 37の8 の規定の適用を受けるものでないか。 -/
  isNotExcluded : Bool
  /-- その年の前年又は前々年において既にこの項の規定の適用を受けていないか。 -/
  notUsedWithinTwoYears : Bool
  deriving DecidableEq, Repr

/-- art. 31の3 柱書の適用可否。 -/
def residentialTransferEligible (f : ResidentialTransferFacts) : Bool :=
  f.isResidentialProperty && f.overTenYears && f.isNotExcluded && f.notUsedWithinTwoYears

/-- art. 31（長期譲渡所得の課税の特例）の一般税率（十五パーセント）。
    ここでは fallback としてのみ使い、art. 31 の独立モデル化は別スライスとする。 -/
def longTermGainRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 31の3(1) の特例税率（百分の十）— ¥60,000,000 以下の場合。 -/
def lowResidentialRate : TaxRate := ⟨10, 100, by decide⟩

/-- art. 31の3(1) 超過部分の特例税率（百分の十五）。 -/
def excessResidentialRate : TaxRate := ⟨15, 100, by decide⟩

/-- 金額の壁（¥60,000,000）。 -/
def residentialBoundary : Money := 60_000_000

/-- art. 31の3(1) 柱書の税額。非適格なら art. 31(1) の一般税率（十五パーセント）。
    Input: 課税長期譲渡所得金額（第三十一条の四の概算取得費計算等を経た後の額）。 -/
def residentialGainTax (f : ResidentialTransferFacts) (taxableGain : Money) : Money :=
  if residentialTransferEligible f then
    if taxableGain ≤ residentialBoundary then
      TaxRate.applyFloor lowResidentialRate taxableGain
    else
      6_000_000 + TaxRate.applyFloor excessResidentialRate (taxableGain - residentialBoundary)
  else
    TaxRate.applyFloor longTermGainRate taxableGain

/-- art. 31の3(1) 基本事実：0 収入なら 0 税額。 -/
theorem residentialGainTax_zero (f : ResidentialTransferFacts)
    (h : residentialTransferEligible f = true) : residentialGainTax f 0 = 0 := by
  unfold residentialGainTax
  simp [h]
  decide

/-- art. 31の3(1): 計算税額は課税長期譲渡所得金額について単調非減少。 -/
theorem residentialGainTax_mono (f : ResidentialTransferFacts)
    (h : residentialTransferEligible f = true) {a b : Money} (h' : a ≤ b) :
    residentialGainTax f a ≤ residentialGainTax f b := by
  have hBD : residentialBoundary = 60_000_000 := rfl
  unfold residentialGainTax
  simp [h]
  rw [hBD]
  by_cases ha : a ≤ 60_000_000
  · by_cases hb : b ≤ 60_000_000
    · rw [ite_eq_left ha, ite_eq_left hb]
      unfold TaxRate.applyFloor lowResidentialRate
      exact Nat.div_le_div_right (Nat.mul_le_mul_right _ h')
    · rw [ite_eq_left ha, ite_eq_right hb]
      have hge : a * 10 / 100 ≤ 6_000_000 :=
        Nat.le_trans (Nat.div_le_div_right (Nat.mul_le_mul_right 10 ha)) (by decide)
      unfold TaxRate.applyFloor lowResidentialRate
      exact Nat.le_trans hge (Nat.le_add_right _ _)
  · by_cases hb : b ≤ 60_000_000
    · exact absurd (Nat.le_trans h' hb) ha
    · rw [ite_eq_right ha, ite_eq_right hb]
      have hsub : a - 60_000_000 ≤ b - 60_000_000 :=
        Nat.sub_le_sub_right h' 60_000_000
      unfold TaxRate.applyFloor excessResidentialRate
      exact Nat.add_le_add_left
        (Nat.div_le_div_right (Nat.mul_le_mul_right _ hsub)) 6_000_000

/-- 非適格なら art. 31(1) の一般税率（十五パーセント）を適用する（定義の一環）。 -/
theorem residentialGainTax_ineligible_eq_art31 (f : ResidentialTransferFacts)
    (h : residentialTransferEligible f = false) (taxableGain : Money) :
    residentialGainTax f taxableGain = TaxRate.applyFloor longTermGainRate taxableGain := by
  unfold residentialGainTax
  simp [h]

-- ==== kernel-decided smoke checks ====

example : residentialGainTax ⟨true, true, true, true⟩ 0 = 0 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 30_000_000 = 3_000_000 := by decide
-- 課税長期譲渡所得金額がちょうど ¥60,000,000
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_000 = 6_000_000 := by decide
-- ¥60,000,000 を 1 円超えた場合も特例の前提で ¥6,000,000 のまま（連続）
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_001 = 6_000_000 := by decide
example : residentialGainTax ⟨true, true, true, true⟩ 60_000_100 = 6_000_015 := by decide
-- 大きな収益
example : residentialGainTax ⟨true, true, true, true⟩ 100_000_000 = 12_000_000 := by decide
-- 非適格（いずれかの柱書要件が false）→ art. 31 15%
example : residentialGainTax ⟨false, true, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, false, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, true, false, true⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, true, true, false⟩ 100_000_000 = 15_000_000 := by decide
example : residentialGainTax ⟨true, false, true, false⟩ 100_000_000 = 15_000_000 := by decide

end JapanTaxLaw
