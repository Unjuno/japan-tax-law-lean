import JapanTaxLaw.RegistrationQualificationFeesP7L

/-!
# RegistrationQualificationFeesP7L tests — 別表第一（二）第三十二号 百三十五〜百三十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百三十五 内航海運業の登録
example : domesticCoastalShippingBizRegFee = 90_000 := by decide
-- 百三十六(一) 海技免許講習の登録
example : maritimeOfficerLicenseTrainingCourseRegFee = 90_000 := by decide
-- 百三十六(二) 海技免状更新講習の登録
example : maritimeLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
-- 百三十六(三) 登録船舶職員養成施設の登録
example : registeredSeafarerTrainingFacilityRegFee = 90_000 := by decide
-- 百三十六(四) 登録漁ろう操船講習機関の登録
example : registeredFishingOperationTrainingOrgRegFee = 90_000 := by decide
-- 百三十六(五) 登録小型船舶教習所の登録
example : registeredSmallVesselTrainingSchoolRegFee = 90_000 := by decide
-- 百三十六(六) 操縦免許証更新講習の登録（準用）
example : operationLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
-- 百三十六(七) 登録特定操縦免許講習機関の登録
example : registeredSpecificOperationLicenseTrainingOrgRegFee = 90_000 := by decide
-- 百三十六(八) 電子通信移行講習の登録
example : electronicCommunicationTransitionTrainingRegFee = 90_000 := by decide
-- 百三十六の二(一) 登録水先人養成施設の登録
example : registeredPilotTrainingFacilityRegFee = 90_000 := by decide
-- 百三十六の二(二) 水先免許更新講習の登録
example : pilotLicenseRenewalTrainingRegFee = 90_000 := by decide
-- 百三十七 船員派遣事業の許可
example : crewDispatchBizPermitFee = 90_000 := by decide
-- 百三十七の二(一) 登録生存講習機関の登録
example : registeredSurvivalTrainingOrgRegFee = 90_000 := by decide
-- 百三十七の二(二) 登録消火講習機関の登録
example : registeredFireFightingTrainingOrgRegFee = 90_000 := by decide
-- 百三十七の二(三) 登録検査機関の登録
example : registeredInspectionOrgRegFee = 90_000 := by decide
-- 百三十八(一)イ 空港等の設置の許可
example : airportInstallationPermitFee = 150_000 := by decide
-- 百三十八(一)ロ 航空保安施設の設置の許可
example : aviationSecurityFacilityInstallationPermitFee = 90_000 := by decide
-- 百三十八(二) 事業場の認定
example : businessFacilityCertificationFee = 90_000 := by decide
-- 百三十八(三) 航空運送事業の許可
example : airTransportBizPermitFee = 150_000 := by decide
-- 百三十八(四) 航空機使用事業の許可
example : aircraftOperationBizPermitFee = 90_000 := by decide
-- 百三十八(五) 外国人国際航空運送事業の許可
example : foreignInternationalAirTransportBizPermitFee = 150_000 := by decide
-- 百三十八(六) 登録訓練機関の登録
example : registeredTrainingOrgRegFee = 90_000 := by decide
-- 百三十八の二(一) 無人航空機検査の登録検査機関の登録
example : uavInspectionOrgRegFee = 90_000 := by decide
-- 百三十八の二(二) 登録講習機関の登録
example : uavOperationTrainingOrgRegFee = 90_000 := by decide
-- 百三十八の二(三) 登録更新講習機関の登録
example : uavOperationRenewalTrainingOrgRegFee = 90_000 := by decide
-- 百三十九(一) 第一種貨物利用運送事業の登録
example : firstClassFreightForwardingBizRegFee = 90_000 := by decide
-- 百三十九(二) 変更登録（利用運送の増加等）
example : freightForwardingChangeRegFee = 15_000 := by decide
-- 百三十九(三) 第二種貨物利用運送事業の許可
example : secondClassFreightForwardingBizPermitFee = 120_000 := by decide
-- 百三十九(四) 事業計画の変更の認可
example : freightForwardingPlanChangeApprovalFee = 20_000 := by decide
-- 百三十九(五) 国際貨物運送に係る第一種...の登録
example : internationalFreightFirstClassRegFee = 90_000 := by decide
-- 百三十九(六) 変更登録（利用運送の区間・業務範囲の増加）
example : internationalFreightChangeRegFee = 15_000 := by decide
-- 百三十九(七) 国際貨物運送に係る第二種...の許可
example : internationalFreightSecondClassPermitFee = 120_000 := by decide
-- 百三十九(八) 事業計画の変更の認可
example : internationalFreightPlanChangeApprovalFee = 20_000 := by decide

end JapanTaxLaw
