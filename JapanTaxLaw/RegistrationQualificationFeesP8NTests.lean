import JapanTaxLaw.RegistrationQualificationFeesP8N

/-!
# RegistrationQualificationFeesP8N tests — 別表第一（二）第三十二号 百五十二〜百五十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百五十二(一) 測量業者の登録
example : surveyorBizRegFee = 90_000 := by decide
-- 百五十二(二) 測量士に係る登録養成施設の登録
example : surveyorTrainingFacilityRegFee = 90_000 := by decide
-- 百五十三 業務主任者に係る登録試験機関の登録
example : outdoorAdDisplayExamOrgRegFee = 150_000 := by decide
-- 百五十四(一) 登録講習機関の登録（第十条の三）
example : structuralDesignArchitectTrainingOrgRegFee = 90_000 := by decide
-- 百五十四(二) 登録講習機関の登録（第二十二条の二）
example : architectTrainingOrgArticle22RegFee = 90_000 := by decide
-- 百五十四(三) 登録講習機関の登録（第二十四条第二項）
example : architectTrainingOrgArticle24RegFee = 90_000 := by decide
-- 百五十五(一) 登録住宅性能評価機関の登録
example : registeredHousingPerformanceEvalOrgRegFee = 90_000 := by decide
-- 百五十五(二) 住宅性能評価に係る登録講習機関の登録
example : housingPerfTrainingOrgRegFee = 90_000 := by decide
-- 百五十五(三) 登録住宅型式性能認定等機関の登録
example : registeredHousingModelCertOrgRegFee = 90_000 := by decide
-- 百五十五(四) 住宅の特別評価方法認定に係る登録試験機関の登録
example : housingExamOrgRegFee = 90_000 := by decide
-- 百五十五の二(一) 登録建築物エネルギー消費性能判定機関の登録
example : registeredBuildingEnergyPerfAssessOrgRegFee = 90_000 := by decide
-- 百五十五の二(二) 登録建築物エネルギー消費性能評価機関の登録
example : registeredBuildingEnergyPerfEvalOrgRegFee = 90_000 := by decide
-- 百五十五の三 登録調査機関の登録
example : urbanGreenSpaceSurveyOrgRegFee = 90_000 := by decide
-- 百五十六(一) 再生利用の認定
example : generalIndustrialWasteRecycleCertFee = 150_000 := by decide
-- 百五十六(二) 広域的処理の認定
example : generalIndustrialWasteWideAreaCertFee = 150_000 := by decide
-- 百五十六(三) 無害化処理の認定
example : generalIndustrialWasteDetoxCertFee = 150_000 := by decide
-- 百五十六(四) 処理に係る変更の認定
example : wasteProcessingChangeCertFee = 30_000 := by decide
-- 百五十六の二(一) 自主回収・再資源化事業計画の認定
example : usedSpecifiedRecycledProductPlanCertFee = 150_000 := by decide
-- 百五十六の二(二) 同事業計画の変更の認定
example : usedSpecifiedRecycledProductPlanChangeCertFee = 30_000 := by decide
-- 百五十六の三(一) 再資源化事業計画の認定
example : usedSmallElectronicsRecyclePlanCertFee = 150_000 := by decide
-- 百五十六の三(二)イ 収集区域の増加に係る変更認定
example : usedSmallElectronicsPlanChangeAreaCertFee = 30_000 := by decide
-- 百五十六の三(二)ロ 収集運搬処分者・業務種別の増加に係る変更認定
example : usedSmallElectronicsPlanChangeOperatorCertFee = 30_000 := by decide
-- 百五十六の四(一) 自主回収・再資源化事業計画の認定
example : plasticProductRecyclePlanCertFee = 150_000 := by decide
-- 百五十六の四(二) 再資源化事業計画の認定
example : plasticWasteRecyclePlanCertFee = 150_000 := by decide
-- 百五十六の五(一) 高度再資源化事業計画の認定
example : advancedRecyclePlanCertFee = 150_000 := by decide
-- 百五十六の五(二) 高度再資源化事業計画の変更の認定
example : advancedRecyclePlanChangeCertFee = 30_000 := by decide
-- 百五十六の五(三) 高度分離・回収事業計画の認定
example : advancedSeparationRecoveryPlanCertFee = 150_000 := by decide
-- 百五十六の五(四) 高度分離・回収事業計画の変更の認定
example : advancedSeparationRecoveryPlanChangeCertFee = 30_000 := by decide
-- 百五十六の五(五) 登録調査機関の登録
example : advancedRecycleSurveyOrgRegFee = 90_000 := by decide
-- 百五十六の六(一) 太陽電池廃棄物再資源化等事業計画の認定
example : solarPanelWasteRecyclePlanCertFee = 150_000 := by decide
-- 百五十六の六(二) 同事業計画の変更の認定
example : solarPanelWasteRecyclePlanChangeCertFee = 30_000 := by decide
-- 百五十七(一) 人材認定等事業の登録
example : environmentalHumanResourceCertBizRegFee = 15_000 := by decide
-- 百五十七(二) 体験の機会の場の認定
example : experienceOpportunitySiteCertFee = 15_000 := by decide
-- 百五十八(一) 登録特定原動機検査機関の登録
example : registeredSpecificEngineInspectionOrgRegFee = 90_000 := by decide
-- 百五十八(二) 登録特定特殊自動車検査機関の登録
example : registeredSpecialVehicleInspectionOrgRegFee = 90_000 := by decide
-- 百五十九(一) 特別国際種事業者の登録
example : specialInternationalSpeciesBizRegFee = 90_000 := by decide
-- 百五十九(二) 個体等登録機関の登録
example : individualRegistrationOrgRegFee = 90_000 := by decide
-- 百五十九(三) 事業登録機関の登録
example : bizRegistrationOrgRegFee = 90_000 := by decide
-- 百五十九(四) 認定機関の登録
example : certificationOrgRegFee = 90_000 := by decide

end JapanTaxLaw
