import JapanTaxLaw.InheritanceGiftRate4M6M

/- Independent spec for 「四百万円を超え六百万円以下の金額」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.InheritanceGiftRate4M6M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 4_000_000 ≤ amount ∧ amount ≤ 6_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.InheritanceGiftRate4M6M
