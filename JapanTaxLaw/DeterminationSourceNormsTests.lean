import JapanTaxLaw.DeterminationSourceNorms
import JapanTaxLaw.DeterminationSourceNormsSpec

/-!
# DeterminationSourceNormsTests — 決定根拠参照
-/
namespace JapanTaxLaw.DeterminationSourceNormsTests
open JapanTaxLaw.DeterminationSourceNorms

theorem determinedBy_spec (s v : Nat) :
    determinedBy s v = JapanTaxLaw.DeterminationSourceNormsSpec.determinedBySpec s v := rfl
example (s v : Nat) : determinedBy s v = s := resolves_to_source s v
example {s s' v : Nat} (h : s = s') : determinedBy s v = determinedBy s' v := resolve_congr h
example (s v1 v2 : Nat) : determinedBy s v1 = determinedBy s v2 := resolve_independent_of_value s v1 v2
example : determinationSourceDeclared = true := determination_source_is_declaration

end JapanTaxLaw.DeterminationSourceNormsTests
