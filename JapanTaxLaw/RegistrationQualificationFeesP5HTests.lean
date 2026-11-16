import JapanTaxLaw.RegistrationQualificationFeesP5H

/-!
# RegistrationQualificationFeesP5H tests — 別表第一（二）第三十二号 百十一〜百十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百十一 / 百十二 検査機関の登録（¥90,000）
example : specifiedElectricalApplianceInspectOrgRegFee = 90_000 := by decide
example : specialSpecificProductInspectOrgRegFee = 90_000 := by decide
-- 百十三（一）（二）（三） 登録認証機関・試験事業者の登録（¥90,000）
example : jisConformityCertificationBodyRegFee = 90_000 := by decide
example : domesticTestLabBusinessOperatorRegFee = 90_000 := by decide
example : foreignTestLabBusinessOperatorRegFee = 90_000 := by decide
-- 百十四（一）（二） 計量器校正事業者の登録・認定計量証明事業者の認定（¥90,000）
example : measuringInstrumentCalibrationBizRegFee = 90_000 := by decide
example : certifiedMetrologyCertificationBizLicenseFee = 90_000 := by decide
-- 百十五 登録機関の登録（¥90,000）
example : circuitLayoutRightRegOrgRegFee = 90_000 := by decide
-- 百十六（一）（二）（三） 登録情報処理機関・登録調査機関・特定登録調査機関（¥90,000）
example : registeredInfoProcessingOrgRegFee = 90_000 := by decide
example : registeredInvestigationOrgRegFee = 90_000 := by decide
example : specifiedRegisteredInvestigationOrgRegFee = 90_000 := by decide
-- 百十七 / 百十七の二 国外適合性評価事業・認定輸出者の認定（¥90,000）
example : foreignConformityAssessmentBizLicenseFee = 90_000 := by decide
example : certifiedExporterLicenseFee = 90_000 := by decide
-- 百十八（一）〜（七） 割賦販売法（すべて ¥150,000）
example : prepaidInstallmentSalesBizPermitFee = 150_000 := by decide
example : comprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : smallComprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : individualCreditPurchaseAgencyRegFee = 150_000 := by decide
example : prepaidSpecificTransactionBizPermitFee = 150_000 := by decide
example : creditCardNumberHandlingContractBizRegFee = 150_000 := by decide
example : certifiedInstallmentSalesAssociationLicenseFee = 150_000 := by decide
-- 百十九（一）（二） フロン類再生・破壊業者の許可（¥90,000）
example : class1FluorocarbonRecyclingBizPermitFee = 90_000 := by decide
example : fluorocarbonDestructionBizPermitFee = 90_000 := by decide
-- 百十九の二 認定技術等情報漏えい防止措置認証機関（¥15,000） / 百十九の三 登録確認機関（¥90,000）
example : techInfoLeakPreventionCertOrgLicenseFee = 15_000 := by decide
example : registeredVerificationOrgRegFee = 90_000 := by decide

end JapanTaxLaw
