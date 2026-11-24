import JapanTaxLaw.InheritanceTaxRateOver600M

/-
# InheritanceTaxRateOver600MSpec — independent spec, 「六億円を超える金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.InheritanceTaxRateOver600M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 600_000_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.InheritanceTaxRateOver600M
