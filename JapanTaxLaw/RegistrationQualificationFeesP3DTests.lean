import JapanTaxLaw.RegistrationQualificationFeesP3D

/-!
# RegistrationQualificationFeesP3D tests — 別表第一（二）第三十二号 八十三〜八十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 八十三（一）〜（六） 労働安全衛生法（すべて ¥90,000）
example : laborSafetyInspecBusinessRegFee = 90_000 := by decide
example : laborSafetyTrainingInstRegFee = 90_000 := by decide
example : laborSafetyDesignReviewRegFee = 90_000 := by decide
example : laborSafetyPerformanceInspecRegFee = 90_000 := by decide
example : laborSafetyIndividualVerifyRegFee = 90_000 := by decide
example : laborSafetyTypeVerifyRegFee = 90_000 := by decide
-- 八十四（一）（二） 作業環境測定（¥90,000）／ 八十四の二 共済認可（¥150,000）
example : workEnvMeasureOrgRegFee = 90_000 := by decide
example : workEnvMeasureCourseInstRegFee = 90_000 := by decide
example : smallBizMutualAidApprovalFee = 150_000 := by decide
-- 八十五 中央卸売市場（¥15,000）／ 八十五の二 輸出植物等（¥90,000）
example : centralWholesaleMarketCertFee = 15_000 := by decide
example : exportPlantInspectOrgRegFee = 90_000 := by decide
-- 八十六（一）（二） 登録検査機関・区分増加（¥150,000）／（三） 種類・区域増加（¥30,000）
example : agriProduceInspectOrgRegFee = 150_000 := by decide
example : agriProduceChangeRegFee = 150_000 := by decide
example : agriProduceTypeAreaChangeRegFee = 30_000 := by decide
-- 八十七（一）〜（三） 日本農林規格（¥90,000）／ 八十七の二 登録生産者団体（¥90,000）
example : japaneseAgriStdCertOrgRegFee = 90_000 := by decide
example : japaneseAgriStdTestBizRegFee = 90_000 := by decide
example : japaneseAgriStdForeignTestBizRegFee = 90_000 := by decide
example : registeredProducerGroupRegFee = 90_000 := by decide
-- 八十七の三（一）（二） 登録発行機関・登録認定機関（¥90,000）
example : exportCertIssuerRegFee = 90_000 := by decide
example : exportFacilityCertOrgRegFee = 90_000 := by decide
-- 八十八（一）〜（四） 普通肥料（すべて ¥15,000）
example : ordinaryFertilizerProductionRegFee = 15_000 := by decide
example : ordinaryFertilizerImportRegFee = 15_000 := by decide
example : ordinaryFertilizerTempRegFee = 15_000 := by decide
example : foreignFertilizerRegFee = 15_000 := by decide
-- 八十九（一）〜（三） 特定飼料等（すべて ¥90,000）
example : specificFeedMakerRegFee = 90_000 := by decide
example : foreignSpecificFeedMakerRegFee = 90_000 := by decide
example : feedTestOrgRegFee = 90_000 := by decide

end JapanTaxLaw
