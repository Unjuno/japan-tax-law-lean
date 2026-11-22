import JapanTaxLaw.SecurityGuaranteeNorms
import JapanTaxLaw.SecurityGuaranteeNormsSpec

/-!
# SecurityGuaranteeNormsTests — 担保・保証
-/
namespace JapanTaxLaw.SecurityGuaranteeNormsTests

open JapanTaxLaw.SecurityGuaranteeNorms

theorem security_spec (d : Nat) :
    securityForAmount d = JapanTaxLaw.SecurityGuaranteeNormsSpec.securitySpec d := by rfl

theorem may_spec (a : Bool) :
    mayRequireSecurity a = JapanTaxLaw.SecurityGuaranteeNormsSpec.mayRequireSpec a := by rfl

theorem guarantee_spec (p g : Nat) :
    guaranteeCovers p g = JapanTaxLaw.SecurityGuaranteeNormsSpec.guaranteeSpec p g := by rfl

theorem installment_spec (t n : Nat) :
    installment t n = JapanTaxLaw.SecurityGuaranteeNormsSpec.installmentSpec t n := by rfl

example (d : Nat) : securityForAmount d = d := security_equals_deferred d
example : mayRequireSecurity true = true := security_when_authorized
example : mayRequireSecurity false = false := no_security_without_authority
example : guaranteeCovers 5 9 = 5 := guarantee_when_principal_pays
example : guaranteeCovers 0 9 = 9 := guarantee_when_principal_defaults
example : installment 100 0 = none := installment_zero
example : installment 100 4 = some 25 := installment_four
example : securityDeclared = true := security_is_declaration

end JapanTaxLaw.SecurityGuaranteeNormsTests
