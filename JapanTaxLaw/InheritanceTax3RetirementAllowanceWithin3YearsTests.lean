import JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3YearsSpec

/- Kernel-decided boundary checks for 「被相続人の死亡後三年以内に支給が確定したもの」. -/
namespace JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- below_limit
example : inScope 3 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- below_limit
example : inScopeBool 3 = true := by decide  -- limit_at
example : inScopeBool 4 = false := by decide  -- above_limit
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years
