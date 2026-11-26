import JapanTaxLaw.LocalTax314_2PensionOver7Man

/- Independent spec for 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax314_2PensionOver7Man

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := 7 < amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax314_2PensionOver7Man
