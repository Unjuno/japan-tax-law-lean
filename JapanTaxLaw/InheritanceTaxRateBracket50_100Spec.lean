import JapanTaxLaw.InheritanceTaxRateBracket50_100

/-
# InheritanceTaxRateBracket50_100Spec — independent spec, 相続税法 第十六条(1)

Normative unit: NORM|df94f143188b89690e03047e002c6a375e81d8d3c81f4313c1995b484310badc
Pinned clause: 「五千万円を超え一億円以下の金額」

The independent spec writes its own bounds in successor form
(`Nat.succ 50_000_000 ≤ amount ∧ amount ≤ 100_000_000`) and reuses no
implementation identifier. The equivalence bridge is universal and axiom-free.
Boundary examples live in the Tests module so this module's literals are only
the two statutory bounds.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket50_100

open JapanTaxLaw.TaxFinance

def specInBracket (amount : Money) : Prop :=
  Nat.succ 50_000_000 ≤ amount ∧ amount ≤ 100_000_000

theorem agree_in_bracket (amount : Money) :
    inBracket amount ↔ specInBracket amount := by
  unfold inBracket specInBracket lowerExclusiveYen upperInclusiveYen
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.InheritanceTaxRateBracket50_100
