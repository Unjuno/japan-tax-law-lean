import JapanTaxLaw.LocalTax423CommitteeMin3

/- Independent spec for 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax423CommitteeMin3

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 3

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax423CommitteeMin3
