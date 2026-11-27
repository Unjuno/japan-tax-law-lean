import JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegationSpec

/- Kernel-decided boundary checks for 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」. -/
namespace JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation
