import JapanTaxLaw.LocalTax69AccompliceUpTo2YearsSpec

/- Kernel-decided boundary checks for 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.LocalTax69AccompliceUpTo2Years

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

end JapanTaxLaw.LocalTax69AccompliceUpTo2Years
