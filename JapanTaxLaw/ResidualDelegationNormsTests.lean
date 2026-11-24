import JapanTaxLaw.ResidualDelegationNorms
import JapanTaxLaw.ResidualDelegationNormsSpec

/-!
# ResidualDelegationNormsTests — 残余事項の委任
-/
namespace JapanTaxLaw.ResidualDelegationNormsTests
open JapanTaxLaw.ResidualDelegationNorms

theorem residual_spec (e : Enumerated) (m : Matter) : residual e m = JapanTaxLaw.ResidualDelegationNormsSpec.residualSpec e m := by rfl
theorem extend_spec (e1 e2 : Enumerated) : extendEnum e1 e2 = JapanTaxLaw.ResidualDelegationNormsSpec.extendEnumSpec e1 e2 := by rfl
example (e : Enumerated) (m : Matter) (h : e m = true) : residual e m = false := residual_excludes_enumerated e m h
example (e : Enumerated) (m : Matter) : delegateResidual e m = residual e m := delegation_covers_residual e m
example (e1 e2 : Enumerated) (m : Matter) : residual (extendEnum e1 e2) m = (residual e1 m && residual e2 m) := larger_enum_smaller_residual e1 e2 m
example : residualDelegationDeclared = true := residual_delegation_is_declaration

end JapanTaxLaw.ResidualDelegationNormsTests
