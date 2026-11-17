import JapanTaxLaw.TaxFinance

/-!
# RegistryQualificationFeesJ3 — 登録免許税法 別表第一（二）五十〜五十九 の手数料モデル (W-AD)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: reg_qual_C.txt（五十〜五十九、UTF-8、2550 文字）。

原文の fee string「〇〇件数一件につき△△円」「一局につき△△円」を読み、flat 定数
（`Money := Nat`）としてモデル化する。金額は日本語数字で検証して Arabic に変換。

  五十(一) 有限責任監査法人の登録 ....................... 十五万円 = 150,000
  五十(二) 登録上場会社等監査人の登録 ..................... 九万円 = 90,000
  五十(三) 実務補習団体等の認定 .......................... 十五万円 = 150,000
  五十の二 登録試験機関の登録 ............................ 十五万円 = 150,000
  五十の三 特定適格消費者団体の認定 ...................... 一万五千円 = 15,000
  五十一(一) 電気通信事業者の登録／業務区域増加変更登録 ... 十五万円 = 150,000
  五十一(二) 認定送信型対電気通信設備サイバー攻撃対処協会 .. 十五万円 = 150,000
  五十一(三) 登録講習機関の登録 .......................... 九万円 = 90,000
  五十一(四) 登録認定機関の登録 .......................... 九万円 = 90,000
  五十二 登録送信適正化機関の登録 ........................ 九万円 = 90,000
  五十三(一) 認定認証事業者の認定 ........................ 九万円 = 90,000
  五十三(二) 認定外国認証事業者の認定 .................... 九万円 = 90,000
  五十三の二 認定電子委任状取扱事業者の認定 .............. 九万円 = 90,000
  五十四(一) 無線局の免許 ................................ 三万円 = 30,000
             放送をする無線局（電波法第五条第四項）........ 十五万円 = 150,000
  五十四(二) 無線局の登録 ................................ 三万円 = 30,000
  五十四(三) 検査等事業者の登録 .......................... 九万円 = 90,000
  五十四(四) 外国点検事業者の登録 ........................ 九万円 = 90,000
  五十四(五) 登録証明機関の登録 .......................... 九万円 = 90,000
  五十四(六) 登録周波数終了対策機関の登録 ................ 九万円 = 90,000
  五十五(一) 認定基幹放送事業者の認定 .................... 九万円 = 90,000
  五十五(二) 登録一般放送事業者の登録／変更登録 .......... 九万円 = 90,000
  五十五(三) 認定放送持株会社の認定 ...................... 十五万円 = 150,000
  五十九(一) 一般信書便事業の許可 ........................ 九万円 = 90,000
  五十九(二) 特定信書便事業の許可 ........................ 三万円 = 30,000

  amount breakdown: 十五万円 7 件／九万円 14 件／三万円 3 件／一万五千円 1 件
  （放送局特例の十五万円を含む）＝ 25 件の flat fee。
  本範囲に割合型（千分の△・割合）は存在しない（原文で「千分」「割合」の出現 0 回を確認）。

Scope & honest boundaries:

* 一件／一局につきの固定額であることを検証するのみ。登録・認定・免許・許可の要件や
  適用判定は caller-established とし、ここではモデル化しない。
* 「更新の登録を除く。」「更新の認定を除く。」「再免許及び…政令で定める無線局の免許を除く。」
  「再登録その他政令で定める登録を除く。」「業務区域の増加に係るものに限る。」
  「一般放送の種類の増加／業務区域の増加に係るものに限る。」「電波法第五条第四項の放送をする
  無線局については…」等の該当性はすべて caller-established とし、金額定数には反映しない
  （Bool を式に入れていない）。軽減額の別 def は作らない。
* 五十一の（注）（電子委任状法による登録・変更登録の「みなし」規定）は金額を定める行ではなく、
  デーミング規定として fee def を作らず caller-established と明記する。
* 五十六から五十八まで は「削除」行で金額なし。fee def を作らず caller-established と明記する。
* 五十 以前・六十 以降は NOT YET COVERED。「登録件数」「認定件数」「許可件数」「局数」の
  意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ3

