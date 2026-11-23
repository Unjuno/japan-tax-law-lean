import JapanTaxLaw.InheritanceTaxArt3DeemedAcquisitionSpec

/-!
# InheritanceTaxArt3DeemedAcquisitionTests — kernel-checked checks

Verifies DEEMING 「（相続又は遺贈により取得したものとみなす場合）」: inheritance or legacy, other excluded.
-/

namespace JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition

example : isDeemed AcquisitionMode.inheritance = true := inheritance_deemed
example : isDeemed AcquisitionMode.legacy = true := legacy_deemed
example : isDeemed AcquisitionMode.other = false := other_not_deemed
example (m : AcquisitionMode) : (isDeemed m = true) ↔ SpecDeemed m := agree_is_deemed m

end JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition
