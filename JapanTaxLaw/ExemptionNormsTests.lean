import JapanTaxLaw.ExemptionNorms
import JapanTaxLaw.ExemptionNormsSpec

/-!
# ExemptionNormsTests — 免除
-/
namespace JapanTaxLaw.ExemptionNormsTests
open JapanTaxLaw.ExemptionNorms

theorem exempt_spec (l w : Amount) : exempt l w = JapanTaxLaw.ExemptionNormsSpec.exemptSpec l w := by rfl
theorem compose_spec (l w1 w2 : Amount) : composeExemptions l w1 w2 = JapanTaxLaw.ExemptionNormsSpec.composeExemptionsSpec l w1 w2 := by rfl
example (l : Amount) : exempt l l = 0 := full_exemption_extinguishes l
example (l w : Amount) : exempt l w <= l := exemption_bounded l w
example (l : Amount) : exempt l 0 = l := zero_exemption_noop l
example (l w : Amount) : exemptTwice l w = l - (w + w) := exemption_additive l w
example (l w1 w2 : Amount) : composeExemptions l w1 w2 = l - w1 - w2 := exemptions_compose l w1 w2
example : exemptionDeclared = true := exemption_is_declaration

end JapanTaxLaw.ExemptionNormsTests
