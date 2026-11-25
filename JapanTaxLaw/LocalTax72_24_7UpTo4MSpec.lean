import JapanTaxLaw.LocalTax72_24_7UpTo4M

/- Independent spec for 「各事業年度の所得のうち年四百万円以下の金額」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_24_7UpTo4M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount ≤ 4_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_24_7UpTo4M
