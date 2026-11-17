import JapanTaxLaw.RegistryQualificationFeesJ3

/-!
# RegistryQualificationFeesJ3 tests — 別表第一（二）五十〜五十九 の kernel-decide smoke

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

呼び出し側で適用判定が確定した後の金額定数を検証するのみ。Bool を式に入れず、
法的判断の自動化は行わない。
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ3

open JapanTaxLaw.TaxFinance

-- 五十(一) 有限責任監査法人の登録 十五万円
example : limitedLiabilityAuditCorpRegFee = 150_000 := by decide
-- 五十(二) 登録上場会社等監査人の登録 九万円
example : registeredListedCompanyAuditFirmRegFee = 90_000 := by decide
-- 五十(三) 実務補習団体等の認定 十五万円
example : cpaPracticalTrainingOrgCertFee = 150_000 := by decide
-- 五十の二 登録試験機関の登録 十五万円
example : consumerAffairsCounselorExamOrgRegFee = 150_000 := by decide
-- 五十の三 特定適格消費者団体の認定 一万五千円
example : specifiedQualifiedConsumerOrgCertFee = 15_000 := by decide
-- 五十一(一) 電気通信事業者の登録／業務区域増加の変更登録 十五万円
example : telecomBusinessRegFee = 150_000 := by decide
-- 五十一(二) 認定送信型対電気通信設備サイバー攻撃対処協会の認定 十五万円
example : certifiedCyberAttackResponseAssocCertFee = 150_000 := by decide
-- 五十一(三) 登録講習機関の登録 九万円
example : telecomChiefEngineerTrainingOrgRegFee = 90_000 := by decide
-- 五十一(四) 登録認定機関の登録 九万円
example : terminalEquipmentCertOrgRegFee = 90_000 := by decide
-- 五十二 登録送信適正化機関の登録 九万円
example : registeredSenderOptimizationOrgRegFee = 90_000 := by decide
-- 五十三(一) 認定認証事業者の認定 九万円
example : certifiedCertificationBusinessRegFee = 90_000 := by decide
-- 五十三(二) 認定外国認証事業者の認定 九万円
example : certifiedForeignCertificationBusinessRegFee = 90_000 := by decide
-- 五十三の二 認定電子委任状取扱事業者の認定 九万円
example : certifiedElectronicPowerOfAttorneyBusinessRegFee = 90_000 := by decide
-- 五十四(一) 無線局の免許 三万円
example : radioStationLicenseFee = 30_000 := by decide
-- 五十四(一) 特例 放送をする無線局の免許 十五万円
example : broadcastRadioStationLicenseFee = 150_000 := by decide
-- 五十四(二) 無線局の登録 三万円
example : radioStationRegFee = 30_000 := by decide
-- 五十四(三) 検査等事業者の登録 九万円
example : radioEquipmentInspectionBusinessRegFee = 90_000 := by decide
-- 五十四(四) 外国点検事業者の登録 九万円
example : foreignRadioEquipmentInspectionBusinessRegFee = 90_000 := by decide
-- 五十四(五) 登録証明機関の登録 九万円
example : registeredRadioEquipmentCertOrgRegFee = 90_000 := by decide
-- 五十四(六) 登録周波数終了対策機関の登録 九万円
example : registeredFrequencyTerminationOrgRegFee = 90_000 := by decide
-- 五十五(一) 認定基幹放送事業者の認定 九万円
example : certifiedKeyBroadcastBusinessCertFee = 90_000 := by decide
-- 五十五(二) 登録一般放送事業者の登録／変更登録 九万円
example : registeredGeneralBroadcastBusinessRegFee = 90_000 := by decide
-- 五十五(三) 認定放送持株会社の認定 十五万円
example : certifiedBroadcastHoldingCompanyCertFee = 150_000 := by decide
-- 五十九(一) 一般信書便事業の許可 九万円
example : generalMailBusinessLicenseFee = 90_000 := by decide
-- 五十九(二) 特定信書便事業の許可 三万円
example : specifiedMailBusinessLicenseFee = 30_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ3