open JapanTaxLaw.TaxFinance

/-- 五十(一) 公認会計士法第三十四条の二十四（有限責任監査法人の登録）の登録、
        登録件数一件につき十五万円（固定 ¥150,000）。 -/
def limitedLiabilityAuditCorpRegFee : Money := 150_000

/-- 五十(二) 公認会計士法第三十四条の三十四の二（登録上場会社等監査人の登録）の登録、
        登録件数一件につき九万円（固定 ¥90,000）。 -/
def registeredListedCompanyAuditFirmRegFee : Money := 90_000

/-- 五十(三) 公認会計士法第十六条第一項（実務補習）の実務補習団体等の認定、
        認定件数一件につき十五万円（固定 ¥150,000）。 -/
def cpaPracticalTrainingOrgCertFee : Money := 150_000

/-- 五十の二 消費者安全法第十条の三第一項（登録試験機関の登録）の登録（更新の登録を除く。）、
        登録件数一件につき十五万円（固定 ¥150,000）。「更新の登録を除く。」は caller-established。 -/
def consumerAffairsCounselorExamOrgRegFee : Money := 150_000

/-- 五十の三 特定適格消費者団体の認定（更新の認定を除く。）、
        認定件数一件につき一万五千円（固定 ¥15,000）。「更新の認定を除く。」は caller-established。 -/
def specifiedQualifiedConsumerOrgCertFee : Money := 15_000

/-- 五十一(一) 電気通信事業法第九条（電気通信事業の登録）の電気通信事業者の登録
        （更新の登録を除く。）又は同法第十三条第一項（変更登録等）の変更登録
        （業務区域の増加に係るものに限る。）、登録件数一件につき十五万円（固定 ¥150,000）。
        更新・業務区域増加の該当性は caller-established。 -/
def telecomBusinessRegFee : Money := 150_000

/-- 五十一(二) 電気通信事業法第百十六条の二第一項（認定送信型対電気通信設備サイバー攻撃対処協会の認定）の認定、
        認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedCyberAttackResponseAssocCertFee : Money := 150_000

/-- 五十一(三) 電気通信事業法第八十五条の二第一項（登録講習機関の登録）の登録講習機関の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def telecomChiefEngineerTrainingOrgRegFee : Money := 90_000

/-- 五十一(四) 電気通信事業法第八十六条第一項（登録認定機関の登録）の登録認定機関の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def terminalEquipmentCertOrgRegFee : Money := 90_000

/-- 五十二 特定電子メールの送信の適正化等に関する法律第十四条第一項（登録送信適正化機関の登録）の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredSenderOptimizationOrgRegFee : Money := 90_000

/-- 五十三(一) 電子署名及び認証業務に関する法律第四条第一項（認定）の認定認証事業者の認定
        （更新の認定を除く。）、認定件数一件につき九万円（固定 ¥90,000）。
        「更新の認定を除く。」は caller-established。 -/
def certifiedCertificationBusinessRegFee : Money := 90_000

/-- 五十三(二) 電子署名及び認証業務に関する法律第十五条第一項（認定）の認定外国認証事業者の認定
        （更新の認定を除く。）、認定件数一件につき九万円（固定 ¥90,000）。
        「更新の認定を除く。」は caller-established。 -/
def certifiedForeignCertificationBusinessRegFee : Money := 90_000

/-- 五十三の二 電子委任状の普及の促進に関する法律第五条第一項（電子委任状取扱業務の認定）の
        認定電子委任状取扱事業者の認定（更新の認定を除く。）、認定件数一件につき九万円（固定 ¥90,000）。
        「更新の認定を除く。」は caller-established。 -/
def certifiedElectronicPowerOfAttorneyBusinessRegFee : Money := 90_000

/-- 五十四(一) 電波法第四条（無線局の開設）の無線局の免許（再免許及び政令で定める無線局の免許を除く。）、
        無線局の数一局につき三万円（固定 ¥30,000）。除外該当性は caller-established。 -/
def radioStationLicenseFee : Money := 30_000

