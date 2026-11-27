import JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation

/-
# InheritanceTax10DebtorsTwoOrMoreDelegationSpec — independent spec for 相続税法 Num 10/1/7

Needle 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」.
The implementation uses `threshold ≤ debtors`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ debtors`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation

open JapanTaxLaw.TaxFinance

def specInScope (debtors : Nat) : Prop := 2 ≤ debtors

theorem agree_scope (debtors : Nat) : inScope debtors ↔ specInScope debtors := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation
