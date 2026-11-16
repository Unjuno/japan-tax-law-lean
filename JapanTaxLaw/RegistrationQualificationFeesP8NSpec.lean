import JapanTaxLaw.RegistrationQualificationFeesP8N

/-!
# RegistrationQualificationFeesP8NSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百五十二〜百五十九

Sources (pinned; identical to RegistrationQualificationFeesP8N.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百五十二〜百五十九 の flat 額 from the statutory text itself.
全 39 件が一件につきの固定額（割合なし、デーミング規定・金額なし行なし）。
scope boundaries identical to the implementation（百五十一 以前・百六十 以降は NOT YET COVERED;
「更新の登録／認定を除く」「財務省令で定めるものに限る」等の適用判定はすべて caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百五十二(一) 測量業者の登録。 -/
def specSurveyorBizRegFee : Money := 90_000
/-- Spec: 百五十二(二) 測量士に係る登録養成施設の登録。 -/
def specSurveyorTrainingFacilityRegFee : Money := 90_000
/-- Spec: 百五十三 業務主任者に係る登録試験機関の登録。 -/
def specOutdoorAdDisplayExamOrgRegFee : Money := 150_000
/-- Spec: 百五十四(一) 登録講習機関の登録（第十条の三）。 -/
def specStructuralDesignArchitectTrainingOrgRegFee : Money := 90_000
/-- Spec: 百五十四(二) 登録講習機関の登録（第二十二条の二）。 -/
def specArchitectTrainingOrgArticle22RegFee : Money := 90_000
/-- Spec: 百五十四(三) 登録講習機関の登録（第二十四条第二項）。 -/
def specArchitectTrainingOrgArticle24RegFee : Money := 90_000
/-- Spec: 百五十五(一) 登録住宅性能評価機関の登録。 -/
def specRegisteredHousingPerformanceEvalOrgRegFee : Money := 90_000
/-- Spec: 百五十五(二) 住宅性能評価に係る登録講習機関の登録。 -/
def specHousingPerfTrainingOrgRegFee : Money := 90_000
/-- Spec: 百五十五(三) 登録住宅型式性能認定等機関の登録。 -/
def specRegisteredHousingModelCertOrgRegFee : Money := 90_000
/-- Spec: 百五十五(四) 住宅の特別評価方法認定に係る登録試験機関の登録。 -/
def specHousingExamOrgRegFee : Money := 90_000
/-- Spec: 百五十五の二(一) 登録建築物エネルギー消費性能判定機関の登録。 -/
def specRegisteredBuildingEnergyPerfAssessOrgRegFee : Money := 90_000
/-- Spec: 百五十五の二(二) 登録建築物エネルギー消費性能評価機関の登録。 -/
def specRegisteredBuildingEnergyPerfEvalOrgRegFee : Money := 90_000
/-- Spec: 百五十五の三 登録調査機関の登録。 -/
def specUrbanGreenSpaceSurveyOrgRegFee : Money := 90_000
/-- Spec: 百五十六(一) 再生利用の認定。 -/
def specGeneralIndustrialWasteRecycleCertFee : Money := 150_000
/-- Spec: 百五十六(二) 広域的処理の認定。 -/
def specGeneralIndustrialWasteWideAreaCertFee : Money := 150_000
/-- Spec: 百五十六(三) 無害化処理の認定。 -/
def specGeneralIndustrialWasteDetoxCertFee : Money := 150_000
/-- Spec: 百五十六(四) 処理に係る変更の認定。 -/
def specWasteProcessingChangeCertFee : Money := 30_000
/-- Spec: 百五十六の二(一) 自主回収・再資源化事業計画の認定。 -/
def specUsedSpecifiedRecycledProductPlanCertFee : Money := 150_000
/-- Spec: 百五十六の二(二) 同事業計画の変更の認定。 -/
def specUsedSpecifiedRecycledProductPlanChangeCertFee : Money := 30_000
/-- Spec: 百五十六の三(一) 再資源化事業計画の認定。 -/
def specUsedSmallElectronicsRecyclePlanCertFee : Money := 150_000
/-- Spec: 百五十六の三(二)イ 収集区域の増加に係る変更認定。 -/
def specUsedSmallElectronicsPlanChangeAreaCertFee : Money := 30_000
/-- Spec: 百五十六の三(二)ロ 収集運搬処分者・業務種別の増加に係る変更認定。 -/
def specUsedSmallElectronicsPlanChangeOperatorCertFee : Money := 30_000
/-- Spec: 百五十六の四(一) 自主回収・再資源化事業計画の認定。 -/
def specPlasticProductRecyclePlanCertFee : Money := 150_000
/-- Spec: 百五十六の四(二) 再資源化事業計画の認定。 -/
def specPlasticWasteRecyclePlanCertFee : Money := 150_000
/-- Spec: 百五十六の五(一) 高度再資源化事業計画の認定。 -/
def specAdvancedRecyclePlanCertFee : Money := 150_000
/-- Spec: 百五十六の五(二) 高度再資源化事業計画の変更の認定。 -/
def specAdvancedRecyclePlanChangeCertFee : Money := 30_000
/-- Spec: 百五十六の五(三) 高度分離・回収事業計画の認定。 -/
def specAdvancedSeparationRecoveryPlanCertFee : Money := 150_000
/-- Spec: 百五十六の五(四) 高度分離・回収事業計画の変更の認定。 -/
def specAdvancedSeparationRecoveryPlanChangeCertFee : Money := 30_000
/-- Spec: 百五十六の五(五) 登録調査機関の登録。 -/
def specAdvancedRecycleSurveyOrgRegFee : Money := 90_000
/-- Spec: 百五十六の六(一) 太陽電池廃棄物再資源化等事業計画の認定。 -/
def specSolarPanelWasteRecyclePlanCertFee : Money := 150_000
/-- Spec: 百五十六の六(二) 同事業計画の変更の認定。 -/
def specSolarPanelWasteRecyclePlanChangeCertFee : Money := 30_000
/-- Spec: 百五十七(一) 人材認定等事業の登録。 -/
def specEnvironmentalHumanResourceCertBizRegFee : Money := 15_000
/-- Spec: 百五十七(二) 体験の機会の場の認定。 -/
def specExperienceOpportunitySiteCertFee : Money := 15_000
/-- Spec: 百五十八(一) 登録特定原動機検査機関の登録。 -/
def specRegisteredSpecificEngineInspectionOrgRegFee : Money := 90_000
/-- Spec: 百五十八(二) 登録特定特殊自動車検査機関の登録。 -/
def specRegisteredSpecialVehicleInspectionOrgRegFee : Money := 90_000
/-- Spec: 百五十九(一) 特別国際種事業者の登録。 -/
def specSpecialInternationalSpeciesBizRegFee : Money := 90_000
/-- Spec: 百五十九(二) 個体等登録機関の登録。 -/
def specIndividualRegistrationOrgRegFee : Money := 90_000
/-- Spec: 百五十九(三) 事業登録機関の登録。 -/
def specBizRegistrationOrgRegFee : Money := 90_000
/-- Spec: 百五十九(四) 認定機関の登録。 -/
def specCertificationOrgRegFee : Money := 90_000

example : specSurveyorBizRegFee = 90_000 := by decide
example : specSurveyorTrainingFacilityRegFee = 90_000 := by decide
example : specOutdoorAdDisplayExamOrgRegFee = 150_000 := by decide
example : specStructuralDesignArchitectTrainingOrgRegFee = 90_000 := by decide
example : specArchitectTrainingOrgArticle22RegFee = 90_000 := by decide
example : specArchitectTrainingOrgArticle24RegFee = 90_000 := by decide
example : specRegisteredHousingPerformanceEvalOrgRegFee = 90_000 := by decide
example : specHousingPerfTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredHousingModelCertOrgRegFee = 90_000 := by decide
example : specHousingExamOrgRegFee = 90_000 := by decide
example : specRegisteredBuildingEnergyPerfAssessOrgRegFee = 90_000 := by decide
example : specRegisteredBuildingEnergyPerfEvalOrgRegFee = 90_000 := by decide
example : specUrbanGreenSpaceSurveyOrgRegFee = 90_000 := by decide
example : specGeneralIndustrialWasteRecycleCertFee = 150_000 := by decide
example : specGeneralIndustrialWasteWideAreaCertFee = 150_000 := by decide
example : specGeneralIndustrialWasteDetoxCertFee = 150_000 := by decide
example : specWasteProcessingChangeCertFee = 30_000 := by decide
example : specUsedSpecifiedRecycledProductPlanCertFee = 150_000 := by decide
example : specUsedSpecifiedRecycledProductPlanChangeCertFee = 30_000 := by decide
example : specUsedSmallElectronicsRecyclePlanCertFee = 150_000 := by decide
example : specUsedSmallElectronicsPlanChangeAreaCertFee = 30_000 := by decide
example : specUsedSmallElectronicsPlanChangeOperatorCertFee = 30_000 := by decide
example : specPlasticProductRecyclePlanCertFee = 150_000 := by decide
example : specPlasticWasteRecyclePlanCertFee = 150_000 := by decide
example : specAdvancedRecyclePlanCertFee = 150_000 := by decide
example : specAdvancedRecyclePlanChangeCertFee = 30_000 := by decide
example : specAdvancedSeparationRecoveryPlanCertFee = 150_000 := by decide
example : specAdvancedSeparationRecoveryPlanChangeCertFee = 30_000 := by decide
example : specAdvancedRecycleSurveyOrgRegFee = 90_000 := by decide
example : specSolarPanelWasteRecyclePlanCertFee = 150_000 := by decide
example : specSolarPanelWasteRecyclePlanChangeCertFee = 30_000 := by decide
example : specEnvironmentalHumanResourceCertBizRegFee = 15_000 := by decide
example : specExperienceOpportunitySiteCertFee = 15_000 := by decide
example : specRegisteredSpecificEngineInspectionOrgRegFee = 90_000 := by decide
example : specRegisteredSpecialVehicleInspectionOrgRegFee = 90_000 := by decide
example : specSpecialInternationalSpeciesBizRegFee = 90_000 := by decide
example : specIndividualRegistrationOrgRegFee = 90_000 := by decide
example : specBizRegistrationOrgRegFee = 90_000 := by decide
example : specCertificationOrgRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP8N : Bool :=
  specSurveyorBizRegFee == surveyorBizRegFee &&
  specSurveyorTrainingFacilityRegFee == surveyorTrainingFacilityRegFee &&
  specOutdoorAdDisplayExamOrgRegFee == outdoorAdDisplayExamOrgRegFee &&
  specStructuralDesignArchitectTrainingOrgRegFee == structuralDesignArchitectTrainingOrgRegFee &&
  specArchitectTrainingOrgArticle22RegFee == architectTrainingOrgArticle22RegFee &&
  specArchitectTrainingOrgArticle24RegFee == architectTrainingOrgArticle24RegFee &&
  specRegisteredHousingPerformanceEvalOrgRegFee == registeredHousingPerformanceEvalOrgRegFee &&
  specHousingPerfTrainingOrgRegFee == housingPerfTrainingOrgRegFee &&
  specRegisteredHousingModelCertOrgRegFee == registeredHousingModelCertOrgRegFee &&
  specHousingExamOrgRegFee == housingExamOrgRegFee &&
  specRegisteredBuildingEnergyPerfAssessOrgRegFee == registeredBuildingEnergyPerfAssessOrgRegFee &&
  specRegisteredBuildingEnergyPerfEvalOrgRegFee == registeredBuildingEnergyPerfEvalOrgRegFee &&
  specUrbanGreenSpaceSurveyOrgRegFee == urbanGreenSpaceSurveyOrgRegFee &&
  specGeneralIndustrialWasteRecycleCertFee == generalIndustrialWasteRecycleCertFee &&
  specGeneralIndustrialWasteWideAreaCertFee == generalIndustrialWasteWideAreaCertFee &&
  specGeneralIndustrialWasteDetoxCertFee == generalIndustrialWasteDetoxCertFee &&
  specWasteProcessingChangeCertFee == wasteProcessingChangeCertFee &&
  specUsedSpecifiedRecycledProductPlanCertFee == usedSpecifiedRecycledProductPlanCertFee &&
  specUsedSpecifiedRecycledProductPlanChangeCertFee == usedSpecifiedRecycledProductPlanChangeCertFee &&
  specUsedSmallElectronicsRecyclePlanCertFee == usedSmallElectronicsRecyclePlanCertFee &&
  specUsedSmallElectronicsPlanChangeAreaCertFee == usedSmallElectronicsPlanChangeAreaCertFee &&
  specUsedSmallElectronicsPlanChangeOperatorCertFee == usedSmallElectronicsPlanChangeOperatorCertFee &&
  specPlasticProductRecyclePlanCertFee == plasticProductRecyclePlanCertFee &&
  specPlasticWasteRecyclePlanCertFee == plasticWasteRecyclePlanCertFee &&
  specAdvancedRecyclePlanCertFee == advancedRecyclePlanCertFee &&
  specAdvancedRecyclePlanChangeCertFee == advancedRecyclePlanChangeCertFee &&
  specAdvancedSeparationRecoveryPlanCertFee == advancedSeparationRecoveryPlanCertFee &&
  specAdvancedSeparationRecoveryPlanChangeCertFee == advancedSeparationRecoveryPlanChangeCertFee &&
  specAdvancedRecycleSurveyOrgRegFee == advancedRecycleSurveyOrgRegFee &&
  specSolarPanelWasteRecyclePlanCertFee == solarPanelWasteRecyclePlanCertFee &&
  specSolarPanelWasteRecyclePlanChangeCertFee == solarPanelWasteRecyclePlanChangeCertFee &&
  specEnvironmentalHumanResourceCertBizRegFee == environmentalHumanResourceCertBizRegFee &&
  specExperienceOpportunitySiteCertFee == experienceOpportunitySiteCertFee &&
  specRegisteredSpecificEngineInspectionOrgRegFee == registeredSpecificEngineInspectionOrgRegFee &&
  specRegisteredSpecialVehicleInspectionOrgRegFee == registeredSpecialVehicleInspectionOrgRegFee &&
  specSpecialInternationalSpeciesBizRegFee == specialInternationalSpeciesBizRegFee &&
  specIndividualRegistrationOrgRegFee == individualRegistrationOrgRegFee &&
  specBizRegistrationOrgRegFee == bizRegistrationOrgRegFee &&
  specCertificationOrgRegFee == certificationOrgRegFee

example : agreeRegistrationQualificationFeesP8N = true := by decide

end JapanTaxLaw
