import JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation

/-!
# InheritanceTaxArt21_16GiftTimeValuationSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 21-16(3) item1 EFFECT
「当該財産の価額は、第一項の贈与の時における価額とする。」。 Normative unit: NORM|f700e89529600c036887cb663aa17cca3e9d41bf656bbb9ca383e8a6da537af4

The implementation uses an inductive value; the spec states the selection as a Prop
equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: substantive valuation method, asset selection, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation

/-- Independent spec: the valuation time is the gift time. -/
def SpecValuationTime (v : ValuationTime) : Prop :=
  v = ValuationTime.giftTime

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecValuationTime valuationTime := rfl

/-- The 'other' time does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecValuationTime ValuationTime.other := by
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation
