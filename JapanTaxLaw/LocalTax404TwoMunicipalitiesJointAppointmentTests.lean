import JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointmentSpec

/- Kernel-decided boundary checks for 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」. -/
namespace JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment
