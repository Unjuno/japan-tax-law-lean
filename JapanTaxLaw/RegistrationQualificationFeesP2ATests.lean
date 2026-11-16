import JapanTaxLaw.RegistrationQualificationFeesP2A

/-!
# RegistrationQualificationFeesP2A tests — 別表第一（二）第三十二号 五十九〜六十八 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 五十九（一）（二） 一般／特定信書便事業の許可
example : generalMailBusinessPermitFee = 90_000 := by decide
example : specifiedMailBusinessPermitFee = 30_000 := by decide
-- 六十 消防登録検定機関 ¥150,000 ／ 六十一 債権管理回収業 ¥150,000 ／ 六十二 会社電子公告調査機関 ¥90,000
example : fireEquipmentInspectionRegFee = 150_000 := by decide
example : debtCollectionBusinessPermitFee = 150_000 := by decide
example : companyElectronicNoticeRegFee = 90_000 := by decide
-- 六十三 技能実習監理団体 ¥15,000 ／ 六十四 通関業 ¥90,000
example : foreignTraineeMonitorPermitFee = 15_000 := by decide
example : customsBrokeragePermitFee = 90_000 := by decide
-- 六十五（一）酒類製造 ¥150,000 ／（二）イ 酒母 ¥90,000 ／ ロ もろみ ¥120,000
example : liquorManufactureLicenseFee = 150_000 := by decide
example : sakeSeedMashLicenseFee = 90_000 := by decide
example : moromiProductionLicenseFee = 120_000 := by decide
-- 六十五（三）イ 小売のみ ¥30,000 ／ ロ 販売・代理・媒介 ¥90,000 ／ ハ 条件解除（1 箇所）¥60,000
example : liquorRetailOnlyLicenseFee = 30_000 := by decide
example : liquorRetailLicenseFee = 90_000 := by decide
example : liquorRetailConditionRemovalFeePerPlace = 60_000 := by decide
-- 六十六（一）特定販売 ¥150,000 ／（二）卸売 ¥90,000 ／（三）小売 ¥15,000 ／（四）出張販売 ¥3,000
example : tobaccoSpecificRetailRegFee = 150_000 := by decide
example : tobaccoWholesaleRegFee = 90_000 := by decide
example : tobaccoRetailPermitFee = 15_000 := by decide
example : tobaccoMobileSalesPermitFee = 3_000 := by decide
-- 六十七（一）塩製造 ¥150,000 ／（二）塩特定販売 ¥150,000 ／（三）塩卸売 ¥90,000
example : saltManufacturerRegFee = 150_000 := by decide
example : saltSpecifiedSellerRegFee = 150_000 := by decide
example : saltWholesalerRegFee = 90_000 := by decide
-- 六十八 著作権等管理事業者の登録 ¥90,000
example : copyrightManagementBusinessRegFee = 90_000 := by decide

end JapanTaxLaw
