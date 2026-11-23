import JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition

/-!
# InheritanceTaxArt3DeemedAcquisitionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 第三条 caption — DEEMING
「（相続又は遺贈により取得したものとみなす場合）」. Normative unit: NORM|6a574541c0cc8e189b22ac97d2c2ddacaa3a00871afe9a7f5c9ca2137f72dc74

The implementation is a Bool function. The spec states the disjunction as a Prop,
representationally distinct. Axiom-free by cases/rfl.

Not modelled: operative deeming provisions, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition

/-- Independent spec: the disjunctive deeming condition as a Prop. -/
def SpecDeemed (m : AcquisitionMode) : Prop :=
  m = AcquisitionMode.inheritance ∨ m = AcquisitionMode.legacy

/-- Universal agreement between the Bool implementation and the spec.
    Axiom-free by exhaustive cases with rfl. -/
theorem agree_is_deemed (m : AcquisitionMode) : (isDeemed m = true) ↔ SpecDeemed m := by
  cases m
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

end JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition
