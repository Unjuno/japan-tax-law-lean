import JapanTaxLaw.LocalTax34SpouseOver13M

/- Independent spec for 「前年の合計所得金額が百三十万円を超える配偶者」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34SpouseOver13M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 1_300_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax34SpouseOver13M
