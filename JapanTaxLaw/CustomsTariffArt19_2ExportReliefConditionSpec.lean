import JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition

/-!
# CustomsTariffArt19_2ExportReliefConditionSpec — independent spec 関税定率法 第十九条の二

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十九条の二 caption — CONDITION 「（課税原料品等による製品を輸出した場合の免税又は戻し税等）」.
Normative unit: NORM|94f8ac863c981996cb5c2c94d16ae32907d432241027cf14c7a43894887c873a

The implementation is a Bool function `withinCondition`. The independent spec
states the same condition as a PROPOSITIONAL conjunction of the case and a
disjunction of the two relief kinds, representationally distinct. Universal
agreement is proved by exhaustive cases with rfl/cases/rcases — no
decide/simp/propext/Classical.choice.

Not modelled: operative article text, substantive relief mechanics, 等 extensions,
legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition

/-- Independent spec: the caption condition as a propositional predicate. -/
def SpecWithinCondition (c : ProductCase) (r : Relief) : Prop :=
  c = ProductCase.exportCase ∧ (r = Relief.exemption ∨ r = Relief.drawback)

/-- Universal agreement between the Bool implementation and the spec.
    Axiom-free by exhaustive cases with rfl/cases/rcases. -/
theorem agree_within_condition (c : ProductCase) (r : Relief) :
    (withinCondition c r = true) ↔ SpecWithinCondition c r := by
  cases c
  · cases r
    · constructor
      · intro _h
        exact ⟨rfl, Or.inl rfl⟩
      · intro _h
        rfl
    · constructor
      · intro _h
        exact ⟨rfl, Or.inr rfl⟩
      · intro _h
        rfl
    · constructor
      · intro h
        cases h
      · intro h
        rcases h with ⟨_, hr⟩
        rcases hr with h' | h' <;> cases h'
  · constructor
    · intro h
      cases h
    · intro h
      cases h.1

end JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition
