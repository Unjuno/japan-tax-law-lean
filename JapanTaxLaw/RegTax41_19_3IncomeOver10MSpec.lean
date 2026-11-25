import JapanTaxLaw.RegTax41_19_3IncomeOver10M
/- Independent spec for 「ただし、当該特定個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」: statutory literal only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.RegTax41_19_3IncomeOver10M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := Nat.succ 10_000_000 ≤ amount
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h
end JapanTaxLaw.RegTax41_19_3IncomeOver10M
