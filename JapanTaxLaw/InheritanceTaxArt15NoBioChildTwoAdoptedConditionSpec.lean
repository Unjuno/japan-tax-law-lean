import JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition

/-!
# InheritanceTaxArt15NoBioChildTwoAdoptedConditionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 15(2) item 2 CONDITION
「当該被相続人に実子がなく、養子の数が二人以上である場合」。 Normative unit: NORM|e3c065dafc60128427f7b5f314a6f77fe6ec9f329edbf9694aacdf3c47af393b

The implementation uses a Bool conjunction/inequality; the spec states the condition
as a Prop, representationally distinct. Axiom-free by rfl/cases/decide.

Not modelled: the adjacent column's adopted-child count (legal effect), legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition

/-- Independent spec: no actual child and at least two adopted children. -/
def SpecQualifies (hasBioChild : Bool) (adoptedCount : Nat) : Prop :=
  hasBioChild = false ∧ adoptedCount >= 2

/-- The implementation satisfies the spec at the two-adopted boundary. -/
theorem spec_two_adopted : SpecQualifies false 2 := by exact And.intro rfl (by decide)

/-- The implementation satisfies the spec at three adopted children. -/
theorem spec_three_adopted : SpecQualifies false 3 := by exact And.intro rfl (by decide)

/-- Bool/Prop agreement at the boundary. -/
theorem agree_two_adopted :
    (qualifies false 2 = true) ↔ SpecQualifies false 2 := by
  constructor
  · intro _h
    exact spec_two_adopted
  · intro _h
    decide

/-- Any case satisfying the implementation satisfies the spec. -/
theorem impl_implies_spec (b : Bool) (n : Nat) : qualifies b n = true -> SpecQualifies b n := by
  unfold qualifies SpecQualifies
  cases b with
  | false =>
      intro h
      change decide (n >= 2) = true at h
      exact And.intro rfl (of_decide_eq_true h)
  | true =>
      intro h
      cases h

end JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition
