import JapanTaxLaw.LocalTax72_54DecisionWithin60DaysSpec

/- Kernel-decided boundary checks for 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」. -/
namespace JapanTaxLaw.LocalTax72_54DecisionWithin60Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 59 := by unfold inScope threshold; decide  -- below_limit
example : inScope 60 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 61 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 59 = true := by decide  -- bool
example : inScopeBool 60 = true := by decide  -- bool
example : inScopeBool 61 = false := by decide  -- bool
example : inScope 60 ↔ specInScope 60 := agree_scope 60
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_54DecisionWithin60Days
