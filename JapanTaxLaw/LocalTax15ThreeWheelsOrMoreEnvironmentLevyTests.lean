import JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevySpec

/- Kernel-decided boundary checks for 「施行日以後に取得された三輪以上の軽自動車に対する軽自動車税の環境性能割の適用」. -/
namespace JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 2 := by unfold inScope threshold; decide  -- below_limit
example : inScope 3 := by unfold inScope threshold; decide  -- limit_at (以上 inclusive)
example : inScope 4 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = false := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = true := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy
