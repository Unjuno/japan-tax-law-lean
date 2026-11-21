import JapanTaxLaw.PriorLawNorms
import JapanTaxLaw.PriorLawNormsSpec

/-!
# PriorLawNormsTests — 従前の例による
-/
namespace JapanTaxLaw.PriorLawNormsTests

open JapanTaxLaw.PriorLawNorms

theorem new_spec (d e : Nat) :
    appliesFrom d e = true ↔ JapanTaxLaw.PriorLawNormsSpec.newSpec d e := by
  simp [appliesFrom, JapanTaxLaw.PriorLawNormsSpec.newSpec]

theorem old_spec (d e : Nat) :
    oldForPrior d e = true ↔ JapanTaxLaw.PriorLawNormsSpec.oldSpec d e := by
  simp [oldForPrior, JapanTaxLaw.PriorLawNormsSpec.oldSpec]

theorem year_new_spec (y t : Nat) :
    appliesFromYear y t = true ↔ JapanTaxLaw.PriorLawNormsSpec.yearNewSpec y t := by
  simp [appliesFromYear, JapanTaxLaw.PriorLawNormsSpec.yearNewSpec]

example (e : Nat) : appliesFrom e e = true := new_at_boundary e
example (e : Nat) : oldForPrior e e = false := old_before_boundary e
example (d e : Nat) : ¬ (appliesFrom d e = true ∧ oldForPrior d e = true) := exclusive d e
example (d e : Nat) : appliesFrom d e = true ∨ oldForPrior d e = true := exhaustive d e
example (t : Nat) : appliesFromYear t t = true := year_boundary t
example (t : Nat) : oldForEarlierYear t t = false := old_year_before t
example : priorLawDeclared = true := prior_is_declaration

end JapanTaxLaw.PriorLawNormsTests
