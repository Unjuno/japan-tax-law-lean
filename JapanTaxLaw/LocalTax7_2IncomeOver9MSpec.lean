import JapanTaxLaw.LocalTax7_2IncomeOver9M

/- Independent spec for 「九百万円を超える金額」: statutory literals only, no impl identifier.
Universal axiom-free bridge; boundaries live in Tests. 「を超え」 is STRICT. -/
namespace JapanTaxLaw.LocalTax7_2IncomeOver9M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := 9_000_000 < amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax7_2IncomeOver9M
