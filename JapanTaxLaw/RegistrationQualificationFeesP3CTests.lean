import JapanTaxLaw.RegistrationQualificationFeesP3C

/-!
# RegistrationQualificationFeesP3C tests — 別表第一（二）第三十二号 七十六〜八十二 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 七十六 登録研修機関（精神保健指定医）¥90,000
example : mentalHealthTrainingInstRegFee = 90_000 := by decide
-- 七十七（一）〜（六）医薬品・医療機器の製造販売業／製造業等
example : pharmaMarketingLicenseFee = 150_000 := by decide
example : pharmaManufactureLicenseFee = 90_000 := by decide
example : pharmaStorageOnlyFacilityRegFee = 90_000 := by decide
example : pharmaForeignManufacturerCertFee = 90_000 := by decide
example : pharmaForeignStorageOnlyRegFee = 90_000 := by decide
example : medicalDeviceMarketingLicenseFee = 150_000 := by decide
-- 七十七（七）〜（十四）医療機器・再生医療等製品・登録認証機関
example : medicalDeviceManufactureRegFee = 90_000 := by decide
example : medicalDeviceForeignManufacturerRegFee = 90_000 := by decide
example : regenProductMarketingLicenseFee = 150_000 := by decide
example : regenProductManufactureLicenseFee = 90_000 := by decide
example : regenProductForeignManufacturerCertFee = 90_000 := by decide
example : medicalDeviceRepairLicenseFee = 90_000 := by decide
example : pmdActDeemedLicenseFee = 90_000 := by decide
example : deviceCertificationBodyRegFee = 90_000 := by decide
-- 七十七の二（一）（二）特定細胞加工物等
example : specificCellProcessProductMfgLicenseFee = 90_000 := by decide
example : foreignCellProcessProductCertFee = 90_000 := by decide
-- 七十八〜八十
example : careManagerExamQuestionBodyRegFee = 150_000 := by decide
example : dcPensionMgmtBusinessRegFee = 90_000 := by decide
example : homeWorkSupportOrgRegFee = 15_000 := by decide
-- 八十一（一）〜（六）（注）のみなし規定は金額なし
example : feeChargingJobPlacementPermitFee = 90_000 := by decide
example : workerDispatchingPermitFee = 90_000 := by decide
example : portWorkerDispatchPermitFee = 90_000 := by decide
example : portDispatchScopeChangePermitFee = 15_000 := by decide
example : constructionJobPlacementPermitFee = 90_000 := by decide
example : constructionEmploymentOpportunityPermitFee = 90_000 := by decide
-- 八十一の二・八十二
example : careerCounselorExamBodyRegFee = 150_000 := by decide
example : buildingEnvMgmtCourseRegFee = 90_000 := by decide

end JapanTaxLaw
