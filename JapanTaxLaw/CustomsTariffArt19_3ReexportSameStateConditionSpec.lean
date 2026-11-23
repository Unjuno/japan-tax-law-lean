import JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition

/-!
# CustomsTariffArt19_3ReexportSameStateConditionSpec — independent spec 関税定率法 第十九条の三

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十九条の三 caption — CONDITION 「（輸入時と同一状態で再輸出される場合の戻し税等）」.
Normative unit: NORM|760c6bfcb0b3bc22f09624b5e53c32fb918c0b6587084cfe8b2fa44a7185b523

The implementation is a Bool function `withinCondition`. The independent spec
states the same condition as a PROPOSITIONAL conjunction of the case and the
listed relief kind, representationally distinct. Universal agreement is proved
by exhaustive cases with rfl/cases — no decide/simp/propext/Classical.choice.

Not modelled: operative article text, re-export mechanics, 等 extensions,
legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition

/-- Independent spec: the caption condition as a propositional predicate. -/
def SpecWithinCondition (c : ExportCase) (r : Relief) : Prop :=
  c = ExportCase.reexportSameState ∧ r = Relief.drawback

/-- Universal agreement between the Bool implementation and the spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_within_condition (c : ExportCase) (r : Relief) :
    (withinCondition c r = true) ↔ SpecWithinCondition c r := by
  cases c
  · cases r
    · constructor
      · intro _h
        exact ⟨rfl, rfl⟩
      · intro _h
        rfl
    · constructor
      · intro h
        cases h
      · intro h
        cases h.2
  · constructor
    · intro h
      cases h
    · intro h
      cases h.1

end JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition
