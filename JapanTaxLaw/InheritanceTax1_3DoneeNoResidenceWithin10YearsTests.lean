import JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10YearsSpec

/- Kernel-decided boundary checks for 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」. -/
namespace JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9 = true := by decide  -- bool
example : inScopeBool 10 = true := by decide  -- bool
example : inScopeBool 11 = false := by decide  -- bool
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years
