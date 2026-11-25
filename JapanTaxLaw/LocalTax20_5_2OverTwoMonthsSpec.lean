import JapanTaxLaw.LocalTax20_5_2OverTwoMonths

/- Independent spec for 「当該理由がなくなつた日から二月を超えてはならない」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax20_5_2OverTwoMonths

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount > 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax20_5_2OverTwoMonths
