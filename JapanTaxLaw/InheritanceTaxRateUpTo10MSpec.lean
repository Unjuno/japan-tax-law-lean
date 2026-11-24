import JapanTaxLaw.InheritanceTaxRateUpTo10M

/-
# InheritanceTaxRateUpTo10MSpec — independent spec, 「千万円以下の金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.InheritanceTaxRateUpTo10M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount <= 10_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.InheritanceTaxRateUpTo10M
