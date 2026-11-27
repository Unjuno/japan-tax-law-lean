import JapanTaxLaw.LocalTax72_113PaymentWithin30DaysSpec

/- Kernel-decided boundary checks for 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」. -/
namespace JapanTaxLaw.LocalTax72_113PaymentWithin30Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 29 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 30 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 31 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 29 = true := by decide  -- bool
example : inScopeBool 30 = true := by decide  -- bool
example : inScopeBool 31 = false := by decide  -- bool
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_113PaymentWithin30Days
