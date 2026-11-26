import JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCountSpec

/- Kernel-decided boundary checks for 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」. -/
namespace JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1 = false := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at
example : inScopeBool 3 = true := by decide  -- threshold_above
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount
