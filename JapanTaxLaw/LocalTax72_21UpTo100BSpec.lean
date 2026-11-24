import JapanTaxLaw.LocalTax72_21UpTo100B

/- Independent spec for 「千億円以下の金額」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_21UpTo100B

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount <= 100_000_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_21UpTo100B
