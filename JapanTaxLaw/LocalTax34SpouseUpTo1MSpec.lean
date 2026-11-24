import JapanTaxLaw.LocalTax34SpouseUpTo1M
/- Independent spec for 「前年の合計所得金額が百万円以下である配偶者」: statutory literals only; universal
axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34SpouseUpTo1M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := amount <= 1_000_000
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax34SpouseUpTo1M
