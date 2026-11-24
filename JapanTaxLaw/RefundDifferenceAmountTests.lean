import JapanTaxLaw.RefundDifferenceAmount
import JapanTaxLaw.RefundDifferenceAmountSpec

/-
# RefundDifferenceAmount tests — 所得税額の還付 第六条 の kernel-decided 検証

Pinned: law 347M50000040042 / revision 347M50000040042_20251231_507M60000040072.
All checks are closed Nat expressions discharged by `by decide`.
Coverage: the four statutory residual cases, zero input, small positives,
threshold just-below / at / just-above the literal 3, and impl/spec agreement.
Finite smoke suite; universality is established by the spec bridges.
-/

namespace JapanTaxLaw.RefundDifferenceAmount

-- 第三号 = 3
example : item3Label = 3 := by decide

-- statutory residual cases (100 - 40 = 60; 40 - 100 saturates to 0;
-- equal amounts give 0; zero input gives 0)
example : refundResidual 100 40 = 60 := by decide
example : refundResidual 40 100 = 0 := by decide
example : refundResidual 50 50 = 0 := by decide
example : refundResidual 0 0 = 0 := by decide

-- small inputs and the boundary of the statutory literal 3
-- (2 = L-1 threshold_below, 3 = L threshold_at, 4 = L+1 threshold_above)
example : refundResidual 2 1 = 1 := by decide
example : refundResidual 3 1 = 2 := by decide
example : refundResidual 4 1 = 3 := by decide
example : refundResidual 3 3 = 0 := by decide

-- impl / independent-spec agreement at several points
example : item3Label = specItem3 := by decide
example : refundResidual 100 40 = specResidual 100 40 := by decide
example : refundResidual 40 100 = specResidual 40 100 := by decide
example : refundResidual 3 1 = specResidual 3 1 := by decide
example : refundResidual 0 0 = specResidual 0 0 := by decide

end JapanTaxLaw.RefundDifferenceAmount
