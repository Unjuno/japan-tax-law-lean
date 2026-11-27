import JapanTaxLaw.LocalTax15_8CancellationWithin3YearsSpec

/- Kernel-decided boundary checks for 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」. -/
namespace JapanTaxLaw.LocalTax15_8CancellationWithin3Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = false := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax15_8CancellationWithin3Years
