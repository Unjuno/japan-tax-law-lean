import JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaptionSpec

/-!
# InheritanceTaxArt4DeemedAcquisitionCaptionTests — kernel-checked checks

Verifies DEEMING 「（遺贈により取得したものとみなす場合）」: deemed/actual classified, other not, deeming maps.
-/

namespace JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption

example : classifiedAsInheritance Acquisition.deemedByInheritance = true := deemed_classified
example : classifiedAsInheritance Acquisition.byInheritance = true := actual_classified
example : classifiedAsInheritance Acquisition.other = false := other_not_classified
example : deemAsInheritance Acquisition.deemedByInheritance = Acquisition.byInheritance := deeming_yields_inheritance
example : Acquisition.deemedByInheritance ≠ Acquisition.other := deemed_not_other
example : classifiedAsInheritance Acquisition.deemedByInheritance = true ↔ SpecClassified Acquisition.deemedByInheritance := classified_spec_agreement Acquisition.deemedByInheritance
example : SpecDeeming Acquisition.deemedByInheritance (deemAsInheritance Acquisition.deemedByInheritance) := deeming_spec_agreement Acquisition.deemedByInheritance

end JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption
