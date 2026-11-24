import JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M

/-
# InheritanceGiftTaxRateBracket3M4MSpec — independent spec, 相続税法 第21_7(1)

The independent spec writes the strict lower bound in successor form
(`Nat.succ 3_000_000 ≤ amount`) together with `amount ≤ 4_000_000`; it reuses no
implementation identifier in its formula. The equivalence bridge is a
universal, axiom-free kernel theorem. Boundary examples live in the Tests
module so this module's literals are only the two statutory bounds.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M

open JapanTaxLaw.TaxFinance

def specInBracket (amount : Money) : Prop :=
  Nat.succ 3_000_000 ≤ amount ∧ amount ≤ 4_000_000

theorem agree_in_bracket (amount : Money) :
    inBracket amount ↔ specInBracket amount := by
  unfold inBracket specInBracket lowerExclusiveYen upperInclusiveYen
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M
