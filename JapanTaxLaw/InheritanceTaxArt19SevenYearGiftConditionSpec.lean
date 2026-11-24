import JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition

/-!
# InheritanceTaxArt19SevenYearGiftConditionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 19 ArticleCaption CONDITION
「（相続開始前七年以内に贈与があつた場合の相続税額）」。 Normative unit: NORM|5516848edbb7f5724c02b0141483fea8ef899ac593f2f53c9f5391cf56330214

The implementation uses a Bool conjunction/inequality; the spec states the same
condition as a Prop, representationally distinct. Axiom-free by rfl/cases/decide.

Not modelled: tax amount computation, add-back property definition, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition

/-- Independent spec: gift occurred within seven years before commencement. -/
def SpecApplies (giftOccurred : Bool) (yearsBefore : Nat) : Prop :=
  giftOccurred = true ∧ yearsBefore <= 7

/-- The seven-year boundary satisfies the spec. -/
theorem spec_seven : SpecApplies true 7 := by exact And.intro rfl (by decide)

/-- Bool/Prop agreement at the seven-year boundary. -/
theorem agree_seven : (applies true 7 = true) ↔ SpecApplies true 7 := by
  constructor
  · intro _h
    exact spec_seven
  · intro _h
    rfl

/-- Universal implication from Bool to Prop. -/
theorem impl_implies_spec (g : Bool) (n : Nat) : applies g n = true -> SpecApplies g n := by
  unfold applies SpecApplies
  cases g with
  | false => intro h; contradiction
  | true =>
      intro h
      change decide (n <= 7) = true at h
      exact And.intro rfl (of_decide_eq_true h)

end JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition
