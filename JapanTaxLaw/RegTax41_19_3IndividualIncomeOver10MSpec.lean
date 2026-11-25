import JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
/- Independent spec for 「ただし、当該個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」: successor form, no impl identifier. -/
namespace JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
open JapanTaxLaw.TaxFinance
def specInScope (amount : Money) : Prop := Nat.succ 10_000_000 ≤ amount
theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h
end JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