/-- 五十四(一) の特例: 電波法第五条第四項の放送をする無線局については一局につき十五万円
        （固定 ¥150,000）。放送局該当性は caller-established。 -/
def broadcastRadioStationLicenseFee : Money := 150_000

/-- 五十四(二) 電波法第二十七条の二十一第一項（登録）の無線局の登録
        （再登録その他政令で定める登録を除く。）、無線局の数一局につき三万円（固定 ¥30,000）。
        除外該当性は caller-established。 -/
def radioStationRegFee : Money := 30_000

/-- 五十四(三) 電波法第二十四条の二第一項（検査等事業者の登録）の検査又は点検に係る事業者の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def radioEquipmentInspectionBusinessRegFee : Money := 90_000

/-- 五十四(四) 電波法第二十四条の十二第一項（外国点検事業者の登録）の外国における
        無線設備等の点検に係る事業者の登録、登録件数一件につき九万円（固定 ¥90,000）。 -/
def foreignRadioEquipmentInspectionBusinessRegFee : Money := 90_000

/-- 五十四(五) 電波法第三十八条の二の二第一項（登録証明機関の登録）の登録証明機関の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredRadioEquipmentCertOrgRegFee : Money := 90_000

/-- 五十四(六) 電波法第七十一条の三の二第一項（登録周波数終了対策機関の登録）の登録
        （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredFrequencyTerminationOrgRegFee : Money := 90_000

/-- 五十五(一) 放送法第九十三条第一項（認定）の認定基幹放送事業者の認定
        （更新の認定を除く。）、認定件数一件につき九万円（固定 ¥90,000）。
        「更新の認定を除く。」は caller-established。 -/
def certifiedKeyBroadcastBusinessCertFee : Money := 90_000

/-- 五十五(二) 放送法第百二十六条第一項（一般放送の業務の登録）の登録一般放送事業者の登録又は
        同法第百三十条第一項（変更登録）の変更登録（種類・業務区域の増加に係るものに限る。）、
        登録件数一件につき九万円（固定 ¥90,000）。増加該当性は caller-established。 -/
def registeredGeneralBroadcastBusinessRegFee : Money := 90_000

/-- 五十五(三) 放送法第百五十九条第一項（認定）の認定放送持株会社の認定、
        認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedBroadcastHoldingCompanyCertFee : Money := 150_000

/-- 五十九(一) 民間事業者による信書の送達に関する法律第六条（事業の許可）の一般信書便事業の許可、
        許可件数一件につき九万円（固定 ¥90,000）。 -/
def generalMailBusinessLicenseFee : Money := 90_000

/-- 五十九(二) 民間事業者による信書の送達に関する法律第二十九条（事業の許可）の特定信書便事業の許可、
        許可件数一件につき三万円（固定 ¥30,000）。 -/
def specifiedMailBusinessLicenseFee : Money := 30_000

