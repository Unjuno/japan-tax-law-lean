import JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition

/-!
# CustomsTariffArt20ContrabandDisposalConditionSpec — independent spec 関税定率法 第二十条

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第二十条 caption — CONDITION 「（違約品等の再輸出又は廃棄の場合の戻し税等）」.
Normative unit: NORM|6c30cf8dbebe8cce20c0fcc0c11f69394a2c8dab5b47cd3d1c36c2b6fa7d4e1b

The implementation is a Bool function `withinCondition`. The independent spec
states the disjunction as a PROPOSITIONAL predicate, representationally distinct.
Universal agreement is proved by exhaustive cases with rfl/cases — no
decide/simp/propext/Classical.choice.

Not modelled: operative article text, drawback mechanics, 等 extensions,
legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition

/-- Independent spec: the disjunctive case as a propositional predicate. -/
def SpecWithinCondition (c : GoodsCase) : Prop :=
  c = GoodsCase.reexport ∨ c = GoodsCase.disposal

/-- Universal agreement between the Bool implementation and the spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_within_condition (c : GoodsCase) :
    (withinCondition c = true) ↔ SpecWithinCondition c := by
  cases c
  · constructor
    · intro _h
      left; rfl
    · intro _h
      rfl
  · constructor
    · intro _h
      right; rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      rcases h with h | h <;> cases h

end JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition
