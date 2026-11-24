import JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException

/-!
# InheritanceTaxArt13ResidualAssetDebtExceptionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 13(2) item3 EXCEPTION
「前二号に掲げる債務を除くほか、その財産の取得、維持又は管理のために生じた債務」。 Normative unit: NORM|e1208a4e5009376f0be8af0a4faaca058248f8ac09395b028762e51f640c3ddd

The implementation uses a Bool function; the spec states the selected category as
a Prop equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: substantive debt valuation, preceding items' content, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException

/-- Independent spec: the debt category is the residual asset debt. -/
def SpecResidualAssetDebt (d : DebtCategory) : Prop :=
  d = DebtCategory.residualAssetDebt

/-- The implementation satisfies the spec at the residual category. -/
theorem implementation_satisfies_spec : SpecResidualAssetDebt DebtCategory.residualAssetDebt := rfl

/-- Item 1 debt does not satisfy the spec. -/
theorem item1_not_satisfying : ¬ SpecResidualAssetDebt DebtCategory.item1Debt := by
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException
