import JapanTaxLaw.CorporateOwnershipThird
import JapanTaxLaw.CorporateOwnershipThirdSpec

/-
# CorporateOwnershipThirdTests — kernel-decided boundary checks for 407M50000008033 第二条

Every check below is a closed Nat/Bool proposition decided by the kernel
(`by decide`) or an application of a universal theorem. The statutory divisor
is 3, so the boundary grid exercises L-1 = 2, L = 3 and L+1 = 4, together with
zero, small positive inputs and exact larger multiples (3, 9).

STRICT boundary note: 三分の一を超える means 3 * owned > total, NOT >=.
At (1,3) and (3,9) the ratio is exactly 1/3 and the result is false;
at (2,3), (4,9) and (1,2) it strictly exceeds 1/3 and the result is true;
at (1,4) the ratio is 1/4, below 1/3.

Pinned source: law 407M50000008033, revision 407M50000008033_20040401_416M60000008074,
sha256 8b5ef29f2c751866b7e7f00dd7d5aea22a1c935df6173886c9e60572574ba216,
Article Num 2, needle「その発行済株式の総数又は出資金額若しくは拠出された金額の三分の一を超える数又は金額が法人税法（昭和二十二年法律第二十八号）別表第一第一号に掲げる法人により所有され、又は出資若しくは拠出をされている法人」
-/

namespace JapanTaxLaw.CorporateOwnershipThird

-- Boundary grid on the implementation.
example : exceedsOneThird 1 3 = false := by decide
example : exceedsOneThird 2 3 = true := by decide
example : exceedsOneThird 3 9 = false := by decide
example : exceedsOneThird 4 9 = true := by decide
example : exceedsOneThird 1 4 = false := by decide
example : exceedsOneThird 1 2 = true := by decide
example : exceedsOneThird 0 3 = false := by decide

-- The same grid on the independent spec.
example : specExceeds 1 3 = false := by decide
example : specExceeds 2 3 = true := by decide
example : specExceeds 3 9 = false := by decide
example : specExceeds 4 9 = true := by decide
example : specExceeds 1 4 = false := by decide
example : specExceeds 1 2 = true := by decide
example : specExceeds 0 3 = false := by decide

-- Impl/spec agreement at the boundary points.
example : exceedsOneThird 1 3 = specExceeds 1 3 := by decide
example : exceedsOneThird 2 3 = specExceeds 2 3 := by decide
example : exceedsOneThird 3 9 = specExceeds 3 9 := by decide
example : exceedsOneThird 4 9 = specExceeds 4 9 := by decide
example : exceedsOneThird 1 4 = specExceeds 1 4 := by decide
example : exceedsOneThird 1 2 = specExceeds 1 2 := by decide
example : exceedsOneThird 0 3 = specExceeds 0 3 := by decide

-- Divisor value and universal agreement (theorem-as-proof).
example : ownershipDivisor = 3 := ownership_divisor_three
example : ownershipDivisor = specDivisor := agreeDivisor
example : specDivisor = 3 := by decide
example (owned : Nat) (total : Nat) : exceedsOneThird owned total = specExceeds owned total := agreeExceeds owned total

-- The named implementation theorems apply at every boundary point.
example : exceedsOneThird 1 3 = false := exceeds_one_of_three_false
example : exceedsOneThird 2 3 = true := exceeds_two_of_three_true
example : exceedsOneThird 3 9 = false := exceeds_three_of_nine_false
example : exceedsOneThird 4 9 = true := exceeds_four_of_nine_true
example : exceedsOneThird 1 4 = false := exceeds_one_of_four_false
example : exceedsOneThird 1 2 = true := exceeds_one_of_two_true

end JapanTaxLaw.CorporateOwnershipThird
