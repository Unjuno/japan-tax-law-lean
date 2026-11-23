import JapanTaxLaw.SavingsClauseNorms
import JapanTaxLaw.SavingsClauseNormsSpec

/-!
# SavingsClauseNormsTests — 経過措置（効力継続）
-/
namespace JapanTaxLaw.SavingsClauseNormsTests
open JapanTaxLaw.SavingsClauseNorms

theorem in_force_spec (r s : Bool) :
    inForce r s = JapanTaxLaw.SavingsClauseNormsSpec.inForceSpec r s := by
  cases r <;> cases s <;> rfl
example : inForce true true = true := saved_continues
example : inForce true false = false := unsaved_expires
example (s : Bool) : inForce false s = true := not_repealed_continues s
example (s : Bool) : inForce true s = true ↔ s = true := continuation_iff_saved s
example : savingsClauseDeclared = true := savings_clause_is_declaration

end JapanTaxLaw.SavingsClauseNormsTests
