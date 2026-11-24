import JapanTaxLaw.LocalTax37Over2M

/- Independent spec for 「二百万円を超える場合」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax37Over2M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 2_000_000 ≤ amount

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax37Over2M
