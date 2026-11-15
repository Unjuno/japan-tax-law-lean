import JapanTaxLaw.SpousalGiftDeduction

/-!
# SpousalGiftDeduction spec — independent statement of art. 21-6(1)

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of 相続税法 art. 21-6(1) (贈与税の配偶者控除) from the
statutory text itself. Where the implementation uses `min` for the
二千万円 cap, this spec decides it directly by case analysis:

  basis ≤ 20,000,000 → basis
  basis > 20,000,000 → 20,000,000

Scope boundaries are identical to the implementation (see
SpousalGiftDeduction.lean): 適用要件の事実認定（婚姻期間20年以上・前年以前の適用歴・
翌年3月15日までの居住供用見込み）は externally established boolean。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 基礎合計額 — 居住用不動産の価額 + 居住用不動産取得に充てられた金銭部分. -/
def specSpousalDeductionBasis (f : SpousalGiftFacts) : Money :=
  f.residentialPropertyValue + f.cashAppliedToResidential

/-- Spec: 控除額 — direct case analysis on the two千万円 cap. -/
def specSpousalDeduction (f : SpousalGiftFacts) : Money :=
  if f.isSpousalGift20Year && !f.priorApplication && f.providesResidenceByNextMarch then
    let basis := specSpousalDeductionBasis f
    if basis ≤ 20_000_000 then basis else 20_000_000
  else 0

/-- Spec: 控除後の課税価格. -/
def specTaxableValueAfterSpousalDeduction (f : SpousalGiftFacts) : Money :=
  if specSpousalDeduction f ≤ f.giftTaxableValue then f.giftTaxableValue - specSpousalDeduction f
  else 0

-- ==== points, all kernel-decided ====

-- Case A — qualifying spouse gift, immovable above the cap: full ¥20,000,000
example : specSpousalDeduction ⟨true, 25_000_000, 0, false, true, 30_000_000⟩ = 20_000_000 := by decide
-- Case B — qualifying, basis below the cap: the sum is deducted
example : specSpousalDeduction ⟨true, 7_000_000, 5_000_000, false, true, 30_000_000⟩ = 12_000_000 := by decide
-- Case C — not a 20-year spousal gift: nothing is deducted
example : specSpousalDeduction ⟨false, 25_000_000, 0, false, true, 30_000_000⟩ = 0 := by decide
-- Case D — prior application in an earlier year: the one-lifetime limit holds
example : specSpousalDeduction ⟨true, 25_000_000, 0, true, true, 30_000_000⟩ = 0 := by decide
-- Case E — residence not provided by next 15 March: requirement unmet
example : specSpousalDeduction ⟨true, 25_000_000, 0, false, false, 30_000_000⟩ = 0 := by decide
-- Case F — gift taxable value below the deduction: zero after deduction
example : specTaxableValueAfterSpousalDeduction ⟨true, 25_000_000, 0, false, true, 10_000_000⟩ = 0 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering both cap branches and each eligibility gate.
    Points are sample points, not a proof of universal equivalence. -/
def agreeSpousalGiftPoints : Bool :=
  let a := SpousalGiftFacts.mk true  25_000_000 0          false true 30_000_000
  let b := SpousalGiftFacts.mk true  7_000_000  5_000_000  false true 30_000_000
  let c := SpousalGiftFacts.mk true  15_000_000 10_000_000 false true 100_000_000
  let d := SpousalGiftFacts.mk false 25_000_000 0          false true 30_000_000
  let e := SpousalGiftFacts.mk true  25_000_000 0          true  true 30_000_000
  let f := SpousalGiftFacts.mk true  25_000_000 0          false false 30_000_000
  let g := SpousalGiftFacts.mk true  0          0          false true 30_000_000
  (spousalDeduction a == specSpousalDeduction a) &&
  (spousalDeduction b == specSpousalDeduction b) &&
  (spousalDeduction c == specSpousalDeduction c) &&
  (spousalDeduction d == specSpousalDeduction d) &&
  (spousalDeduction e == specSpousalDeduction e) &&
  (spousalDeduction f == specSpousalDeduction f) &&
  (spousalDeduction g == specSpousalDeduction g) &&
  (taxableValueAfterSpousalDeduction a == specTaxableValueAfterSpousalDeduction a) &&
  (taxableValueAfterSpousalDeduction c == specTaxableValueAfterSpousalDeduction c)

example : agreeSpousalGiftPoints = true := by decide

end JapanTaxLaw
