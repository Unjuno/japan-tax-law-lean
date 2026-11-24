import JapanTaxLaw.LocalTax34IncomeUpTo9M

/- Independent spec for 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34IncomeUpTo9M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := amount <= 9_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax34IncomeUpTo9M
