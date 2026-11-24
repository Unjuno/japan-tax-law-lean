import JapanTaxLaw.CustomsTariffArt21DeemedForeignRegionSpec

/-!
# CustomsTariffArt21DeemedForeignRegionTests — kernel-checked checks

Verifies DEEMING 「（外国とみなす地域）」: designated domestic region deemed foreign; others not.
-/

namespace JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion

example : isDeemedForeign RegionStatus.designatedDomestic = true := designated_deemed_foreign
example : isDeemedForeign RegionStatus.domestic = false := domestic_not_deemed
example : isDeemedForeign RegionStatus.foreign = false := foreign_not_deemed
example : SpecDeemedForeign RegionStatus.designatedDomestic := spec_designated
example : (isDeemedForeign RegionStatus.designatedDomestic = true) ↔ SpecDeemedForeign RegionStatus.designatedDomestic := agree_designated
example : (isDeemedForeign RegionStatus.domestic = false) ↔ ¬ SpecDeemedForeign RegionStatus.domestic := agree_domestic

end JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion
