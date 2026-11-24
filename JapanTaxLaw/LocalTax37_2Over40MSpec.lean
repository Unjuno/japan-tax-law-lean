import JapanTaxLaw.LocalTax37_2Over40M

/-
# LocalTax37_2Over40MSpec — independent spec, 「四千万円を超える金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.LocalTax37_2Over40M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 40_000_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax37_2Over40M
