import JapanTaxLaw.InheritanceTaxRateBracket30_50

/-!
# InheritanceTaxRateBracket30_50Spec — independent spec for 相続税法 第十六条(1)

Law id: 325AC0000000073; revision 325AC0000000073_20260401_506AC0000000008;
article 第十六条(1) table cell 「三千万円を超え五千万円以下の金額」.
Normative unit: NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b

The independent spec writes its OWN bounds (`Nat.succ 30_000_000 ≤ x ∧
x ≤ 50_000_000`) and reuses no implementation identifier. The equivalence
bridge is a universal, axiom-free kernel theorem. Boundary examples live in
the Tests module so this module's literals are only the two statutory bounds.

Not modelled: the bracket's rate, other brackets, base computation, deductions,
other rows of 第十六条の表, and other paragraphs.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket30_50

open JapanTaxLaw.TaxFinance

/-- Independent successor-form lower bound with inclusive upper. -/
def specInBracket (taxableValue : Money) : Prop :=
  Nat.succ 30_000_000 ≤ taxableValue ∧ taxableValue ≤ 50_000_000

/-- Correspondence for ALL taxable values (kernel-checked, axiom-free). -/
theorem agree_bracket (taxableValue : Money) :
    inBracket taxableValue ↔ specInBracket taxableValue := by
  unfold inBracket specInBracket lowerBoundYen upperBoundYen
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.InheritanceTaxRateBracket30_50
