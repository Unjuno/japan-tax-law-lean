import JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition

/-!
# InheritanceTaxArt25LumpSumPremiumConditionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 25(1) item1 CONDITION
「当該契約に係る掛金又は保険料が一時に払い込まれた場合」。 Normative unit: NORM|fa8a8f71f0be091e2a94232147a20ebd42a46628962557f1d83fdafcdab82cbb

The implementation uses a Bool function; the spec states the selected branch as a
Prop equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: column valuation amount, other branches, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition

/-- Independent spec: the payment timing is the lump-sum branch. -/
def SpecLumpSum (t : PaymentTiming) : Prop :=
  t = PaymentTiming.lumpSum

/-- The implementation satisfies the spec at the lump-sum branch. -/
theorem implementation_satisfies_spec : SpecLumpSum PaymentTiming.lumpSum := rfl

/-- The other timing does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecLumpSum PaymentTiming.other := by
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition
