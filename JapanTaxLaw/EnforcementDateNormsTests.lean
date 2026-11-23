import JapanTaxLaw.EnforcementDateNorms
import JapanTaxLaw.EnforcementDateNormsSpec

/-!
# EnforcementDateNormsTests — 施行日
-/
namespace JapanTaxLaw.EnforcementDateNormsTests
open JapanTaxLaw.EnforcementDateNorms

theorem effective_spec (n d : Nat) : isEffective n d = JapanTaxLaw.EnforcementDateNormsSpec.isEffectiveSpec n d := by
  unfold isEffective JapanTaxLaw.EnforcementDateNormsSpec.isEffectiveSpec
  by_cases h : d <= n <;> simp [h]
example (d : Nat) : isEffective d d = true := effective_on d
example (d n : Nat) (h : d <= n) : isEffective n d = true := effective_after d n h
example (d n : Nat) (h : n < d) : isEffective n d = false := not_effective_before d n h
example {d d' n : Nat} (h : d = d') : isEffective n d = isEffective n d' := effective_congr h
example : enforcementDateDeclared = true := enforcement_date_is_declaration

end JapanTaxLaw.EnforcementDateNormsTests
