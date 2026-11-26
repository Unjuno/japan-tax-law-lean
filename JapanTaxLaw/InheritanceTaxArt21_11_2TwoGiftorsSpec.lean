import JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors

/- Independent spec for 「特定贈与者が二人以上ある場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors
