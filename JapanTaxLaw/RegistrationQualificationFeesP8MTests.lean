import JapanTaxLaw.RegistrationQualificationFeesP8M

/-!
# RegistrationQualificationFeesP8M tests — 別表第一（二）第三十二号 百四十〜百五十一 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百四十(一)
example : warehouseOperatorRegFee = 90_000 := by decide
-- 百四十(二)
example : warehouseNewChangeRegFeePerUnit = 30_000 := by decide
-- 百四十(三)
example : trunkRoomCertificationFeePerUnit = 10_000 := by decide
-- 百四十一(一)
example : hotelRegFee = 150_000 := by decide
-- 百四十一(二)
example : ryokanRegFee = 90_000 := by decide
-- 百四十一(三)
example : foreignGuestLodgingRegOrgRegFee = 90_000 := by decide
-- 百四十一の二
example : nationalGuideTrainingOrgRegFee = 90_000 := by decide
-- 百四十二(一)
example : travelAgencyRegFee = 90_000 := by decide
-- 百四十二(二)
example : travelAgencySubAgentRegFee = 15_000 := by decide
-- 百四十二(三)
example : travelServiceArrangerRegFee = 90_000 := by decide
-- 百四十二(四)
example : travelAgencyTrainingOrgRegFee = 90_000 := by decide
-- 百四十二(五)
example : travelAgencyManagerTrainingOrgRegFee = 90_000 := by decide
-- 百四十二の二
example : tourismZoneGuideOfficePlanCertificationFee = 15_000 := by decide
-- 百四十二の三(一)
example : privateLodgingManagerRegFee = 90_000 := by decide
-- 百四十二の三(二)
example : privateLodgingBrokerRegFee = 90_000 := by decide
-- 百四十三(一)
example : weatherForecastBizPermitFee = 90_000 := by decide
-- 百四十三(二)
example : weatherForecastScopeChangeApprovalFee = 90_000 := by decide
-- 百四十三(三)
example : weatherObservationWirelessBroadcastPermitFee = 90_000 := by decide
-- 百四十三(四)
example : weatherInstrumentMeasurerCertificationFee = 90_000 := by decide
-- 百四十三(五)
example : weatherInstrumentInspectionOrgRegFee = 90_000 := by decide
-- 百四十四(一)イ
example : constructionBizPermitClass1Fee = 150_000 := by decide
-- 百四十四(一)ロ
example : constructionBizPermitClass2Fee = 150_000 := by decide
-- 百四十四(二)
example : constructionEngineerTrainingRegFee = 90_000 := by decide
-- 百四十四(三)
example : constructionBizAnalysisOrgRegFee = 90_000 := by decide
-- 百四十五(一)
example : domesticSepticTankTypeCertificationFee = 90_000 := by decide
-- 百四十五(二)
example : foreignSepticTankTypeCertificationFee = 90_000 := by decide
-- 百四十六(一)
example : realEstateAppraisalBizRegFee = 90_000 := by decide
-- 百四十六(二)
example : realEstateAppraisalTrainingOrgRegFee = 90_000 := by decide
-- 百四十七(一)
example : realEstateTransactionBizLicenseFee = 90_000 := by decide
-- 百四十七(二)
example : realEstateTransactionTrainingOrgRegFee = 90_000 := by decide
-- 百四十八
example : installmentLandBuildingSalesBizPermitFee = 150_000 := by decide
-- 百四十九
example : publicWorksAdvancePaymentGuaranteeBizRegFee = 150_000 := by decide
-- 百五十(一)
example : realEstateSpecificJointBizPermitFee = 150_000 := by decide
-- 百五十(二)
example : realEstateSpecificJointBizTypeIncreaseApprovalFee = 30_000 := by decide
-- 百五十(三)
example : smallRealEstateSpecificJointBizRegFee = 150_000 := by decide
-- 百五十(四)
example : smallRealEstateSpecificJointBizTypeIncreaseRegFee = 30_000 := by decide
-- 百五十一(一)
example : condominiumManagerRegFee = 90_000 := by decide
-- 百五十一(二)
example : condominiumManagerTrainingOrgRegFee = 90_000 := by decide
-- 百五十一(三)
example : condominiumManagementStaffTrainingOrgRegFee = 90_000 := by decide
-- 百五十一の二
example : rentalHousingManagerRegFee = 90_000 := by decide

end JapanTaxLaw
