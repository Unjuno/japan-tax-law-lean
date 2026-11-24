import JapanTaxLaw.InheritanceGiftRateOver30M

/-
# InheritanceGiftRateOver30MSpec — independent spec, 「三千万円を超える金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.InheritanceGiftRateOver30M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 30_000_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.InheritanceGiftRateOver30M
