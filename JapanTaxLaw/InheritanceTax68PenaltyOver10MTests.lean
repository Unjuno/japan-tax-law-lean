import JapanTaxLaw.InheritanceTax68PenaltyOver10MSpec

/- Kernel-decided boundary checks for 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」. -/
namespace JapanTaxLaw.InheritanceTax68PenaltyOver10M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 9999999 := by unfold inScope threshold; decide  -- below_limit
example : ¬ inScope 10000000 := by unfold inScope threshold; decide  -- limit_at (を超える STRICT: excluded)
example : inScope 10000001 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 9999999 = false := by decide  -- bool
example : inScopeBool 10000000 = false := by decide  -- bool
example : inScopeBool 10000001 = true := by decide  -- bool
example : inScope 10000000 ↔ specInScope 10000000 := agree_scope 10000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax68PenaltyOver10M
