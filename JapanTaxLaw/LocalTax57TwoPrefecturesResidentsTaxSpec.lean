import JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax

/- Independent spec for 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax
