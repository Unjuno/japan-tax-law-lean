import JapanTaxLaw.LocalTax34NewLifeInsurance56k

/- Independent spec for 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34NewLifeInsurance56k

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 56_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax34NewLifeInsurance56k
