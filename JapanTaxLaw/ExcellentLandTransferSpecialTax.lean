import JapanTaxLaw.TaxFinance

/-!
# ExcellentLandTransferSpecialTax — 租税特別措置法 art. 31の2（優良住宅地の造成等のために土地等を譲渡した場合の長期譲渡所得の課税の特例）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json)

Models art. 31の2(1) item 1 / item 2 (verbatim computation):

  一 課税長期譲渡所得金額が二千万円以下である場合
     当該課税長期譲渡所得金額の百分の十に相当する金額
  二 課税長期譲渡所得金額が二千万円を超える場合 次に掲げる金額の合計額
     イ 二百万円
     ロ 当該課税長期譲渡所得金額から二千万円を控除した金額の百分の十五に相当する金額

Computation shape:

  if taxableGain ≤ ¥20,000,000 then 10% × taxableGain
  else ¥2,000,000 + 15% × (taxableGain − ¥20,000,000)

Out of scope (NOT MODELLED — no statutory arithmetic in the pinned text):
  * art. 31の2(1) の適用期間（昭和62年10月1日から令和10年12月31日まで）— caller-established Bool
  * 前条第二項の所有期間五年超 — caller-established Bool
  * 「優良住宅地等のための譲渡」の政令・財務省令による証明 — caller-established Bool
  * 次条（art. 31の3）の適用を受けるものの除外 — caller-established Bool
  * art. 31の2(2)（優良住宅地等のための譲渡の定義各号）— 分類規定、数式なし
  * art. 31(1) の一般税率は fallback としてのみ使い、art. 31 の独立モデル化は別スライス
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 31の2(1) の柱書要件を externally established booleans で表す。 -/
structure ExcellentLandTransferFacts where
  inTransferWindow : Bool
  heldOverFiveYears : Bool
  isQualifiedTransfer : Bool
  notSubjectToNextArticle : Bool
  deriving DecidableEq, Repr

def excellentLandTransferEligible (f : ExcellentLandTransferFacts) : Bool :=
  f.inTransferWindow && f.heldOverFiveYears && f.isQualifiedTransfer && f.notSubjectToNextArticle

def excellentLandLongTermRate : TaxRate := ⟨15, 100, by decide⟩

def excellentLandLowRate : TaxRate := ⟨10, 100, by decide⟩

def excellentLandExcessRate : TaxRate := ⟨15, 100, by decide⟩

def excellentLandBoundary : Money := 20_000_000

/-- art. 31の2(1) の税額。非適格なら art. 31(1) の一般税率（十五パーセント）。 -/
def excellentLandGainTax (f : ExcellentLandTransferFacts) (taxableGain : Money) : Money :=
  if excellentLandTransferEligible f then
    if taxableGain ≤ excellentLandBoundary then
      TaxRate.applyFloor excellentLandLowRate taxableGain
    else
      2_000_000 + TaxRate.applyFloor excellentLandExcessRate (taxableGain - excellentLandBoundary)
  else
    TaxRate.applyFloor excellentLandLongTermRate taxableGain

theorem excellentLandGainTax_zero (f : ExcellentLandTransferFacts)
    (h : excellentLandTransferEligible f = true) : excellentLandGainTax f 0 = 0 := by
  unfold excellentLandGainTax
  simp [h]
  decide

theorem excellentLandGainTax_mono (f : ExcellentLandTransferFacts)
    (h : excellentLandTransferEligible f = true) {a b : Money} (h' : a ≤ b) :
    excellentLandGainTax f a ≤ excellentLandGainTax f b := by
  have hBD : excellentLandBoundary = 20_000_000 := rfl
  unfold excellentLandGainTax
  simp [h]
  rw [hBD]
  by_cases ha : a ≤ 20_000_000
  · by_cases hb : b ≤ 20_000_000
    · rw [ite_eq_left ha, ite_eq_left hb]
      unfold TaxRate.applyFloor excellentLandLowRate
      exact Nat.div_le_div_right (Nat.mul_le_mul_right _ h')
    · rw [ite_eq_left ha, ite_eq_right hb]
      have hge : a * 10 / 100 ≤ 2_000_000 :=
        Nat.le_trans (Nat.div_le_div_right (Nat.mul_le_mul_right 10 ha)) (by decide)
      unfold TaxRate.applyFloor excellentLandLowRate
      exact Nat.le_trans hge (Nat.le_add_right _ _)
  · by_cases hb : b ≤ 20_000_000
    · exact absurd (Nat.le_trans h' hb) ha
    · rw [ite_eq_right ha, ite_eq_right hb]
      have hsub : a - 20_000_000 ≤ b - 20_000_000 :=
        Nat.sub_le_sub_right h' 20_000_000
      unfold TaxRate.applyFloor excellentLandExcessRate
      exact Nat.add_le_add_left
        (Nat.div_le_div_right (Nat.mul_le_mul_right _ hsub)) 2_000_000

theorem excellentLandGainTax_ineligible_eq_art31 (f : ExcellentLandTransferFacts)
    (h : excellentLandTransferEligible f = false) (taxableGain : Money) :
    excellentLandGainTax f taxableGain = TaxRate.applyFloor excellentLandLongTermRate taxableGain := by
  unfold excellentLandGainTax
  simp [h]

-- ==== kernel-decided smoke checks ====

example : excellentLandGainTax ⟨true, true, true, true⟩ 0 = 0 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 10_000_000 = 1_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_000 = 2_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_001 = 2_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 20_000_100 = 2_000_015 := by decide
example : excellentLandGainTax ⟨true, true, true, true⟩ 100_000_000 = 14_000_000 := by decide
example : excellentLandGainTax ⟨false, true, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : excellentLandGainTax ⟨true, false, true, true⟩ 100_000_000 = 15_000_000 := by decide
example : excellentLandGainTax ⟨true, true, false, true⟩ 100_000_000 = 15_000_000 := by decide
example : excellentLandGainTax ⟨true, true, true, false⟩ 100_000_000 = 15_000_000 := by decide

end JapanTaxLaw
