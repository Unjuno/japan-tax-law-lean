import JapanTaxLaw.RegistrationQualificationFeesP4F

/-!
# RegistrationQualificationFeesP4FSpec spec — independent restatement of
     登録免許税法 別表第一（二）第三十二号 九十七〜百二

Sources (pinned; identical to RegistrationQualificationFeesP4F.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 九十七〜百二 の flat 額 from the statutory text itself.
全 28 件が一件につきの固定額（割合なし）。百（四）・百一（十）のデーミング規定は
金額なし行として扱い spec def を作らない（主額の九万円のみ）。

Scope boundaries identical to the implementation（九十六 以前・百三 以降は NOT YET COVERED;
「更新の登録を除く」「政令で定めるものに限る」等の適用判定は caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 九十七 石油パイプライン事業の許可／導管の変更の許可。 -/
def specOilPipelinePermitFee : Money := 90_000
/-- Spec: 九十八 石油輸入業者の登録。 -/
def specOilImporterRegFee : Money := 30_000
/-- Spec: 九十九（一） 揮発油販売業者の登録。 -/
def specGasolineSellerRegFee : Money := 30_000
/-- Spec: 九十九（二） 揮発油特定加工業者の登録。 -/
def specGasolineSpecialProcessorRegFee : Money := 90_000
/-- Spec: 九十九（三） 軽油特定加工業者の登録。 -/
def specLightOilSpecialProcessorRegFee : Money := 90_000
/-- Spec: 九十九（四） 揮発油等に係る分析機関の登録。 -/
def specGasolineAnalysisOrgRegFee : Money := 90_000
/-- Spec: 百（一） 液化石油ガス販売事業者の登録。 -/
def specLpgSalesBizRegFee : Money := 30_000
/-- Spec: 百（二） 保安機関の認定。 -/
def specLpgSecurityOrgCertFee : Money := 90_000
/-- Spec: 百（三） 一般消費者等の数の増加の認可。 -/
def specLpgConsumerIncreaseApprovalFee : Money := 15_000
/-- Spec: 百（四） 検査機関の登録。 -/
def specLpgInspectOrgRegFee : Money := 90_000
/-- Spec: 百一（一） ガス小売事業の登録。 -/
def specGasRetailBizRegFee : Money := 90_000
/-- Spec: 百一（二） 指定旧供給区域等の変更の許可（区域の増加）。 -/
def specGasOldAreaChangePermitFee : Money := 90_000
/-- Spec: 百一（三） 指定旧供給区域等の変更の許可（供給地点群の増加）。 -/
def specGasSupplyPointGroupChangePermitFee : Money := 15_000
/-- Spec: 百一（四） 認定高度保安実施ガス小売事業者の認定。 -/
def specGasCertHighSecurityRetailerCertFee : Money := 90_000
/-- Spec: 百一（五） 一般ガス導管事業の許可／供給区域の増加。 -/
def specGasGeneralPipelineBizPermitFee : Money := 90_000
/-- Spec: 百一（六） 認定高度保安実施一般ガス導管事業者の認定。 -/
def specGasCertHighSecurityPipelineCertFee : Money := 90_000
/-- Spec: 百一（七） 認定高度保安実施特定ガス導管事業者の認定。 -/
def specGasCertHighSecuritySpecificPipelineCertFee : Money := 90_000
/-- Spec: 百一（八） 認定高度保安実施ガス製造事業者の認定。 -/
def specGasCertHighSecurityMakerCertFee : Money := 90_000
/-- Spec: 百一（九） 登録ガス工作物検査機関の登録。 -/
def specGasWorkInspectOrgRegFee : Money := 90_000
/-- Spec: 百一（十） 検査機関の登録（特定ガス用品）。 -/
def specGasProductInspectOrgRegFee : Money := 90_000
/-- Spec: 百二（一） 認定完成検査実施者の認定。 -/
def specHpGasCompletionInspectCertFee : Money := 90_000
/-- Spec: 百二（二） 認定保安検査実施者の認定。 -/
def specHpGasSecurityInspectCertFee : Money := 90_000
/-- Spec: 百二（三） 認定高度保安実施者の認定。 -/
def specHpGasHighSecurityCertFee : Money := 90_000
/-- Spec: 百二（四） 容器検査所の登録。 -/
def specHpGasContainerInspectOfficeRegFee : Money := 90_000
/-- Spec: 百二（五） 登録容器等製造業者の登録。 -/
def specHpGasContainerMakerRegFee : Money := 90_000
/-- Spec: 百二（六） 外国登録容器等製造業者の登録。 -/
def specHpGasForeignContainerMakerRegFee : Money := 90_000
/-- Spec: 百二（七） 登録特定設備製造業者の登録。 -/
def specHpGasSpecificEquipMakerRegFee : Money := 90_000
/-- Spec: 百二（八） 外国登録特定設備製造業者の登録。 -/
def specHpGasForeignSpecificEquipMakerRegFee : Money := 90_000

example : specOilPipelinePermitFee = 90_000 := by decide
example : specOilImporterRegFee = 30_000 := by decide
example : specGasolineSellerRegFee = 30_000 := by decide
example : specGasolineSpecialProcessorRegFee = 90_000 := by decide
example : specLightOilSpecialProcessorRegFee = 90_000 := by decide
example : specGasolineAnalysisOrgRegFee = 90_000 := by decide
example : specLpgSalesBizRegFee = 30_000 := by decide
example : specLpgSecurityOrgCertFee = 90_000 := by decide
example : specLpgConsumerIncreaseApprovalFee = 15_000 := by decide
example : specLpgInspectOrgRegFee = 90_000 := by decide
example : specGasRetailBizRegFee = 90_000 := by decide
example : specGasOldAreaChangePermitFee = 90_000 := by decide
example : specGasSupplyPointGroupChangePermitFee = 15_000 := by decide
example : specGasCertHighSecurityRetailerCertFee = 90_000 := by decide
example : specGasGeneralPipelineBizPermitFee = 90_000 := by decide
example : specGasCertHighSecurityPipelineCertFee = 90_000 := by decide
example : specGasCertHighSecuritySpecificPipelineCertFee = 90_000 := by decide
example : specGasCertHighSecurityMakerCertFee = 90_000 := by decide
example : specGasWorkInspectOrgRegFee = 90_000 := by decide
example : specGasProductInspectOrgRegFee = 90_000 := by decide
example : specHpGasCompletionInspectCertFee = 90_000 := by decide
example : specHpGasSecurityInspectCertFee = 90_000 := by decide
example : specHpGasHighSecurityCertFee = 90_000 := by decide
example : specHpGasContainerInspectOfficeRegFee = 90_000 := by decide
example : specHpGasContainerMakerRegFee = 90_000 := by decide
example : specHpGasForeignContainerMakerRegFee = 90_000 := by decide
example : specHpGasSpecificEquipMakerRegFee = 90_000 := by decide
example : specHpGasForeignSpecificEquipMakerRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP4F : Bool :=
  specOilPipelinePermitFee == oilPipelinePermitFee &&
  specOilImporterRegFee == oilImporterRegFee &&
  specGasolineSellerRegFee == gasolineSellerRegFee &&
  specGasolineSpecialProcessorRegFee == gasolineSpecialProcessorRegFee &&
  specLightOilSpecialProcessorRegFee == lightOilSpecialProcessorRegFee &&
  specGasolineAnalysisOrgRegFee == gasolineAnalysisOrgRegFee &&
  specLpgSalesBizRegFee == lpgSalesBizRegFee &&
  specLpgSecurityOrgCertFee == lpgSecurityOrgCertFee &&
  specLpgConsumerIncreaseApprovalFee == lpgConsumerIncreaseApprovalFee &&
  specLpgInspectOrgRegFee == lpgInspectOrgRegFee &&
  specGasRetailBizRegFee == gasRetailBizRegFee &&
  specGasOldAreaChangePermitFee == gasOldAreaChangePermitFee &&
  specGasSupplyPointGroupChangePermitFee == gasSupplyPointGroupChangePermitFee &&
  specGasCertHighSecurityRetailerCertFee == gasCertHighSecurityRetailerCertFee &&
  specGasGeneralPipelineBizPermitFee == gasGeneralPipelineBizPermitFee &&
  specGasCertHighSecurityPipelineCertFee == gasCertHighSecurityPipelineCertFee &&
  specGasCertHighSecuritySpecificPipelineCertFee == gasCertHighSecuritySpecificPipelineCertFee &&
  specGasCertHighSecurityMakerCertFee == gasCertHighSecurityMakerCertFee &&
  specGasWorkInspectOrgRegFee == gasWorkInspectOrgRegFee &&
  specGasProductInspectOrgRegFee == gasProductInspectOrgRegFee &&
  specHpGasCompletionInspectCertFee == hpGasCompletionInspectCertFee &&
  specHpGasSecurityInspectCertFee == hpGasSecurityInspectCertFee &&
  specHpGasHighSecurityCertFee == hpGasHighSecurityCertFee &&
  specHpGasContainerInspectOfficeRegFee == hpGasContainerInspectOfficeRegFee &&
  specHpGasContainerMakerRegFee == hpGasContainerMakerRegFee &&
  specHpGasForeignContainerMakerRegFee == hpGasForeignContainerMakerRegFee &&
  specHpGasSpecificEquipMakerRegFee == hpGasSpecificEquipMakerRegFee &&
  specHpGasForeignSpecificEquipMakerRegFee == hpGasForeignSpecificEquipMakerRegFee

example : agreeRegistrationQualificationFeesP4F = true := by decide

end JapanTaxLaw
