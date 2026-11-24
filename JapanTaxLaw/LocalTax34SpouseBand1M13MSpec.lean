import JapanTaxLaw.LocalTax34SpouseBand1M13M

/- Independent spec for 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax34SpouseBand1M13M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 1_000_000 ≤ amount ∧ amount ≤ 1_300_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.LocalTax34SpouseBand1M13M
