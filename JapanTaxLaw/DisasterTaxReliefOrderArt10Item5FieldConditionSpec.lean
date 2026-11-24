import JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition

/-!
# DisasterTaxReliefOrderArt10Item5FieldConditionSpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
Article 10(1) item 5 CONDITION 「徴収猶予限度額又は徴収猶予期間及びこれらの計算の基礎」.
Normative unit: NORM|776e380c19760249d8df0f9271e451ace26d44c8f044d76495f3caeb888f038d

The implementation uses a Bool conjunction/disjunction; the spec states the same
condition as a Prop, representationally distinct. Axiom-free by rfl.

Not modelled: full application form, substantive eligibility, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition

/-- Independent spec: the item-5 field-completeness condition as a Prop. -/
def SpecItem5 (provided : DeferralField -> Bool) : Prop :=
  (provided DeferralField.limitAmount = true ∨
   provided DeferralField.deferralPeriod = true) ∧
  provided DeferralField.calculationBasis = true

/-- The amount-and-basis provider satisfies the spec. -/
theorem spec_amount_and_basis : SpecItem5 amountAndBasis := by
  unfold SpecItem5 amountAndBasis
  exact And.intro (Or.inl rfl) rfl

/-- The period-and-basis provider satisfies the spec. -/
theorem spec_period_and_basis : SpecItem5 periodAndBasis := by
  unfold SpecItem5 periodAndBasis
  exact And.intro (Or.inr rfl) rfl

/-- The amount-only provider does not satisfy the spec. -/
theorem spec_amount_only_fails : ¬ SpecItem5 amountOnly := by
  unfold SpecItem5 amountOnly
  intro h
  cases h.2

/-- Bool/Prop agreement at the amount path. -/
theorem agree_amount : (satisfiesItem5 amountAndBasis = true) ↔ SpecItem5 amountAndBasis := by
  constructor
  · intro _h
    exact spec_amount_and_basis
  · intro _h
    rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition
