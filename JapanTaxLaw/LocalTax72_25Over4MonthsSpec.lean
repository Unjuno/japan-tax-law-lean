import JapanTaxLaw.LocalTax72_25Over4Months

/- Independent spec for 「当該道府県知事が指定する四月を超える月数の期間内」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_25Over4Months

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := 4 < amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_25Over4Months
