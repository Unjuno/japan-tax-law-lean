import JapanTaxLaw.SpousalGiftDeduction

/-!
# SpousalGiftDeduction tests — 相続税法 art. 21-6 smoke checks

Decidable smoke tests for the spousal-gift deduction (art. 21-6), pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Each `example` covers an art. 21-6(1) boundary: the ¥20,000,000 cap, the
basis-sum below the cap, each eligibility gate (20-year marriage, one-time
prior application, residence by next 15 March), the zero-basis edge, and the
end-to-end composition with art. 21-5/art. 21-7 (`GiftTax.lean`).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- Example A — qualifying immovable gift above the cap: deduct ¥20,000,000
def sA : SpousalGiftFacts := ⟨true, 25_000_000, 0, false, true, 30_000_000⟩
example : spousalDeductionBasis sA = 25_000_000 := by decide
example : spousalDeduction sA = 20_000_000 := by decide
example : taxableValueAfterSpousalDeduction sA = 10_000_000 := by decide
-- end-to-end: giftTax(10,000,000) = giftPortionTax(9,400,000) = 2,510,000
example : giftTaxAfterSpousalDeduction sA = 2_510_000 := by decide

-- Example B — qualifying, basis below the cap (7,000,000 + 5,000,000 = 12,000,000)
def sB : SpousalGiftFacts := ⟨true, 7_000_000, 5_000_000, false, true, 30_000_000⟩
example : spousalDeduction sB = 12_000_000 := by decide
example : taxableValueAfterSpousalDeduction sB = 18_000_000 := by decide

-- Example C — not a 20-year spousal gift: no deduction
def sC : SpousalGiftFacts := ⟨false, 25_000_000, 0, false, true, 30_000_000⟩
example : spousalDeduction sC = 0 := by decide
example : taxableValueAfterSpousalDeduction sC = 30_000_000 := by decide

-- Example D — prior application in an earlier year: one-lifetime limit
def sD : SpousalGiftFacts := ⟨true, 25_000_000, 0, true, true, 30_000_000⟩
example : spousalDeduction sD = 0 := by decide

-- Example E — residence not provided by next 15 March
def sE : SpousalGiftFacts := ⟨true, 25_000_000, 0, false, false, 30_000_000⟩
example : spousalDeduction sE = 0 := by decide

-- Example F — zero basis (e.g. stock/securities gift): no deduction
def sF : SpousalGiftFacts := ⟨true, 0, 0, false, true, 30_000_000⟩
example : spousalDeductionBasis sF = 0 := by decide
example : spousalDeduction sF = 0 := by decide

-- Example G — gift taxable value below the deduction: zero after deduction
def sG : SpousalGiftFacts := ⟨true, 25_000_000, 0, false, true, 15_000_000⟩
example : taxableValueAfterSpousalDeduction sG = 0 := by decide
example : giftTaxAfterSpousalDeduction sG = 0 := by decide

-- Example H — cash applied to immovable fills or exceeds the cap
def sH : SpousalGiftFacts := ⟨true, 0, 30_000_000, false, true, 40_000_000⟩
example : spousalDeductionBasis sH = 30_000_000 := by decide
example : spousalDeduction sH = 20_000_000 := by decide
def fH2 : SpousalGiftFacts := ⟨true, 0, 8_000_000, false, true, 40_000_000⟩
example : spousalDeduction fH2 = 8_000_000 := by decide

-- Example I — boundary: basis exactly ¥20,000,000 → deduction exactly ¥20,000,000
def sI : SpousalGiftFacts := ⟨true, 20_000_000, 0, false, true, 50_000_000⟩
example : spousalDeduction sI = 20_000_000 := by decide

-- Example J — mixed amounts summing to exactly the cap
def sJ : SpousalGiftFacts := ⟨true, 12_000_000, 8_000_000, false, true, 50_000_000⟩
example : spousalDeductionBasis sJ = 20_000_000 := by decide
example : spousalDeduction sJ = 20_000_000 := by decide

-- Example K — zero-input boundary: 居住用不動産 0 + 充てられた金銭 0 → 基礎合計額 0
example : spousalDeductionBasis ⟨true, 0, 0, false, true, 100⟩ = 0 := by decide
-- Example L — small-positive-input boundary: 7 + 6 = 13 (二千万円未満 → 控除額 = 基礎額、恒等)
example : spousalDeduction ⟨true, 7, 6, false, true, 100⟩ = 13 := by decide

end JapanTaxLaw
