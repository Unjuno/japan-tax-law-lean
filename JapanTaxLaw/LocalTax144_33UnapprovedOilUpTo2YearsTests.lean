import JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2YearsSpec

/- Kernel-decided boundary checks for 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」. -/
namespace JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 1 = true := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 3 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 2 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 3 := by unfold inScope; decide  -- outside (Prop)
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years
