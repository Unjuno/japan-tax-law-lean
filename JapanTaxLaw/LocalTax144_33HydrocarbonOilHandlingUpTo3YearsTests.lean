import JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3YearsSpec

/- Kernel-decided boundary checks for 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_below
example : inScopeBool 3 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 4 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 3 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 4 := by unfold inScope; decide  -- outside (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years
