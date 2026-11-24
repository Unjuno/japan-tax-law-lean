import JapanTaxLaw.AppropriationNorms
import JapanTaxLaw.AppropriationNormsSpec

/-!
# AppropriationNormsTests — 充当
-/
namespace JapanTaxLaw.AppropriationNormsTests
open JapanTaxLaw.AppropriationNorms

theorem appropriate_spec (l a : Amount) : appropriate l a = JapanTaxLaw.AppropriationNormsSpec.appropriateSpec l a := by rfl
theorem total_spec (a b : Amount) : totalApplied a b = JapanTaxLaw.AppropriationNormsSpec.totalAppliedSpec a b := by rfl
example (l : Amount) : appropriate l l = 0 := full_appropriation_zeroes l
example (l a : Amount) : appropriate l a <= l := appropriation_bounded l a
example (l2 applied : Amount) : (chainAppropriate applied l2 applied).1 = 0 := full_first_leaves_second l2 applied
example (a b : Amount) : totalApplied a b = a + b := total_is_sum a b
example : appropriationDeclared = true := appropriation_is_declaration

end JapanTaxLaw.AppropriationNormsTests
