import JapanTaxLaw.LocalTax34DisasterExpense50k

/- Independent spec for 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34DisasterExpense50k

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 50_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax34DisasterExpense50k
