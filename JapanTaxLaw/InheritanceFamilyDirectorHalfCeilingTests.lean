import JapanTaxLaw.InheritanceFamilyDirectorHalfCeilingSpec

/- Kernel-decided boundary checks for 「被相続人の相続開始の直前における当該被相続人に係る同族理事の数の理事の総数のうちに占める割合が二分の一を超えること。」. -/
namespace JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 4 = false := by decide  -- zero
example : inScopeBool 1 4 = false := by decide  -- threshold_below / small_input
example : inScopeBool 2 4 = false := by decide  -- threshold_at (STRICT: equality excluded)
example : inScopeBool 3 4 = true := by decide  -- threshold_above
example : inScope 3 4 := by unfold inScope; decide  -- threshold_above (Prop)
example : ¬ inScope 2 4 := by unfold inScope; decide  -- threshold_at (Prop)
example : inScope 3 4 ↔ specInScope 3 4 := agree_scope 3 4
example (familyDirectors allDirectors : Nat) : inScope familyDirectors allDirectors ↔ specInScope familyDirectors allDirectors := agree_scope familyDirectors allDirectors

end JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling
