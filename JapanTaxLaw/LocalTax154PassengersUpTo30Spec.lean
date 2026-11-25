import JapanTaxLaw.LocalTax154PassengersUpTo30

/- Independent spec for 「（ｉ）　乗車定員が三十人以下のもの」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax154PassengersUpTo30

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≤ 30

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax154PassengersUpTo30
