import JapanTaxLaw.LocalTax72_26FiscalYearOver6Months

/- Independent spec for 「事業年度の期間が六月を超える法人等」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_26FiscalYearOver6Months

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount > 6

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_26FiscalYearOver6Months
