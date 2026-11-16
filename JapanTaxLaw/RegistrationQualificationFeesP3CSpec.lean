import JapanTaxLaw.RegistrationQualificationFeesP3C

/-!
# RegistrationQualificationFeesP3C spec — independent restatement of
    登録免許税法 別表第一（二）第三十二号 七十六〜八十二

Sources (pinned; identical to RegistrationQualificationFeesP3C.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 七十六〜八十二 の flat 額 from the statutory text itself.
八十一（注）のデーミング（みなし）規定は金額なし（spec def を作らない）。

Scope boundaries identical to the implementation（七十五 以前は NOT YET COVERED;
政令で定めるもの・更新の登録を除く・読み替えて適用・港湾ごとの増加の該当性は caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 七十六 登録研修機関（精神保健指定医）の登録。 -/
def specMentalHealthTrainingInstRegFee : Money := 90_000
/-- Spec: 七十七（一） 医薬品等の製造販売業の許可。 -/
def specPharmaMarketingLicenseFee : Money := 150_000
/-- Spec: 七十七（二） 医薬品等の製造業の許可。 -/
def specPharmaManufactureLicenseFee : Money := 90_000
/-- Spec: 七十七（三） 保管のみを行う製造所の登録。 -/
def specPharmaStorageOnlyFacilityRegFee : Money := 90_000
/-- Spec: 七十七（四） 医薬品等外国製造業者の認定。 -/
def specPharmaForeignManufacturerCertFee : Money := 90_000
/-- Spec: 七十七（五） 医薬品等外国製造業者の保管のみを行う製造所の登録。 -/
def specPharmaForeignStorageOnlyRegFee : Money := 90_000
/-- Spec: 七十七（六） 医療機器等の製造販売業の許可。 -/
def specMedicalDeviceMarketingLicenseFee : Money := 150_000
/-- Spec: 七十七（七） 医療機器等の製造の事業の登録。 -/
def specMedicalDeviceManufactureRegFee : Money := 90_000
/-- Spec: 七十七（八） 医療機器等外国製造業者の登録。 -/
def specMedicalDeviceForeignManufacturerRegFee : Money := 90_000
/-- Spec: 七十七（九） 再生医療等製品の製造販売の事業の許可。 -/
def specRegenProductMarketingLicenseFee : Money := 150_000
/-- Spec: 七十七（十） 再生医療等製品の製造業の許可。 -/
def specRegenProductManufactureLicenseFee : Money := 90_000
/-- Spec: 七十七（十一） 再生医療等製品外国製造業者の認定。 -/
def specRegenProductForeignManufacturerCertFee : Money := 90_000
/-- Spec: 七十七（十二） 医療機器の修理業の許可。 -/
def specMedicalDeviceRepairLicenseFee : Money := 90_000
/-- Spec: 七十七（十三） 第八十三条第一項の読み替え適用による許可・認定・登録。 -/
def specPmdActDeemedLicenseFee : Money := 90_000
/-- Spec: 七十七（十四） 登録認証機関の登録。 -/
def specDeviceCertificationBodyRegFee : Money := 90_000
/-- Spec: 七十七の二（一） 特定細胞加工物等の製造の許可。 -/
def specSpecificCellProcessProductMfgLicenseFee : Money := 90_000
/-- Spec: 七十七の二（二） 外国における特定細胞加工物等の製造の認定。 -/
def specForeignCellProcessProductCertFee : Money := 90_000
/-- Spec: 七十八 登録試験問題作成機関（介護支援専門員実務研修受講試験）の登録。 -/
def specCareManagerExamQuestionBodyRegFee : Money := 150_000
/-- Spec: 七十九 確定拠出年金運営管理業の登録。 -/
def specDcPensionMgmtBusinessRegFee : Money := 90_000
/-- Spec: 八十 在宅就業支援団体の登録。 -/
def specHomeWorkSupportOrgRegFee : Money := 15_000
/-- Spec: 八十一（一） 有料の職業紹介事業の許可。 -/
def specFeeChargingJobPlacementPermitFee : Money := 90_000
/-- Spec: 八十一（二） 労働者派遣事業の許可。 -/
def specWorkerDispatchingPermitFee : Money := 90_000
/-- Spec: 八十一（三） 港湾労働者派遣事業の許可。 -/
def specPortWorkerDispatchPermitFee : Money := 90_000
/-- Spec: 八十一（四） 派遣事業対象業務の種類の変更の許可（港湾ごとの増加に限る）。 -/
def specPortDispatchScopeChangePermitFee : Money := 15_000
/-- Spec: 八十一（五） 建設業務有料職業紹介事業の許可。 -/
def specConstructionJobPlacementPermitFee : Money := 90_000
/-- Spec: 八十一（六） 建設業務労働者就業機会確保事業の許可。 -/
def specConstructionEmploymentOpportunityPermitFee : Money := 90_000
/-- Spec: 八十一の二 登録試験機関（キャリアコンサルタント）の登録。 -/
def specCareerCounselorExamBodyRegFee : Money := 150_000
/-- Spec: 八十二 登録講習機関（建築物環境衛生管理技術者免状）の登録。 -/
def specBuildingEnvMgmtCourseRegFee : Money := 90_000

example : specMentalHealthTrainingInstRegFee = 90_000 := by decide
example : specPharmaMarketingLicenseFee = 150_000 := by decide
example : specPharmaManufactureLicenseFee = 90_000 := by decide
example : specPharmaStorageOnlyFacilityRegFee = 90_000 := by decide
example : specPharmaForeignManufacturerCertFee = 90_000 := by decide
example : specPharmaForeignStorageOnlyRegFee = 90_000 := by decide
example : specMedicalDeviceMarketingLicenseFee = 150_000 := by decide
example : specMedicalDeviceManufactureRegFee = 90_000 := by decide
example : specMedicalDeviceForeignManufacturerRegFee = 90_000 := by decide
example : specRegenProductMarketingLicenseFee = 150_000 := by decide
example : specRegenProductManufactureLicenseFee = 90_000 := by decide
example : specRegenProductForeignManufacturerCertFee = 90_000 := by decide
example : specMedicalDeviceRepairLicenseFee = 90_000 := by decide
example : specPmdActDeemedLicenseFee = 90_000 := by decide
example : specDeviceCertificationBodyRegFee = 90_000 := by decide
example : specSpecificCellProcessProductMfgLicenseFee = 90_000 := by decide
example : specForeignCellProcessProductCertFee = 90_000 := by decide
example : specCareManagerExamQuestionBodyRegFee = 150_000 := by decide
example : specDcPensionMgmtBusinessRegFee = 90_000 := by decide
example : specHomeWorkSupportOrgRegFee = 15_000 := by decide
example : specFeeChargingJobPlacementPermitFee = 90_000 := by decide
example : specWorkerDispatchingPermitFee = 90_000 := by decide
example : specPortWorkerDispatchPermitFee = 90_000 := by decide
example : specPortDispatchScopeChangePermitFee = 15_000 := by decide
example : specConstructionJobPlacementPermitFee = 90_000 := by decide
example : specConstructionEmploymentOpportunityPermitFee = 90_000 := by decide
example : specCareerCounselorExamBodyRegFee = 150_000 := by decide
example : specBuildingEnvMgmtCourseRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP3C : Bool :=
  specMentalHealthTrainingInstRegFee == mentalHealthTrainingInstRegFee &&
  specPharmaMarketingLicenseFee == pharmaMarketingLicenseFee &&
  specPharmaManufactureLicenseFee == pharmaManufactureLicenseFee &&
  specPharmaStorageOnlyFacilityRegFee == pharmaStorageOnlyFacilityRegFee &&
  specPharmaForeignManufacturerCertFee == pharmaForeignManufacturerCertFee &&
  specPharmaForeignStorageOnlyRegFee == pharmaForeignStorageOnlyRegFee &&
  specMedicalDeviceMarketingLicenseFee == medicalDeviceMarketingLicenseFee &&
  specMedicalDeviceManufactureRegFee == medicalDeviceManufactureRegFee &&
  specMedicalDeviceForeignManufacturerRegFee == medicalDeviceForeignManufacturerRegFee &&
  specRegenProductMarketingLicenseFee == regenProductMarketingLicenseFee &&
  specRegenProductManufactureLicenseFee == regenProductManufactureLicenseFee &&
  specRegenProductForeignManufacturerCertFee == regenProductForeignManufacturerCertFee &&
  specMedicalDeviceRepairLicenseFee == medicalDeviceRepairLicenseFee &&
  specPmdActDeemedLicenseFee == pmdActDeemedLicenseFee &&
  specDeviceCertificationBodyRegFee == deviceCertificationBodyRegFee &&
  specSpecificCellProcessProductMfgLicenseFee == specificCellProcessProductMfgLicenseFee &&
  specForeignCellProcessProductCertFee == foreignCellProcessProductCertFee &&
  specCareManagerExamQuestionBodyRegFee == careManagerExamQuestionBodyRegFee &&
  specDcPensionMgmtBusinessRegFee == dcPensionMgmtBusinessRegFee &&
  specHomeWorkSupportOrgRegFee == homeWorkSupportOrgRegFee &&
  specFeeChargingJobPlacementPermitFee == feeChargingJobPlacementPermitFee &&
  specWorkerDispatchingPermitFee == workerDispatchingPermitFee &&
  specPortWorkerDispatchPermitFee == portWorkerDispatchPermitFee &&
  specPortDispatchScopeChangePermitFee == portDispatchScopeChangePermitFee &&
  specConstructionJobPlacementPermitFee == constructionJobPlacementPermitFee &&
  specConstructionEmploymentOpportunityPermitFee == constructionEmploymentOpportunityPermitFee &&
  specCareerCounselorExamBodyRegFee == careerCounselorExamBodyRegFee &&
  specBuildingEnvMgmtCourseRegFee == buildingEnvMgmtCourseRegFee

example : agreeRegistrationQualificationFeesP3C = true := by decide

end JapanTaxLaw
