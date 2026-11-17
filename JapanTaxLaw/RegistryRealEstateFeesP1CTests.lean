import JapanTaxLaw.RegistryRealEstateFeesP1C

/-!
# RegistryRealEstateFeesP1C tests — 別表第一（一）区分（十一）〜（十五）smoke checks

Decidable smoke tests for the ad-valorem fee functions and the flat fee
constants, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

No new theorem names; only `example ... := by decide`.
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1C

open JapanTaxLaw.TaxFinance

-- ==== 割合型: 各区分の端数境界を含む kernel-decide smoke ====

-- （十一）イ 4/1000
example : inheritanceSeparationOwnershipFee 0 = 0 := by decide
example : inheritanceSeparationOwnershipFee 999 = 3 := by decide
example : inheritanceSeparationOwnershipFee 1000 = 4 := by decide
example : inheritanceSeparationOwnershipFee 100_000 = 400 := by decide
-- （十一）ロ 2/1000
example : inheritanceSeparationOtherFee 999 = 1 := by decide
example : inheritanceSeparationOtherFee 1000 = 2 := by decide
example : inheritanceSeparationOtherFee 100_000 = 200 := by decide
-- （十二）イ 2/1000
example : provisionalOwnershipPreservationFee 999 = 1 := by decide
example : provisionalOwnershipPreservationFee 1000 = 2 := by decide
example : provisionalOwnershipPreservationFee 100_000 = 200 := by decide
-- （十二）ロ（１）2/1000
example : provisionalTransferInheritanceMergerFee 999 = 1 := by decide
example : provisionalTransferInheritanceMergerFee 1000 = 2 := by decide
example : provisionalTransferInheritanceMergerFee 100_000 = 200 := by decide
-- （十二）ロ（２）2/1000
example : provisionalTransferCoOwnershipDivisionFee 999 = 1 := by decide
example : provisionalTransferCoOwnershipDivisionFee 1000 = 2 := by decide
example : provisionalTransferCoOwnershipDivisionFee 100_000 = 200 := by decide
-- （十二）ロ（３）10/1000
example : provisionalTransferOtherFee 999 = 9 := by decide
example : provisionalTransferOtherFee 1000 = 10 := by decide
example : provisionalTransferOtherFee 100_000 = 1000 := by decide
-- （十二）ハ（１）5/1000
example : provisionalSettingLeaseFee 999 = 4 := by decide
example : provisionalSettingLeaseFee 1000 = 5 := by decide
example : provisionalSettingLeaseFee 100_000 = 500 := by decide
-- （十二）ハ（２）1/1000
example : provisionalInheritanceMergerTransferFee 999 = 0 := by decide
example : provisionalInheritanceMergerTransferFee 1000 = 1 := by decide
example : provisionalInheritanceMergerTransferFee 100_000 = 100 := by decide
-- （十二）ハ（３）1/1000
example : provisionalCoOwnershipDivisionTransferFee 999 = 0 := by decide
example : provisionalCoOwnershipDivisionTransferFee 1000 = 1 := by decide
example : provisionalCoOwnershipDivisionTransferFee 100_000 = 100 := by decide
-- （十二）ハ（４）5/1000
example : provisionalOtherTransferFee 999 = 4 := by decide
example : provisionalOtherTransferFee 1000 = 5 := by decide
example : provisionalOtherTransferFee 100_000 = 500 := by decide
-- （十二）ニ 1/1000
example : provisionalSpouseResidenceRightFee 999 = 0 := by decide
example : provisionalSpouseResidenceRightFee 1000 = 1 := by decide
example : provisionalSpouseResidenceRightFee 100_000 = 100 := by decide
-- （十二）ホ（１）2/1000
example : provisionalTrustOwnershipFee 999 = 1 := by decide
example : provisionalTrustOwnershipFee 1000 = 2 := by decide
example : provisionalTrustOwnershipFee 100_000 = 200 := by decide
-- （十二）ホ（２）1/1000（債権金額基準）
example : provisionalTrustLienFee 999 = 0 := by decide
example : provisionalTrustLienFee 1000 = 1 := by decide
example : provisionalTrustLienFee 100_000 = 100 := by decide
-- （十二）ホ（３）1/1000
example : provisionalTrustOtherRightFee 999 = 0 := by decide
example : provisionalTrustOtherRightFee 1000 = 1 := by decide
example : provisionalTrustOtherRightFee 100_000 = 100 := by decide
-- （十二）ヘ（１）2/1000
example : provisionalSeparationOwnershipFee 999 = 1 := by decide
example : provisionalSeparationOwnershipFee 1000 = 2 := by decide
example : provisionalSeparationOwnershipFee 100_000 = 200 := by decide
-- （十二）ヘ（２）1/1000
example : provisionalSeparationOtherFee 999 = 0 := by decide
example : provisionalSeparationOtherFee 1000 = 1 := by decide
example : provisionalSeparationOtherFee 100_000 = 100 := by decide

-- ==== 定額型: 一件／一個の固定額 ====

example : provisionalOtherPerItemFee = 1_000 := by decide
example : displayChangeParcelPerItemFee = 1_000 := by decide
example : displayChangeMergerPerItemFee = 1_000 := by decide
example : additionalRegistrationPerItemFee = 1_000 := by decide
example : cancellationPerItemFee = 1_000 := by decide
example : cancellationOver20PerCaseFee = 20_000 := by decide
example : cancellationOver20PerCaseFee > cancellationPerItemFee := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1C
