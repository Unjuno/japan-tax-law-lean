import JapanTaxLaw.CombinedRegistrationRequest
import JapanTaxLaw.CombinedRegistrationRequestSpec

/-
# CombinedRegistrationRequestTests — kernel-decided boundary checks for art. 3

All examples are closed Bool/Nat expressions checked by `by decide`.
Coverage: zero input (count 0), small positive inputs (1/2/3), the
different-office identity (always false) and count >= 2 (always true), plus a
Nat saturation identity at the statutory threshold 二箇 (specMinProperties = 2).
-/

namespace JapanTaxLaw.CombinedRegistrationRequest

-- (a) zero input: count 0 is below 二箇, so never combinable.
example : canCombineRequest true 0 = false := by decide
example : canCombineRequest false 0 = false := by decide

-- (b) small positive inputs: 1 is below the threshold, 2 and 3 are at/above it.
example : canCombineRequest true 1 = false := by decide
example : canCombineRequest true 2 = true := by decide
example : canCombineRequest true 3 = true := by decide

-- (c) identity / saturation of the office flag: different office is always
--     false (even at count >= 2); same office stays true as count grows.
example : canCombineRequest false 2 = false := by decide
example : canCombineRequest false 5 = false := by decide
example : canCombineRequest true 100 = true := by decide

-- (d) Nat identity at the statutory threshold 二箇 (= 2): truncated
--     subtraction saturates to 0. Kernel-decided Nat evidence, not a new rule.
example : specMinProperties - 2 = 0 := by decide

-- (e) impl/spec agreement at the boundary points (kernel-decided, Bool).
example : canCombineRequest true 2 = specCanCombine true 2 := by decide
example : canCombineRequest false 5 = specCanCombine false 5 := by decide

end JapanTaxLaw.CombinedRegistrationRequest
