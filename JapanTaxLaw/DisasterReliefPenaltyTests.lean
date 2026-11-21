import JapanTaxLaw.DisasterReliefPenalty
import JapanTaxLaw.DisasterReliefPenaltySpec

/-
# DisasterReliefPenaltyTests — kernel-decided boundary checks for 災害被害者租税減免法 第五条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of the universal bridge theorems. Coverage: zero, small
positive inputs, the 一年 (= 1 年) and 五十万円 (= 500,000 円) threshold
neighbourhoods, saturation/identity, and impl/spec agreement on the grid.

Pinned source: law 329AC0000000112, revision 329AC0000000112_20250601_504AC0000000068,
sha256 e9fdb7f3e8e12c43d255f747e2533f5374b31454e03efd513bfe1f4c12d35943,
Article Num 5, needle「第一項の規定による承認を受けないで同項の資材等又は製品等を譲り受けた者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」.
The two axes (年 vs 円) are tested independently and never mixed.
-/

namespace JapanTaxLaw.DisasterReliefPenalty

-- (a) imprisonment axis: zero, inclusive 一年 ceiling, first outside term.
example : withinImprisonment 0 = true := by decide
example : withinImprisonment 1 = true := by decide
example : withinImprisonment 2 = false := by decide

-- (b) fine axis: zero, just below, inclusive 五十万円 ceiling, first outside.
example : withinFine 0 = true := by decide
example : withinFine 499_999 = true := by decide
example : withinFine 500_000 = true := by decide
example : withinFine 500_001 = false := by decide

-- (c) saturation / identity at the two distinct statutory ceilings.
example : imprisonmentCeiling - imprisonmentCeiling = 0 := by decide
example : fineCeiling - fineCeiling = 0 := by decide
example : imprisonmentCeiling = 1 := by decide
example : fineCeiling = 500_000 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : withinImprisonment 0 = true := imprisonment_zero_true
example : withinImprisonment 1 = true := imprisonment_one_true
example : withinImprisonment 2 = false := imprisonment_two_false
example : withinFine 0 = true := fine_zero_true
example : withinFine 499_999 = true := fine_499999_true
example : withinFine 500_000 = true := fine_500000_true
example : withinFine 500_001 = false := fine_500001_false

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinImprisonment 0 = specWithinImprisonment 0 := by decide
example : withinImprisonment 1 = specWithinImprisonment 1 := by decide
example : withinImprisonment 2 = specWithinImprisonment 2 := by decide
example : withinFine 0 = specWithinFine 0 := by decide
example : withinFine 499_999 = specWithinFine 499_999 := by decide
example : withinFine 500_000 = specWithinFine 500_000 := by decide
example : withinFine 500_001 = specWithinFine 500_001 := by decide
example (y : Nat) : withinImprisonment y = specWithinImprisonment y := agreeImprisonment y
example (v : Nat) : withinFine v = specWithinFine v := agreeFine v

end JapanTaxLaw.DisasterReliefPenalty