-- positivity
theorem limitedLiabilityAuditCorpRegFee_pos : limitedLiabilityAuditCorpRegFee > 0 := by decide
theorem registeredListedCompanyAuditFirmRegFee_pos : registeredListedCompanyAuditFirmRegFee > 0 := by decide
theorem cpaPracticalTrainingOrgCertFee_pos : cpaPracticalTrainingOrgCertFee > 0 := by decide
theorem consumerAffairsCounselorExamOrgRegFee_pos : consumerAffairsCounselorExamOrgRegFee > 0 := by decide
theorem specifiedQualifiedConsumerOrgCertFee_pos : specifiedQualifiedConsumerOrgCertFee > 0 := by decide
theorem telecomBusinessRegFee_pos : telecomBusinessRegFee > 0 := by decide
theorem certifiedCyberAttackResponseAssocCertFee_pos : certifiedCyberAttackResponseAssocCertFee > 0 := by decide
theorem telecomChiefEngineerTrainingOrgRegFee_pos : telecomChiefEngineerTrainingOrgRegFee > 0 := by decide
theorem terminalEquipmentCertOrgRegFee_pos : terminalEquipmentCertOrgRegFee > 0 := by decide
theorem registeredSenderOptimizationOrgRegFee_pos : registeredSenderOptimizationOrgRegFee > 0 := by decide
theorem certifiedCertificationBusinessRegFee_pos : certifiedCertificationBusinessRegFee > 0 := by decide
theorem certifiedForeignCertificationBusinessRegFee_pos : certifiedForeignCertificationBusinessRegFee > 0 := by decide
theorem certifiedElectronicPowerOfAttorneyBusinessRegFee_pos : certifiedElectronicPowerOfAttorneyBusinessRegFee > 0 := by decide
theorem radioStationLicenseFee_pos : radioStationLicenseFee > 0 := by decide
theorem broadcastRadioStationLicenseFee_pos : broadcastRadioStationLicenseFee > 0 := by decide
theorem radioStationRegFee_pos : radioStationRegFee > 0 := by decide
theorem radioEquipmentInspectionBusinessRegFee_pos : radioEquipmentInspectionBusinessRegFee > 0 := by decide
theorem foreignRadioEquipmentInspectionBusinessRegFee_pos : foreignRadioEquipmentInspectionBusinessRegFee > 0 := by decide
theorem registeredRadioEquipmentCertOrgRegFee_pos : registeredRadioEquipmentCertOrgRegFee > 0 := by decide
theorem registeredFrequencyTerminationOrgRegFee_pos : registeredFrequencyTerminationOrgRegFee > 0 := by decide
theorem certifiedKeyBroadcastBusinessCertFee_pos : certifiedKeyBroadcastBusinessCertFee > 0 := by decide
theorem registeredGeneralBroadcastBusinessRegFee_pos : registeredGeneralBroadcastBusinessRegFee > 0 := by decide
theorem certifiedBroadcastHoldingCompanyCertFee_pos : certifiedBroadcastHoldingCompanyCertFee > 0 := by decide
theorem generalMailBusinessLicenseFee_pos : generalMailBusinessLicenseFee > 0 := by decide
theorem specifiedMailBusinessLicenseFee_pos : specifiedMailBusinessLicenseFee > 0 := by decide

-- smoke
example : limitedLiabilityAuditCorpRegFee = 150_000 := by decide
example : registeredListedCompanyAuditFirmRegFee = 90_000 := by decide
example : cpaPracticalTrainingOrgCertFee = 150_000 := by decide
example : consumerAffairsCounselorExamOrgRegFee = 150_000 := by decide
example : specifiedQualifiedConsumerOrgCertFee = 15_000 := by decide
example : telecomBusinessRegFee = 150_000 := by decide
example : certifiedCyberAttackResponseAssocCertFee = 150_000 := by decide
example : telecomChiefEngineerTrainingOrgRegFee = 90_000 := by decide
example : terminalEquipmentCertOrgRegFee = 90_000 := by decide
example : registeredSenderOptimizationOrgRegFee = 90_000 := by decide
example : certifiedCertificationBusinessRegFee = 90_000 := by decide
example : certifiedForeignCertificationBusinessRegFee = 90_000 := by decide
example : certifiedElectronicPowerOfAttorneyBusinessRegFee = 90_000 := by decide
example : radioStationLicenseFee = 30_000 := by decide
example : broadcastRadioStationLicenseFee = 150_000 := by decide
example : radioStationRegFee = 30_000 := by decide
example : radioEquipmentInspectionBusinessRegFee = 90_000 := by decide
example : foreignRadioEquipmentInspectionBusinessRegFee = 90_000 := by decide
example : registeredRadioEquipmentCertOrgRegFee = 90_000 := by decide
example : registeredFrequencyTerminationOrgRegFee = 90_000 := by decide
example : certifiedKeyBroadcastBusinessCertFee = 90_000 := by decide
example : registeredGeneralBroadcastBusinessRegFee = 90_000 := by decide
example : certifiedBroadcastHoldingCompanyCertFee = 150_000 := by decide
example : generalMailBusinessLicenseFee = 90_000 := by decide
example : specifiedMailBusinessLicenseFee = 30_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ3
