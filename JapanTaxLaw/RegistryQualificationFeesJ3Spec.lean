import JapanTaxLaw.RegistryQualificationFeesJ3

/-!
# RegistryQualificationFeesJ3Spec spec — 登録免許税法 別表第一（二）五十〜五十九 の独立定式

Sources (pinned; identical to RegistryQualificationFeesJ3.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

原文から独立に読み直した 25 件の flat 額（十五万円 7／九万円 14／三万円 3／一万五千円 1）。
本範囲に割合型（千分の△・割合）は存在しない。scope boundaries は実装と同一
（五十 以前・六十 以降 NOT YET COVERED、五十一（注）のデーミング規定・五十六〜五十八 の
「削除」行は fee def を作らず caller-established、更新登録等の適用判定も caller-established）。

`agreeRegistryQualificationFeesJ3` は定数同士の `==` 一致確認であり、法的意味の等価証明ではない。
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ3

open JapanTaxLaw.TaxFinance

/-- Spec: 五十(一) 有限責任監査法人の登録（十五万円）。 -/
def specLimitedLiabilityAuditCorpRegFee : Money := 150_000
/-- Spec: 五十(二) 登録上場会社等監査人の登録（九万円）。 -/
def specRegisteredListedCompanyAuditFirmRegFee : Money := 90_000
/-- Spec: 五十(三) 実務補習団体等の認定（十五万円）。 -/
def specCpaPracticalTrainingOrgCertFee : Money := 150_000
/-- Spec: 五十の二 消費生活相談員に係る登録試験機関の登録（十五万円）。 -/
def specConsumerAffairsCounselorExamOrgRegFee : Money := 150_000
/-- Spec: 五十の三 特定適格消費者団体の認定（一万五千円）。 -/
def specSpecifiedQualifiedConsumerOrgCertFee : Money := 15_000
/-- Spec: 五十一(一) 電気通信事業者の登録／業務区域増加の変更登録（十五万円）。 -/
def specTelecomBusinessRegFee : Money := 150_000
/-- Spec: 五十一(二) 認定送信型対電気通信設備サイバー攻撃対処協会の認定（十五万円）。 -/
def specCertifiedCyberAttackResponseAssocCertFee : Money := 150_000
/-- Spec: 五十一(三) 登録講習機関の登録（九万円）。 -/
def specTelecomChiefEngineerTrainingOrgRegFee : Money := 90_000
/-- Spec: 五十一(四) 登録認定機関の登録（九万円）。 -/
def specTerminalEquipmentCertOrgRegFee : Money := 90_000
/-- Spec: 五十二 登録送信適正化機関の登録（九万円）。 -/
def specRegisteredSenderOptimizationOrgRegFee : Money := 90_000
/-- Spec: 五十三(一) 認定認証事業者の認定（九万円）。 -/
def specCertifiedCertificationBusinessRegFee : Money := 90_000
/-- Spec: 五十三(二) 認定外国認証事業者の認定（九万円）。 -/
def specCertifiedForeignCertificationBusinessRegFee : Money := 90_000
/-- Spec: 五十三の二 認定電子委任状取扱事業者の認定（九万円）。 -/
def specCertifiedElectronicPowerOfAttorneyBusinessRegFee : Money := 90_000
/-- Spec: 五十四(一) 無線局の免許（三万円）。 -/
def specRadioStationLicenseFee : Money := 30_000
/-- Spec: 五十四(一) 特例 放送をする無線局の免許（十五万円）。 -/
def specBroadcastRadioStationLicenseFee : Money := 150_000
/-- Spec: 五十四(二) 無線局の登録（三万円）。 -/
def specRadioStationRegFee : Money := 30_000
/-- Spec: 五十四(三) 検査等事業者の登録（九万円）。 -/
def specRadioEquipmentInspectionBusinessRegFee : Money := 90_000
/-- Spec: 五十四(四) 外国点検事業者の登録（九万円）。 -/
def specForeignRadioEquipmentInspectionBusinessRegFee : Money := 90_000
/-- Spec: 五十四(五) 登録証明機関の登録（九万円）。 -/
def specRegisteredRadioEquipmentCertOrgRegFee : Money := 90_000
/-- Spec: 五十四(六) 登録周波数終了対策機関の登録（九万円）。 -/
def specRegisteredFrequencyTerminationOrgRegFee : Money := 90_000
/-- Spec: 五十五(一) 認定基幹放送事業者の認定（九万円）。 -/
def specCertifiedKeyBroadcastBusinessCertFee : Money := 90_000
/-- Spec: 五十五(二) 登録一般放送事業者の登録／変更登録（九万円）。 -/
def specRegisteredGeneralBroadcastBusinessRegFee : Money := 90_000
/-- Spec: 五十五(三) 認定放送持株会社の認定（十五万円）。 -/
def specCertifiedBroadcastHoldingCompanyCertFee : Money := 150_000
/-- Spec: 五十九(一) 一般信書便事業の許可（九万円）。 -/
def specGeneralMailBusinessLicenseFee : Money := 90_000
/-- Spec: 五十九(二) 特定信書便事業の許可（三万円）。 -/
def specSpecifiedMailBusinessLicenseFee : Money := 30_000

example : specLimitedLiabilityAuditCorpRegFee = 150_000 := by decide
example : specRegisteredListedCompanyAuditFirmRegFee = 90_000 := by decide
example : specCpaPracticalTrainingOrgCertFee = 150_000 := by decide
example : specConsumerAffairsCounselorExamOrgRegFee = 150_000 := by decide
example : specSpecifiedQualifiedConsumerOrgCertFee = 15_000 := by decide
example : specTelecomBusinessRegFee = 150_000 := by decide
example : specCertifiedCyberAttackResponseAssocCertFee = 150_000 := by decide
example : specTelecomChiefEngineerTrainingOrgRegFee = 90_000 := by decide
example : specTerminalEquipmentCertOrgRegFee = 90_000 := by decide
example : specRegisteredSenderOptimizationOrgRegFee = 90_000 := by decide
example : specCertifiedCertificationBusinessRegFee = 90_000 := by decide
example : specCertifiedForeignCertificationBusinessRegFee = 90_000 := by decide
example : specCertifiedElectronicPowerOfAttorneyBusinessRegFee = 90_000 := by decide
example : specRadioStationLicenseFee = 30_000 := by decide
example : specBroadcastRadioStationLicenseFee = 150_000 := by decide
example : specRadioStationRegFee = 30_000 := by decide
example : specRadioEquipmentInspectionBusinessRegFee = 90_000 := by decide
example : specForeignRadioEquipmentInspectionBusinessRegFee = 90_000 := by decide
example : specRegisteredRadioEquipmentCertOrgRegFee = 90_000 := by decide
example : specRegisteredFrequencyTerminationOrgRegFee = 90_000 := by decide
example : specCertifiedKeyBroadcastBusinessCertFee = 90_000 := by decide
example : specRegisteredGeneralBroadcastBusinessRegFee = 90_000 := by decide
example : specCertifiedBroadcastHoldingCompanyCertFee = 150_000 := by decide
example : specGeneralMailBusinessLicenseFee = 90_000 := by decide
example : specSpecifiedMailBusinessLicenseFee = 30_000 := by decide

/-- Agreement checks between implementation and Spec (constant-by-constant `==`). -/
def agreeRegistryQualificationFeesJ3 : Bool :=
  specLimitedLiabilityAuditCorpRegFee == limitedLiabilityAuditCorpRegFee &&
  specRegisteredListedCompanyAuditFirmRegFee == registeredListedCompanyAuditFirmRegFee &&
  specCpaPracticalTrainingOrgCertFee == cpaPracticalTrainingOrgCertFee &&
  specConsumerAffairsCounselorExamOrgRegFee == consumerAffairsCounselorExamOrgRegFee &&
  specSpecifiedQualifiedConsumerOrgCertFee == specifiedQualifiedConsumerOrgCertFee &&
  specTelecomBusinessRegFee == telecomBusinessRegFee &&
  specCertifiedCyberAttackResponseAssocCertFee == certifiedCyberAttackResponseAssocCertFee &&
  specTelecomChiefEngineerTrainingOrgRegFee == telecomChiefEngineerTrainingOrgRegFee &&
  specTerminalEquipmentCertOrgRegFee == terminalEquipmentCertOrgRegFee &&
  specRegisteredSenderOptimizationOrgRegFee == registeredSenderOptimizationOrgRegFee &&
  specCertifiedCertificationBusinessRegFee == certifiedCertificationBusinessRegFee &&
  specCertifiedForeignCertificationBusinessRegFee == certifiedForeignCertificationBusinessRegFee &&
  specCertifiedElectronicPowerOfAttorneyBusinessRegFee == certifiedElectronicPowerOfAttorneyBusinessRegFee &&
  specRadioStationLicenseFee == radioStationLicenseFee &&
  specBroadcastRadioStationLicenseFee == broadcastRadioStationLicenseFee &&
  specRadioStationRegFee == radioStationRegFee &&
  specRadioEquipmentInspectionBusinessRegFee == radioEquipmentInspectionBusinessRegFee &&
  specForeignRadioEquipmentInspectionBusinessRegFee == foreignRadioEquipmentInspectionBusinessRegFee &&
  specRegisteredRadioEquipmentCertOrgRegFee == registeredRadioEquipmentCertOrgRegFee &&
  specRegisteredFrequencyTerminationOrgRegFee == registeredFrequencyTerminationOrgRegFee &&
  specCertifiedKeyBroadcastBusinessCertFee == certifiedKeyBroadcastBusinessCertFee &&
  specRegisteredGeneralBroadcastBusinessRegFee == registeredGeneralBroadcastBusinessRegFee &&
  specCertifiedBroadcastHoldingCompanyCertFee == certifiedBroadcastHoldingCompanyCertFee &&
  specGeneralMailBusinessLicenseFee == generalMailBusinessLicenseFee &&
  specSpecifiedMailBusinessLicenseFee == specifiedMailBusinessLicenseFee

example : agreeRegistryQualificationFeesJ3 = true := by decide

end JapanTaxLaw.RegistryQualificationFeesJ3
