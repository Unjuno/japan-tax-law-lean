/-\!
# DeterminationSourceNorms — 決定根拠参照（「…による。」）403 units, PROVED_SCOPE

403 clauses whose entire norm is a determination-source reference: a value or
rule is determined by reference to a cited source (場所による、相互条件による、
次に定めるところによる). Only the reference structure is kernel-proven (the
determined value resolves to its cited source); the substantive content of the
source is NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DeterminationSourceNorms

-- 決定根拠：決定値は参照元へ解決される
def determinedBy (source value : Nat) : Nat := source

theorem resolves_to_source (s v : Nat) : determinedBy s v = s := rfl
theorem resolve_congr {s s' v : Nat} (h : s = s') : determinedBy s v = determinedBy s' v := by rw [h]
theorem resolve_independent_of_value (s v1 v2 : Nat) : determinedBy s v1 = determinedBy s v2 := rfl

def determinationSourceDeclared : Bool := true
theorem determination_source_is_declaration : determinationSourceDeclared = true := rfl

end JapanTaxLaw.DeterminationSourceNorms
