import JapanTaxLaw.LocalTax71_14MidTier

/-
# LocalTax71_14MidTierSpec — independent spec, 「五十万円を超え三百万円以下の部分に相当する金額」

Independent formula uses only statutory literals and no implementation
identifier. Universal axiom-free bridge; boundary examples live in Tests.
-/

namespace JapanTaxLaw.LocalTax71_14MidTier

open JapanTaxLaw.TaxFinance

def specInScope (amount : Money) : Prop := Nat.succ 500_000 ≤ amount ∧ amount ≤ 3_000_000

theorem agree_scope (amount : Money) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.LocalTax71_14MidTier
