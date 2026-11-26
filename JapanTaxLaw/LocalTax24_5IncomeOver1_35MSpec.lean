import JapanTaxLaw.LocalTax24_5IncomeOver1_35M

/- Independent spec for 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）」: statutory literals only, no implementation
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax24_5IncomeOver1_35M

open JapanTaxLaw.TaxFinance

/-- Independently transcribed statutory condition (literals only). -/
def specInScope (amount : Money) : Prop := Nat.succ 1_350_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax24_5IncomeOver1_35M
