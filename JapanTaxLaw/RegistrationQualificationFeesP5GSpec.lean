import JapanTaxLaw.RegistrationQualificationFeesP5G

/-!
# RegistrationQualificationFeesP5GSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百三〜百十

Sources (pinned; identical to RegistrationQualificationFeesP5G.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百三〜百十 の flat 額 from the statutory text itself.
全 24 件が一件につきの固定額（割合なし）。デーミング規定・金額なし行は本範囲に存在しない。

Scope boundaries identical to the implementation（百二 以前・百十一 以降は NOT YET COVERED;
「更新の登録を除く」「…に限る。」等の適用判定は caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百三 熱供給事業の登録。 -/
def specHeatSupplyRegFee : Money := 90_000
/-- Spec: 百四（一） 小売電気事業の登録。 -/
def specRetailElectricRegFee : Money := 90_000
/-- Spec: 百四（二） 指定旧供給区域の変更の許可。 -/
def specOldSupplyAreaChangePermitFee : Money := 90_000
/-- Spec: 百四（三） 一般送配電事業の許可／供給区域の変更の許可。 -/
def specGeneralTransmissionPermitFee : Money := 150_000
/-- Spec: 百四（四） 供給区域外の供給の許可（第二十四条第一項）。 -/
def specOutsideAreaSupplyPermitFee : Money := 15_000
/-- Spec: 百四（五） 送電事業の許可／振替供給の相手方の変更の許可。 -/
def specTransmissionBizPermitFee : Money := 150_000
/-- Spec: 百四（六） 配電事業の許可／供給区域の変更の許可。 -/
def specDistributionBizPermitFee : Money := 150_000
/-- Spec: 百四（七） 供給区域外の供給の許可（準用）。 -/
def specSpecificTransmissionOutsideSupplyPermitFee : Money := 15_000
/-- Spec: 百四（八） 特定送配電事業者による小売供給の登録。 -/
def specSpecificTransmissionRetailRegFee : Money := 15_000
/-- Spec: 百四（九） 特定供給（電気を供給する事業の許可）。 -/
def specSpecificSupplyPermitFee : Money := 15_000
/-- Spec: 百四（十） 認定高度保安実施設置者の認定。 -/
def specHighSecurityFacilityCertFee : Money := 90_000
/-- Spec: 百四（十一） 認定電気使用者情報利用者等協会の認定。 -/
def specCertElectricUserInfoAssocFee : Money := 150_000
/-- Spec: 百四（十二） 登録適合性確認機関の登録。 -/
def specRegistrationConformityOrgFee : Money := 90_000
/-- Spec: 百四（十三） 登録安全管理審査機関の登録。 -/
def specRegisteredSafetyAuditOrgFee : Money := 90_000
/-- Spec: 百四（十四） 登録調査機関の登録。 -/
def specRegisteredInvestigationOrgFee : Money := 90_000
/-- Spec: 百五 登録電気工事業者の登録。 -/
def specElectricWorkContractorRegFee : Money := 90_000
/-- Spec: 百六 工場等に係る登録調査機関の登録。 -/
def specFactoryInvestigationOrgRegFee : Money := 90_000
/-- Spec: 百七 工業用水道事業の許可／給水区域の変更の許可。 -/
def specIndustrialWaterPermitFee : Money := 90_000
/-- Spec: 百八 深海底鉱業の許可／深海底鉱区の変更の許可。 -/
def specDeepSeabedMiningPermitFee : Money := 90_000
/-- Spec: 百八の二 登録導管輸送工作物検査機関の登録。 -/
def specCo2PipelineInspectOrgRegFee : Money := 90_000
/-- Spec: 百九（一） アルコールの製造／輸入の事業の許可。 -/
def specAlcoholMfgImportPermitFee : Money := 150_000
/-- Spec: 百九（二） アルコールの販売の事業の許可。 -/
def specAlcoholSalesPermitFee : Money := 90_000
/-- Spec: 百九（三） アルコールの使用の許可／変更の許可。 -/
def specAlcoholUsePermitFee : Money := 15_000
/-- Spec: 百十 航空機等の製造事業若しくは修理事業の許可／事業の区分の変更の許可。 -/
def specAircraftMfgRepairPermitFee : Money := 90_000

example : specHeatSupplyRegFee = 90_000 := by decide
example : specRetailElectricRegFee = 90_000 := by decide
example : specOldSupplyAreaChangePermitFee = 90_000 := by decide
example : specGeneralTransmissionPermitFee = 150_000 := by decide
example : specOutsideAreaSupplyPermitFee = 15_000 := by decide
example : specTransmissionBizPermitFee = 150_000 := by decide
example : specDistributionBizPermitFee = 150_000 := by decide
example : specSpecificTransmissionOutsideSupplyPermitFee = 15_000 := by decide
example : specSpecificTransmissionRetailRegFee = 15_000 := by decide
example : specSpecificSupplyPermitFee = 15_000 := by decide
example : specHighSecurityFacilityCertFee = 90_000 := by decide
example : specCertElectricUserInfoAssocFee = 150_000 := by decide
example : specRegistrationConformityOrgFee = 90_000 := by decide
example : specRegisteredSafetyAuditOrgFee = 90_000 := by decide
example : specRegisteredInvestigationOrgFee = 90_000 := by decide
example : specElectricWorkContractorRegFee = 90_000 := by decide
example : specFactoryInvestigationOrgRegFee = 90_000 := by decide
example : specIndustrialWaterPermitFee = 90_000 := by decide
example : specDeepSeabedMiningPermitFee = 90_000 := by decide
example : specCo2PipelineInspectOrgRegFee = 90_000 := by decide
example : specAlcoholMfgImportPermitFee = 150_000 := by decide
example : specAlcoholSalesPermitFee = 90_000 := by decide
example : specAlcoholUsePermitFee = 15_000 := by decide
example : specAircraftMfgRepairPermitFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP5G : Bool :=
  specHeatSupplyRegFee == heatSupplyRegFee &&
  specRetailElectricRegFee == retailElectricRegFee &&
  specOldSupplyAreaChangePermitFee == oldSupplyAreaChangePermitFee &&
  specGeneralTransmissionPermitFee == generalTransmissionPermitFee &&
  specOutsideAreaSupplyPermitFee == outsideAreaSupplyPermitFee &&
  specTransmissionBizPermitFee == transmissionBizPermitFee &&
  specDistributionBizPermitFee == distributionBizPermitFee &&
  specSpecificTransmissionOutsideSupplyPermitFee == specificTransmissionOutsideSupplyPermitFee &&
  specSpecificTransmissionRetailRegFee == specificTransmissionRetailRegFee &&
  specSpecificSupplyPermitFee == specificSupplyPermitFee &&
  specHighSecurityFacilityCertFee == highSecurityFacilityCertFee &&
  specCertElectricUserInfoAssocFee == certElectricUserInfoAssocFee &&
  specRegistrationConformityOrgFee == registrationConformityOrgFee &&
  specRegisteredSafetyAuditOrgFee == registeredSafetyAuditOrgFee &&
  specRegisteredInvestigationOrgFee == registeredInvestigationOrgFee &&
  specElectricWorkContractorRegFee == electricWorkContractorRegFee &&
  specFactoryInvestigationOrgRegFee == factoryInvestigationOrgRegFee &&
  specIndustrialWaterPermitFee == industrialWaterPermitFee &&
  specDeepSeabedMiningPermitFee == deepSeabedMiningPermitFee &&
  specCo2PipelineInspectOrgRegFee == co2PipelineInspectOrgRegFee &&
  specAlcoholMfgImportPermitFee == alcoholMfgImportPermitFee &&
  specAlcoholSalesPermitFee == alcoholSalesPermitFee &&
  specAlcoholUsePermitFee == alcoholUsePermitFee &&
  specAircraftMfgRepairPermitFee == aircraftMfgRepairPermitFee

example : agreeRegistrationQualificationFeesP5G = true := by decide

end JapanTaxLaw
