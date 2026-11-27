import JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4Spec

/- Kernel-decided boundary checks for 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」. -/
namespace JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 4 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScopeBool 4 = true := by decide  -- bool
example : inScopeBool 5 = true := by decide  -- bool
example : inScope 4 ↔ specInScope 4 := agree_scope 4
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4
