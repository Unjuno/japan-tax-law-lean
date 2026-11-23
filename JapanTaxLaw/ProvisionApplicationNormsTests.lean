import JapanTaxLaw.ProvisionApplicationNorms
import JapanTaxLaw.ProvisionApplicationNormsSpec

/-!
# ProvisionApplicationNormsTests — 規定適用
-/
namespace JapanTaxLaw.ProvisionApplicationNormsTests
open JapanTaxLaw.ProvisionApplicationNorms

theorem applies_spec (p s : Nat) : applies p s ↔ JapanTaxLaw.ProvisionApplicationNormsSpec.appliesSpec p s := by rfl
theorem mutatis_spec (s t : Nat) : mutatis s t ↔ JapanTaxLaw.ProvisionApplicationNormsSpec.mutatisSpec s t := by rfl
example (p : Nat) : applies p p := applies_refl p
example {p s p' : Nat} (h : p = p') : applies p s ↔ applies p' s := applies_congr h
example (s t : Nat) (h : s != t) : mutatis s t := mutatis_not_self s t h
example {s t : Nat} (h : mutatis s t) : s != t := mutatis_implies_distinct h
example : provisionApplicationDeclared = true := provision_application_is_declaration

end JapanTaxLaw.ProvisionApplicationNormsTests
