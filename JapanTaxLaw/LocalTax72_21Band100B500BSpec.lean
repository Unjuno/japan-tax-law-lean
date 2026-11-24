import JapanTaxLaw.LocalTax72_21Band100B500B

/- Independent spec for 「千億円を超え五千億円以下の金額」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_21Band100B500B

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 100_000_000_000 ≤ amount ∧ amount ≤ 500_000_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.LocalTax72_21Band100B500B
