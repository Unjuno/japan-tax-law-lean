import JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption

/-!
# InheritanceTaxArt4DeemedAcquisitionCaptionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY.
Art.4 ArticleCaption DEEMING 「（遺贈により取得したものとみなす場合）」.
Normative unit: NORM|231c551d81dabb99d1af6fba695e53d8baf56b0b7e48a165b245be1e56c4226c

The implementation is a Bool-valued classifier and a transformation function;
the spec states classification as a Prop disjunction and the deeming rule as
an implication, representationally distinct. Equivalences are proved by
exhaustive cases in the kernel, not assumed. Axiom-free; no
decide/simp/propext/omega.

Not modelled: substantive conditions, valuation, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption

/-- Independent spec of the classification: inheritance or deemed inheritance. -/
def SpecClassified (a : Acquisition) : Prop :=
  a = Acquisition.deemedByInheritance ∨ a = Acquisition.byInheritance

/-- Independent spec of the deeming rule: a deemed case maps to inheritance. -/
def SpecDeeming (a b : Acquisition) : Prop :=
  a = Acquisition.deemedByInheritance → b = Acquisition.byInheritance

/-- The Bool classifier and the Prop spec agree. -/
theorem classified_spec_agreement (a : Acquisition) :
    classifiedAsInheritance a = true ↔ SpecClassified a := by
  cases a with
  | deemedByInheritance =>
      constructor
      · intro h
        exact Or.inl rfl
      · intro h
        rfl
  | byInheritance =>
      constructor
      · intro h
        exact Or.inr rfl
      · intro h
        rfl
  | other =>
      constructor
      · intro h
        cases h
      · intro h
        cases h with
        | inl h1 => cases h1
        | inr h2 => cases h2

/-- The implementation transformation satisfies the independent deeming spec. -/
theorem deeming_spec_agreement (a : Acquisition) : SpecDeeming a (deemAsInheritance a) := by
  cases a with
  | deemedByInheritance =>
      intro h
      rfl
  | byInheritance =>
      intro h
      cases h
  | other =>
      intro h
      cases h

end JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption
