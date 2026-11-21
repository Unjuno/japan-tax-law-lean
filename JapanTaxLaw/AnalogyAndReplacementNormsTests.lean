import JapanTaxLaw.AnalogyAndReplacementNorms
import JapanTaxLaw.AnalogyAndReplacementNormsSpec

/-!
# AnalogyAndReplacementNormsTests — 準用・読替・適用
-/
namespace JapanTaxLaw.AnalogyAndReplacementNormsTests

open JapanTaxLaw.AnalogyAndReplacementNorms

theorem analogy_spec (t : Nat) :
    applyAnalogy t = JapanTaxLaw.AnalogyAndReplacementNormsSpec.analogySpec t := by rfl

theorem substitute_spec (x s d : Nat) :
    substitute x s d = JapanTaxLaw.AnalogyAndReplacementNormsSpec.substituteSpec x s d := by rfl

theorem apply_spec (c : Bool) :
    applyRule c = JapanTaxLaw.AnalogyAndReplacementNormsSpec.applySpec c := by rfl

example (t : Nat) : applyAnalogy t = t := analogy_identity t
example (s d : Nat) : substitute s s d = d := substitute_matched s d
example (x s d : Nat) (h : x ≠ s) : substitute x s d = x := substitute_unaffected x s d h
example : applyRule true = true := applied_when_met
example : applyRule false = false := not_applied_when_unmet
example (a b : Nat) : composeRef a b = b := compose_returns_target a b
example : relationalDeclared = true := relational_is_declaration

end JapanTaxLaw.AnalogyAndReplacementNormsTests
