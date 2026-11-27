import JapanTaxLaw.LocalTax22_29ProsecutionWithin20DaysSpec

/- Kernel-decided boundary checks for 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」. -/
namespace JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 19 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 20 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 21 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 19 = true := by decide  -- bool
example : inScopeBool 20 = true := by decide  -- bool
example : inScopeBool 21 = false := by decide  -- bool
example : inScope 20 ↔ specInScope 20 := agree_scope 20
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days
