import JapanTaxLaw.LocalTax166DemandWithin20DaysSpec

/- Kernel-decided boundary checks for 「納税者が納期限までに自動車税に係る地方団体の徴収金を完納しない場合には、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
namespace JapanTaxLaw.LocalTax166DemandWithin20Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 19 := by unfold inScope threshold; decide  -- below_limit
example : inScope 20 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 21 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 19 = true := by decide  -- bool
example : inScopeBool 20 = true := by decide  -- bool
example : inScopeBool 21 = false := by decide  -- bool
example : inScope 20 ↔ specInScope 20 := agree_scope 20
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax166DemandWithin20Days
