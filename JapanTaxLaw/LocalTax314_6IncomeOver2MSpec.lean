import JapanTaxLaw.LocalTax314_6IncomeOver2M

/- Independent spec for 「当該納税義務者の合計課税所得金額が二百万円を超える場合」: statutory literals only, no implementation
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax314_6IncomeOver2M

open JapanTaxLaw.TaxFinance

/-- Independently transcribed statutory condition (literals only). -/
def specInScope (amount : Money) : Prop := Nat.succ 2_000_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax314_6IncomeOver2M
