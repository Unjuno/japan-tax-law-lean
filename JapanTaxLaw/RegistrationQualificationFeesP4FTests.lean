import JapanTaxLaw.RegistrationQualificationFeesP4F

/-!
# RegistrationQualificationFeesP4F tests — 別表第一（二）第三十二号 九十七〜百二 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 九十七 石油パイプライン（¥90,000）／ 九十八 石油輸入業者（¥30,000）
example : oilPipelinePermitFee = 90_000 := by decide
example : oilImporterRegFee = 30_000 := by decide
-- 九十九（一） 揮発油販売業者（¥30,000）／（二）（三）（四）（¥90,000）
example : gasolineSellerRegFee = 30_000 := by decide
example : gasolineSpecialProcessorRegFee = 90_000 := by decide
example : lightOilSpecialProcessorRegFee = 90_000 := by decide
example : gasolineAnalysisOrgRegFee = 90_000 := by decide
-- 百（一） 液化石油ガス販売事業者（¥30,000）／（二）（四）（¥90,000）／（三）（¥15,000）
example : lpgSalesBizRegFee = 30_000 := by decide
example : lpgSecurityOrgCertFee = 90_000 := by decide
example : lpgConsumerIncreaseApprovalFee = 15_000 := by decide
example : lpgInspectOrgRegFee = 90_000 := by decide
-- 百一（一）（二）（四）（五）（六）（七）（八）（九）（十）（¥90,000）／（三）（¥15,000）
example : gasRetailBizRegFee = 90_000 := by decide
example : gasOldAreaChangePermitFee = 90_000 := by decide
example : gasSupplyPointGroupChangePermitFee = 15_000 := by decide
example : gasCertHighSecurityRetailerCertFee = 90_000 := by decide
example : gasGeneralPipelineBizPermitFee = 90_000 := by decide
example : gasCertHighSecurityPipelineCertFee = 90_000 := by decide
example : gasCertHighSecuritySpecificPipelineCertFee = 90_000 := by decide
example : gasCertHighSecurityMakerCertFee = 90_000 := by decide
example : gasWorkInspectOrgRegFee = 90_000 := by decide
example : gasProductInspectOrgRegFee = 90_000 := by decide
-- 百二（一）〜（八） 高圧ガス保安法（すべて ¥90,000）
example : hpGasCompletionInspectCertFee = 90_000 := by decide
example : hpGasSecurityInspectCertFee = 90_000 := by decide
example : hpGasHighSecurityCertFee = 90_000 := by decide
example : hpGasContainerInspectOfficeRegFee = 90_000 := by decide
example : hpGasContainerMakerRegFee = 90_000 := by decide
example : hpGasForeignContainerMakerRegFee = 90_000 := by decide
example : hpGasSpecificEquipMakerRegFee = 90_000 := by decide
example : hpGasForeignSpecificEquipMakerRegFee = 90_000 := by decide

end JapanTaxLaw
