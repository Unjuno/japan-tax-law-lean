import JapanTaxLaw.RegistrationQualificationFeesP8M

/-!
# RegistrationQualificationFeesP8MSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百四十〜百五十一

Sources (pinned; identical to RegistrationQualificationFeesP8M.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百四十〜百五十一 の flat 額 from the statutory text itself.
全 40 件が一件／一箇につきの固定額（割合なし、デーミング規定・金額なし行なし）。
scope boundaries identical to the implementation（百三十九 以前・百五十二 以降は NOT YET
COVERED; 「政令で定めるものに限る」「更新の登録を除く」等の適用判定・軽減額は
すべて caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百四十(一) 九万円（¥90,000）。 -/
def specWarehouseOperatorRegFee : Money := 90_000
/-- Spec: 百四十(二) 三万円（¥30,000）。 -/
def specWarehouseNewChangeRegFeePerUnit : Money := 30_000
/-- Spec: 百四十(三) 一万円（¥10,000）。 -/
def specTrunkRoomCertificationFeePerUnit : Money := 10_000
/-- Spec: 百四十一(一) 十五万円（¥150,000）。 -/
def specHotelRegFee : Money := 150_000
/-- Spec: 百四十一(二) 九万円（¥90,000）。 -/
def specRyokanRegFee : Money := 90_000
/-- Spec: 百四十一(三) 九万円（¥90,000）。 -/
def specForeignGuestLodgingRegOrgRegFee : Money := 90_000
/-- Spec: 百四十一の二 九万円（¥90,000）。 -/
def specNationalGuideTrainingOrgRegFee : Money := 90_000
/-- Spec: 百四十二(一) 九万円（¥90,000）。 -/
def specTravelAgencyRegFee : Money := 90_000
/-- Spec: 百四十二(二) 一万五千円（¥15,000）。 -/
def specTravelAgencySubAgentRegFee : Money := 15_000
/-- Spec: 百四十二(三) 九万円（¥90,000）。 -/
def specTravelServiceArrangerRegFee : Money := 90_000
/-- Spec: 百四十二(四) 九万円（¥90,000）。 -/
def specTravelAgencyTrainingOrgRegFee : Money := 90_000
/-- Spec: 百四十二(五) 九万円（¥90,000）。 -/
def specTravelAgencyManagerTrainingOrgRegFee : Money := 90_000
/-- Spec: 百四十二の二 一万五千円（¥15,000）。 -/
def specTourismZoneGuideOfficePlanCertificationFee : Money := 15_000
/-- Spec: 百四十二の三(一) 九万円（¥90,000）。 -/
def specPrivateLodgingManagerRegFee : Money := 90_000
/-- Spec: 百四十二の三(二) 九万円（¥90,000）。 -/
def specPrivateLodgingBrokerRegFee : Money := 90_000
/-- Spec: 百四十三(一) 九万円（¥90,000）。 -/
def specWeatherForecastBizPermitFee : Money := 90_000
/-- Spec: 百四十三(二) 九万円（¥90,000）。 -/
def specWeatherForecastScopeChangeApprovalFee : Money := 90_000
/-- Spec: 百四十三(三) 九万円（¥90,000）。 -/
def specWeatherObservationWirelessBroadcastPermitFee : Money := 90_000
/-- Spec: 百四十三(四) 九万円（¥90,000）。 -/
def specWeatherInstrumentMeasurerCertificationFee : Money := 90_000
/-- Spec: 百四十三(五) 九万円（¥90,000）。 -/
def specWeatherInstrumentInspectionOrgRegFee : Money := 90_000
/-- Spec: 百四十四(一)イ 十五万円（¥150,000）。 -/
def specConstructionBizPermitClass1Fee : Money := 150_000
/-- Spec: 百四十四(一)ロ 十五万円（¥150,000）。 -/
def specConstructionBizPermitClass2Fee : Money := 150_000
/-- Spec: 百四十四(二) 九万円（¥90,000）。 -/
def specConstructionEngineerTrainingRegFee : Money := 90_000
/-- Spec: 百四十四(三) 九万円（¥90,000）。 -/
def specConstructionBizAnalysisOrgRegFee : Money := 90_000
/-- Spec: 百四十五(一) 九万円（¥90,000）。 -/
def specDomesticSepticTankTypeCertificationFee : Money := 90_000
/-- Spec: 百四十五(二) 九万円（¥90,000）。 -/
def specForeignSepticTankTypeCertificationFee : Money := 90_000
/-- Spec: 百四十六(一) 九万円（¥90,000）。 -/
def specRealEstateAppraisalBizRegFee : Money := 90_000
/-- Spec: 百四十六(二) 九万円（¥90,000）。 -/
def specRealEstateAppraisalTrainingOrgRegFee : Money := 90_000
/-- Spec: 百四十七(一) 九万円（¥90,000）。 -/
def specRealEstateTransactionBizLicenseFee : Money := 90_000
/-- Spec: 百四十七(二) 九万円（¥90,000）。 -/
def specRealEstateTransactionTrainingOrgRegFee : Money := 90_000
/-- Spec: 百四十八 十五万円（¥150,000）。 -/
def specInstallmentLandBuildingSalesBizPermitFee : Money := 150_000
/-- Spec: 百四十九 十五万円（¥150,000）。 -/
def specPublicWorksAdvancePaymentGuaranteeBizRegFee : Money := 150_000
/-- Spec: 百五十(一) 十五万円（¥150,000）。 -/
def specRealEstateSpecificJointBizPermitFee : Money := 150_000
/-- Spec: 百五十(二) 三万円（¥30,000）。 -/
def specRealEstateSpecificJointBizTypeIncreaseApprovalFee : Money := 30_000
/-- Spec: 百五十(三) 十五万円（¥150,000）。 -/
def specSmallRealEstateSpecificJointBizRegFee : Money := 150_000
/-- Spec: 百五十(四) 三万円（¥30,000）。 -/
def specSmallRealEstateSpecificJointBizTypeIncreaseRegFee : Money := 30_000
/-- Spec: 百五十一(一) 九万円（¥90,000）。 -/
def specCondominiumManagerRegFee : Money := 90_000
/-- Spec: 百五十一(二) 九万円（¥90,000）。 -/
def specCondominiumManagerTrainingOrgRegFee : Money := 90_000
/-- Spec: 百五十一(三) 九万円（¥90,000）。 -/
def specCondominiumManagementStaffTrainingOrgRegFee : Money := 90_000
/-- Spec: 百五十一の二 九万円（¥90,000）。 -/
def specRentalHousingManagerRegFee : Money := 90_000

example : specWarehouseOperatorRegFee = 90_000 := by decide
example : specWarehouseNewChangeRegFeePerUnit = 30_000 := by decide
example : specTrunkRoomCertificationFeePerUnit = 10_000 := by decide
example : specHotelRegFee = 150_000 := by decide
example : specRyokanRegFee = 90_000 := by decide
example : specForeignGuestLodgingRegOrgRegFee = 90_000 := by decide
example : specNationalGuideTrainingOrgRegFee = 90_000 := by decide
example : specTravelAgencyRegFee = 90_000 := by decide
example : specTravelAgencySubAgentRegFee = 15_000 := by decide
example : specTravelServiceArrangerRegFee = 90_000 := by decide
example : specTravelAgencyTrainingOrgRegFee = 90_000 := by decide
example : specTravelAgencyManagerTrainingOrgRegFee = 90_000 := by decide
example : specTourismZoneGuideOfficePlanCertificationFee = 15_000 := by decide
example : specPrivateLodgingManagerRegFee = 90_000 := by decide
example : specPrivateLodgingBrokerRegFee = 90_000 := by decide
example : specWeatherForecastBizPermitFee = 90_000 := by decide
example : specWeatherForecastScopeChangeApprovalFee = 90_000 := by decide
example : specWeatherObservationWirelessBroadcastPermitFee = 90_000 := by decide
example : specWeatherInstrumentMeasurerCertificationFee = 90_000 := by decide
example : specWeatherInstrumentInspectionOrgRegFee = 90_000 := by decide
example : specConstructionBizPermitClass1Fee = 150_000 := by decide
example : specConstructionBizPermitClass2Fee = 150_000 := by decide
example : specConstructionEngineerTrainingRegFee = 90_000 := by decide
example : specConstructionBizAnalysisOrgRegFee = 90_000 := by decide
example : specDomesticSepticTankTypeCertificationFee = 90_000 := by decide
example : specForeignSepticTankTypeCertificationFee = 90_000 := by decide
example : specRealEstateAppraisalBizRegFee = 90_000 := by decide
example : specRealEstateAppraisalTrainingOrgRegFee = 90_000 := by decide
example : specRealEstateTransactionBizLicenseFee = 90_000 := by decide
example : specRealEstateTransactionTrainingOrgRegFee = 90_000 := by decide
example : specInstallmentLandBuildingSalesBizPermitFee = 150_000 := by decide
example : specPublicWorksAdvancePaymentGuaranteeBizRegFee = 150_000 := by decide
example : specRealEstateSpecificJointBizPermitFee = 150_000 := by decide
example : specRealEstateSpecificJointBizTypeIncreaseApprovalFee = 30_000 := by decide
example : specSmallRealEstateSpecificJointBizRegFee = 150_000 := by decide
example : specSmallRealEstateSpecificJointBizTypeIncreaseRegFee = 30_000 := by decide
example : specCondominiumManagerRegFee = 90_000 := by decide
example : specCondominiumManagerTrainingOrgRegFee = 90_000 := by decide
example : specCondominiumManagementStaffTrainingOrgRegFee = 90_000 := by decide
example : specRentalHousingManagerRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP8M : Bool :=
  specWarehouseOperatorRegFee == warehouseOperatorRegFee &&
  specWarehouseNewChangeRegFeePerUnit == warehouseNewChangeRegFeePerUnit &&
  specTrunkRoomCertificationFeePerUnit == trunkRoomCertificationFeePerUnit &&
  specHotelRegFee == hotelRegFee &&
  specRyokanRegFee == ryokanRegFee &&
  specForeignGuestLodgingRegOrgRegFee == foreignGuestLodgingRegOrgRegFee &&
  specNationalGuideTrainingOrgRegFee == nationalGuideTrainingOrgRegFee &&
  specTravelAgencyRegFee == travelAgencyRegFee &&
  specTravelAgencySubAgentRegFee == travelAgencySubAgentRegFee &&
  specTravelServiceArrangerRegFee == travelServiceArrangerRegFee &&
  specTravelAgencyTrainingOrgRegFee == travelAgencyTrainingOrgRegFee &&
  specTravelAgencyManagerTrainingOrgRegFee == travelAgencyManagerTrainingOrgRegFee &&
  specTourismZoneGuideOfficePlanCertificationFee == tourismZoneGuideOfficePlanCertificationFee &&
  specPrivateLodgingManagerRegFee == privateLodgingManagerRegFee &&
  specPrivateLodgingBrokerRegFee == privateLodgingBrokerRegFee &&
  specWeatherForecastBizPermitFee == weatherForecastBizPermitFee &&
  specWeatherForecastScopeChangeApprovalFee == weatherForecastScopeChangeApprovalFee &&
  specWeatherObservationWirelessBroadcastPermitFee == weatherObservationWirelessBroadcastPermitFee &&
  specWeatherInstrumentMeasurerCertificationFee == weatherInstrumentMeasurerCertificationFee &&
  specWeatherInstrumentInspectionOrgRegFee == weatherInstrumentInspectionOrgRegFee &&
  specConstructionBizPermitClass1Fee == constructionBizPermitClass1Fee &&
  specConstructionBizPermitClass2Fee == constructionBizPermitClass2Fee &&
  specConstructionEngineerTrainingRegFee == constructionEngineerTrainingRegFee &&
  specConstructionBizAnalysisOrgRegFee == constructionBizAnalysisOrgRegFee &&
  specDomesticSepticTankTypeCertificationFee == domesticSepticTankTypeCertificationFee &&
  specForeignSepticTankTypeCertificationFee == foreignSepticTankTypeCertificationFee &&
  specRealEstateAppraisalBizRegFee == realEstateAppraisalBizRegFee &&
  specRealEstateAppraisalTrainingOrgRegFee == realEstateAppraisalTrainingOrgRegFee &&
  specRealEstateTransactionBizLicenseFee == realEstateTransactionBizLicenseFee &&
  specRealEstateTransactionTrainingOrgRegFee == realEstateTransactionTrainingOrgRegFee &&
  specInstallmentLandBuildingSalesBizPermitFee == installmentLandBuildingSalesBizPermitFee &&
  specPublicWorksAdvancePaymentGuaranteeBizRegFee == publicWorksAdvancePaymentGuaranteeBizRegFee &&
  specRealEstateSpecificJointBizPermitFee == realEstateSpecificJointBizPermitFee &&
  specRealEstateSpecificJointBizTypeIncreaseApprovalFee == realEstateSpecificJointBizTypeIncreaseApprovalFee &&
  specSmallRealEstateSpecificJointBizRegFee == smallRealEstateSpecificJointBizRegFee &&
  specSmallRealEstateSpecificJointBizTypeIncreaseRegFee == smallRealEstateSpecificJointBizTypeIncreaseRegFee &&
  specCondominiumManagerRegFee == condominiumManagerRegFee &&
  specCondominiumManagerTrainingOrgRegFee == condominiumManagerTrainingOrgRegFee &&
  specCondominiumManagementStaffTrainingOrgRegFee == condominiumManagementStaffTrainingOrgRegFee &&
  specRentalHousingManagerRegFee == rentalHousingManagerRegFee

example : agreeRegistrationQualificationFeesP8M = true := by decide

end JapanTaxLaw
