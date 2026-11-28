import JapanTaxLaw.LocalTax192MiningTaxEvasionUpTo5YearsSpec

/- Kernel-decided boundary checks for 「偽りその他不正の行為により鉱区税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.LocalTax192MiningTaxEvasionUpTo5Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 4 = true := by decide  -- threshold_below
example : inScopeBool 5 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 6 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 5 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 6 := by unfold inScope; decide  -- outside (Prop)
example : inScope 5 ↔ specInScope 5 := agree_scope 5
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax192MiningTaxEvasionUpTo5Years
