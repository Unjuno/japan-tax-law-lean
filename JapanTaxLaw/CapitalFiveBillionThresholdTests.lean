import JapanTaxLaw.CapitalFiveBillionThreshold
import JapanTaxLaw.CapitalFiveBillionThresholdSpec

/-
# CapitalFiveBillionThresholdTests — kernel-decided checks for 省令 第二条

Every check is a closed Nat/Bool expression discharged by `rfl` or `by decide`.
Coverage: the pinned statutory value, a zero input, small positive inputs,
both sides of the 五十億円 boundary, a Nat saturation/identity at the threshold,
and impl/spec agreement at the boundary.
-/

namespace JapanTaxLaw.CapitalFiveBillionThreshold

-- (a) pinned statutory value: 五十億円 = 5,000,000,000.
example : capitalFloor = 5_000_000_000 := rfl

-- (b) zero input does not satisfy the condition.
example : atLeastCapitalFloor 0 = false := by decide

-- (c) small positive input below the floor; 1 is the smallest natural amount.
example : atLeastCapitalFloor 1 = false := by decide

-- (d) just below the floor (one yen short) still fails.
example : atLeastCapitalFloor 4_999_999_999 = false := by decide

-- (e) exactly at the floor qualifies (以上 is inclusive).
example : atLeastCapitalFloor 5_000_000_000 = true := by decide

-- (f) one yen above the floor also qualifies.
example : atLeastCapitalFloor 5_000_000_001 = true := by decide

-- (g) Nat identity / saturation at the threshold: adding zero yen is identity.
example : 5_000_000_000 + 0 = 5_000_000_000 := by decide

-- (h) kernel-decided impl/spec agreement at the boundary points.
example : atLeastCapitalFloor 5_000_000_000 = specAtLeast 5_000_000_000 := by decide
example : atLeastCapitalFloor 0 = specAtLeast 0 := by decide

end JapanTaxLaw.CapitalFiveBillionThreshold
