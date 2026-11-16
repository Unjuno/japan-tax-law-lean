import JapanTaxLaw.RegistrationQualificationFeesP6J

/-!
# RegistrationQualificationFeesP6J tests — 別表第一（二）第三十二号 百二十五〜百二十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百二十五(一)イ 一般乗合／一般貸切旅客自動車運送事業の許可
example : generalRouteCharterPassengerTransportPermitFee = 90_000 := by decide
-- 百二十五(一)ロ 一般乗用旅客自動車運送事業の許可
example : generalPassengerCarTransportPermitFee = 30_000 := by decide
-- 百二十五(二)イ 路線・営業区域増加の事業計画変更認可
example : routeAreaIncreasePlanChangeApprovalFee = 15_000 := by decide
-- 百二十五(二)ロ 営業区域増加の事業計画変更認可
example : businessAreaIncreasePlanChangeApprovalFee = 5_000 := by decide
-- 百二十五(二)ハ 準特定地域の供給輸送力増加の事業計画変更認可
example : semiSpecificAreaCapacityIncreasePlanChangeApprovalFee = 5_000 := by decide
-- 百二十五(三) 特定旅客自動車運送事業の許可
example : specifiedPassengerTransportBizPermitFee = 30_000 := by decide
-- 百二十五(四) 一般貨物自動車運送事業の許可
example : generalFreightTransportBizPermitFee = 120_000 := by decide
-- 百二十五(五) 特定貨物自動車運送事業の許可
example : specifiedFreightTransportBizPermitFee = 60_000 := by decide
-- 百二十五(六) 登録貨物軽自動車安全管理者講習機関の登録
example : registeredLightFreightSafetyInstructorTrainingOrgRegFee = 90_000 := by decide
-- 百二十五(七) 登録貨物軽自動車安全管理者定期講習機関の登録
example : registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee = 90_000 := by decide
-- 百二十五の二 タクシー運転者 登録実施機関の登録
example : taxiDriverRegistrationOrgRegFee = 90_000 := by decide
-- 百二十五の三(一) 自家用有償旅客運送者の登録
example : privatePaidPassengerTransportRegFee = 15_000 := by decide
-- 百二十五の三(二) 自家用有償旅客運送者の変更登録
example : privatePaidPassengerTransportChangeRegFee = 3_000 := by decide
-- 百二十六 自家用自動車の有償貸渡しの許可
example : privateCarPaidLoanPermitFee = 90_000 := by decide
-- 百二十七 運河開設の免許
example : canalConstructionLicenseFee = 150_000 := by decide
-- 百二十七の二 港湾の登録確認機関の登録
example : portTechnicalStandardVerificationOrgRegFee = 90_000 := by decide
-- 百二十八(一) 船舶・施設の新設等の許可
example : shipMfgRepairFacilityNewPermitFee = 150_000 := by decide
-- 百二十八(二) 船舶・設備の新設等の許可
example : shipMfgRepairEquipmentExpansionPermitFee = 30_000 := by decide
-- 百二十九 小型船造船業者の登録
example : smallVesselShipbuilderRegFee = 90_000 := by decide

end JapanTaxLaw
