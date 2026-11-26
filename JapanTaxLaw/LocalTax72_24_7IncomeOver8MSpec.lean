import JapanTaxLaw.LocalTax72_24_7IncomeOver8M

/- Independent spec for 「各事業年度の所得のうち年八百万円を超える金額」: statutory literals only,
no impl identifier. Universal axiom-free bridge; boundaries live in Tests. 「を超え」 is STRICT. -/
namespace JapanTaxLaw.LocalTax72_24_7IncomeOver8M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := 8_000_000 < amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_24_7IncomeOver8M
