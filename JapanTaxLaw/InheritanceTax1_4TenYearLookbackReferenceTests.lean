import JapanTaxLaw.InheritanceTax1_4TenYearLookbackReferenceSpec

/- Kernel-decided boundary checks for 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」. -/
namespace JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference

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

end JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference
