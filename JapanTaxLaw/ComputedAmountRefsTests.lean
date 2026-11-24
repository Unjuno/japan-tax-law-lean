import JapanTaxLaw.ComputedAmountRefs
import JapanTaxLaw.ComputedAmountRefsSpec

/-!
# ComputedAmountRefsTests — 算定額の参照
-/
namespace JapanTaxLaw.ComputedAmountRefsTests
open JapanTaxLaw.ComputedAmountRefs

theorem computed_spec (b : Amount) (m : Method) : computedAmount b m = JapanTaxLaw.ComputedAmountRefsSpec.computedAmountSpec b m := by rfl
theorem prescribed_spec (v : Amount) : prescribedAmount v = JapanTaxLaw.ComputedAmountRefsSpec.prescribedAmountSpec v := by rfl
theorem compose_spec (m1 m2 : Method) : composeMethods m1 m2 = JapanTaxLaw.ComputedAmountRefsSpec.composeMethodsSpec m1 m2 := by rfl
example (b : Amount) (m : Method) : computedAmount b m = m b := computed_is_deterministic b m
example (b : Amount) (m : Method) (a c : Amount) (ha : a = b) (hc : c = b) : computedAmount a m = computedAmount c m := computed_same_inputs_same_output b m a c ha hc
example (v : Amount) : prescribedAmount v = v := prescribed_is_identity v
example (m1 m2 : Method) (b : Amount) : composeMethods m1 m2 b = m2 (m1 b) := compose_applies_in_sequence m1 m2 b
example (b : Amount) (m : Method) : computedAmount b m >= 0 := computed_nonnegative b m
example : computedAmountDeclared = true := computed_amount_is_declaration

end JapanTaxLaw.ComputedAmountRefsTests
