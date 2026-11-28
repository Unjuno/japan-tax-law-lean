import JapanTaxLaw.LocalTax768CommitteeAtLeast6MembersSpec

/- Kernel-decided boundary checks for 「委員の定数は、六人以上十二人以内において定款で定める。」. -/
namespace JapanTaxLaw.LocalTax768CommitteeAtLeast6Members

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 5 = false := by decide  -- threshold_below
example : inScopeBool 6 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 7 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 6 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 5 := by unfold inScope; decide  -- outside (Prop)
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (members : Nat) : inScope members ↔ specInScope members := agree_scope members

end JapanTaxLaw.LocalTax768CommitteeAtLeast6Members
