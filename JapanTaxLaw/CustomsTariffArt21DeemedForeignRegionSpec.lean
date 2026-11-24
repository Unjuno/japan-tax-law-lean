import JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion

/-!
# CustomsTariffArt21DeemedForeignRegionSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY. Article 21 ArticleCaption DEEMING
「（外国とみなす地域）」。 Normative unit: NORM|abdefe5d8becbbaf72feb57bf8fe19255467b5f2872b4c2d030feff151188908

The implementation uses a Bool function; the spec states the deemed set as a Prop
equality, representationally distinct. Axiom-free by rfl.

Not modelled: Cabinet Order designation, 当分の間 qualifier, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion

/-- Independent spec: the region deemed foreign by the provision. -/
def SpecDeemedForeign (r : RegionStatus) : Prop :=
  r = RegionStatus.designatedDomestic

/-- The designated domestic region satisfies the spec. -/
theorem spec_designated : SpecDeemedForeign RegionStatus.designatedDomestic := rfl

/-- Agreement at the designated region. -/
theorem agree_designated :
    (isDeemedForeign RegionStatus.designatedDomestic = true) ↔
      SpecDeemedForeign RegionStatus.designatedDomestic := by
  constructor
  · intro _h
    exact spec_designated
  · intro _h
    rfl

/-- Agreement at an ordinary domestic region (not deemed). -/
theorem agree_domestic :
    (isDeemedForeign RegionStatus.domestic = false) ↔
      ¬ SpecDeemedForeign RegionStatus.domestic := by
  constructor
  · intro _h hspec
    cases hspec
  · intro _h
    rfl

end JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion
