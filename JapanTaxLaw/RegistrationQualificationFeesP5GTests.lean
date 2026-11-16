import JapanTaxLaw.RegistrationQualificationFeesP5G

/-!
# RegistrationQualificationFeesP5G tests — 別表第一（二）第三十二号 百三〜百十 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百三 熱供給事業の登録（¥90,000）
example : heatSupplyRegFee = 90_000 := by decide
-- 百四（一） 小売電気事業の登録（¥90,000）／（二） 指定旧供給区域の変更の許可（¥90,000）
example : retailElectricRegFee = 90_000 := by decide
example : oldSupplyAreaChangePermitFee = 90_000 := by decide
-- 百四（三） 一般送配電事業の許可（¥150,000）／（四） 供給区域外の供給の許可（¥15,000）
example : generalTransmissionPermitFee = 150_000 := by decide
example : outsideAreaSupplyPermitFee = 15_000 := by decide
-- 百四（五）（六） 送電・配電事業の許可（¥150,000）／（七） 供給区域外の供給（準用）（¥15,000）
example : transmissionBizPermitFee = 150_000 := by decide
example : distributionBizPermitFee = 150_000 := by decide
example : specificTransmissionOutsideSupplyPermitFee = 15_000 := by decide
-- 百四（八）（九） 特定送配電・特定供給（¥15,000）／（十） 認定高度保安実施設置者（¥90,000）
example : specificTransmissionRetailRegFee = 15_000 := by decide
example : specificSupplyPermitFee = 15_000 := by decide
example : highSecurityFacilityCertFee = 90_000 := by decide
-- 百四（十一） 認定電気使用者情報利用者等協会（¥150,000）／（十二）〜（十四）（¥90,000）
example : certElectricUserInfoAssocFee = 150_000 := by decide
example : registrationConformityOrgFee = 90_000 := by decide
example : registeredSafetyAuditOrgFee = 90_000 := by decide
example : registeredInvestigationOrgFee = 90_000 := by decide
-- 百五 登録電気工事業者（¥90,000）／百六 工場等に係る登録調査機関（¥90,000）
example : electricWorkContractorRegFee = 90_000 := by decide
example : factoryInvestigationOrgRegFee = 90_000 := by decide
-- 百七 工業用水道事業（¥90,000）／百八 深海底鉱業（¥90,000）／百八の二 登録導管輸送工作物検査機関（¥90,000）
example : industrialWaterPermitFee = 90_000 := by decide
example : deepSeabedMiningPermitFee = 90_000 := by decide
example : co2PipelineInspectOrgRegFee = 90_000 := by decide
-- 百九（一） アルコール製造／輸入（¥150,000）／（二） 販売（¥90,000）／（三） 使用（¥15,000）
example : alcoholMfgImportPermitFee = 150_000 := by decide
example : alcoholSalesPermitFee = 90_000 := by decide
example : alcoholUsePermitFee = 15_000 := by decide
-- 百十 航空機等の製造／修理事業の許可・事業の区分の変更（¥90,000）
example : aircraftMfgRepairPermitFee = 90_000 := by decide

end JapanTaxLaw
