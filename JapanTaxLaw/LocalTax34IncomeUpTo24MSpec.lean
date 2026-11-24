import JapanTaxLaw.LocalTax34IncomeUpTo24M
/- Independent spec for 「当該納税義務者の前年の合計所得金額が二千四百万円以下である場合」: statutory literals only; universal
axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34IncomeUpTo24M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := amount <= 24_000_000
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax34IncomeUpTo24M
