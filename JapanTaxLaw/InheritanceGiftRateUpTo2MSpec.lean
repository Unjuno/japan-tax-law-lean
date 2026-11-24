import JapanTaxLaw.InheritanceGiftRateUpTo2M

/-
# InheritanceGiftRateUpTo2MSpec — independent spec, 「二百万円以下の金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.InheritanceGiftRateUpTo2M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount <= 2_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.InheritanceGiftRateUpTo2M
