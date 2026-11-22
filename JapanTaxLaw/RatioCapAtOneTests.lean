import JapanTaxLaw.RatioCapAtOne
import JapanTaxLaw.RatioCapAtOneSpec

/-
# RatioCapAtOne tests — 阪神・淡路大震災…法律施行令 第八条の三 の kernel-decided 検証

Pinned: law 407CO0000000029 / revision 407CO0000000029_20110101_422CO0000000058.
All checks are closed Nat expressions discharged by `by decide` (or by applying
an already kernel-checked theorem). Coverage: zero, small inputs, the inclusive
boundary at 一 (=1, with L-1=0 / L=1 / L+1=2), ratio above / below / exactly one,
large inputs, and impl/spec agreement. This is a finite smoke suite; universality
is carried by agreeCap / agreeCapped in the independent spec module.
-/

namespace JapanTaxLaw.RatioCapAtOne

-- cap value 一 = 1
example : capValue = 1 := by decide
example : capValue = 1 := capValue_is_one

-- required concrete boundaries (above / below / at one / zero)
example : cappedRatio 5 3 = 3 := by decide
example : cappedRatio 3 5 = 3 := by decide
example : cappedRatio 3 3 = 3 := by decide
example : cappedRatio 0 5 = 0 := by decide

-- the same four propositions, proved by the kernel-checked theorems directly
example : cappedRatio 5 3 = 3 := cappedRatio_over_one
example : cappedRatio 3 5 = 3 := cappedRatio_below_one
example : cappedRatio 3 3 = 3 := cappedRatio_at_one
example : cappedRatio 0 5 = 0 := cappedRatio_zero

-- small inputs and statutory literal L=1 boundaries (L-1 = 0, L = 1, L+1 = 2)
example : cappedRatio 1 1 = 1 := by decide
example : cappedRatio 2 1 = 1 := by decide
example : cappedRatio 1 2 = 1 := by decide
example : cappedRatio 0 1 = 0 := by decide
example : cappedRatio 2 3 = 2 := by decide

-- large inputs (inclusive clamp still holds)
example : cappedRatio 1_000_000 999_999 = 999_999 := by decide

-- impl / independent-spec agreement at concrete points
example : capValue = specCap := by decide
example : cappedRatio 5 3 = specCapped 5 3 := by decide
example : cappedRatio 3 5 = specCapped 3 5 := by decide
example : cappedRatio 3 3 = specCapped 3 3 := by decide
example : cappedRatio 0 5 = specCapped 0 5 := by decide

-- agreement via the universal bridge theorems (theorem applied, not used as a type)
example : capValue = specCap := agreeCap
example : cappedRatio 7 4 = specCapped 7 4 := agreeCapped 7 4

end JapanTaxLaw.RatioCapAtOne
