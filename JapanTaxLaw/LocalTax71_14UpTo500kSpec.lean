import JapanTaxLaw.LocalTax71_14UpTo500k

/- Independent spec for 「五十万円以下の部分に相当する金額」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax71_14UpTo500k

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount <= 500_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax71_14UpTo500k
