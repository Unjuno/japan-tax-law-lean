import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP4F — 登録免許税法 別表第一（二）第三十二号 九十七〜百二 の flat fee モデル (W-F)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_97_102.txt（九十七〜百二、UTF-8）

Models 別表第一（二）第三十二号 の 九十七〜百二 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）:

   九十七     石油パイプライン事業の許可／導管の変更の許可 ... 一件につき九万円       → ¥90,000
   九十八     石油輸入業者の登録 ... 一件につき三万円                                → ¥30,000
   九十九（一） 揮発油販売業者の登録 ... 一件につき三万円                            → ¥30,000
   九十九（二） 揮発油特定加工業者の登録 ... 一件につき九万円                        → ¥90,000
   九十九（三） 軽油特定加工業者の登録 ... 一件につき九万円                          → ¥90,000
   九十九（四） 揮発油等に係る分析機関の登録 ... 一件につき九万円                    → ¥90,000
   百（一）   液化石油ガス販売事業者の登録 ... 一件につき三万円                      → ¥30,000
   百（二）   保安機関の認定 ... 一件につき九万円                                    → ¥90,000
   百（三）   一般消費者等の数の増加の認可 ... 一件につき一万五千円                  → ¥15,000
   百（四）   検査機関の登録 ... 一件につき九万円                                    → ¥90,000
   百一（一） ガス小売事業の登録 ... 一件につき九万円                                → ¥90,000
   百一（二） 指定旧供給区域等の変更の許可（区域の増加） ... 一件につき九万円        → ¥90,000
   百一（三） 指定旧供給区域等の変更の許可（供給地点群の増加） ... 一件につき一万五千円 → ¥15,000
   百一（四） 認定高度保安実施ガス小売事業者の認定 ... 一件につき九万円              → ¥90,000
   百一（五） 一般ガス導管事業の許可／供給区域の増加 ... 一件につき九万円            → ¥90,000
   百一（六） 認定高度保安実施一般ガス導管事業者の認定 ... 一件につき九万円          → ¥90,000
   百一（七） 認定高度保安実施特定ガス導管事業者の認定 ... 一件につき九万円          → ¥90,000
   百一（八） 認定高度保安実施ガス製造事業者の認定 ... 一件につき九万円              → ¥90,000
   百一（九） 登録ガス工作物検査機関の登録 ... 一件につき九万円                      → ¥90,000
   百一（十） 検査機関の登録（特定ガス用品） ... 一件につき九万円                    → ¥90,000
   百二（一） 認定完成検査実施者の認定 ... 一件につき九万円                          → ¥90,000
   百二（二） 認定保安検査実施者の認定 ... 一件につき九万円                          → ¥90,000
   百二（三） 認定高度保安実施者の認定 ... 一件につき九万円                          → ¥90,000
   百二（四） 容器検査所の登録 ... 一件につき九万円                                  → ¥90,000
   百二（五） 登録容器等製造業者の登録 ... 一件につき九万円                          → ¥90,000
   百二（六） 外国登録容器等製造業者の登録 ... 一件につき九万円                      → ¥90,000
   百二（七） 登録特定設備製造業者の登録 ... 一件につき九万円                        → ¥90,000
   百二（八） 外国登録特定設備製造業者の登録 ... 一件につき九万円                    → ¥90,000

全 28 件が一件につきの固定額。割合（千分の△）はない。
デーミング規定（百（四）・百一（十）の「既に（四）／（十）に掲げる登録を受けている者
については、一万五千円」）は金額なし行として扱い、別途 fee def を作らない
（主たる九万円のみを def 化）。金額なしの行はそれ以外にない。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
    caller-established とし、ここではモデル化しない。
* 「導管の延長の増加に係る許可で政令で定めるものに限る。」「更新の登録を除く。」
    「更新の認定を除く。」「政令で定めるものに限り、更新の登録を除く。」
    「これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。」
    「当該供給区域の属する市町村内における供給区域の増加に係るものを除く。」等の適用判定は
    caller-established とし、金額定数には反映しない。
* 百（四）・百一（十）のデーミング規定（既登録者は一万五千円）も caller-established とし、
    主額の定数には反映しない（デーミング用の別 def は作らない）。
* 九十六 以前・百三 以降は NOT YET COVERED。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 九十七 石油パイプライン事業法第五条第一項の石油パイプライン事業の許可又は同法第八条第一項の導管に係る変更の許可（導管の延長の増加に係る許可で政令で定めるものに限る。）の件数につきの額（固定 ¥90,000）。 -/
def oilPipelinePermitFee : Money := 90_000

/-- 九十八 石油の備蓄の確保等に関する法律第十六条（登録）の石油輸入業者の登録の件数につきの額（固定 ¥30,000）。 -/
def oilImporterRegFee : Money := 30_000

/-- 九十九（一） 揮発油等の品質の確保等に関する法律第三条（揮発油販売業者の登録）の揮発油販売業者の登録の件数につきの額（固定 ¥30,000）。 -/
def gasolineSellerRegFee : Money := 30_000

/-- 九十九（二） 揮発油等の品質の確保等に関する法律第十二条の二（揮発油特定加工業者の登録）の揮発油特定加工業者の登録の件数につきの額（固定 ¥90,000）。 -/
def gasolineSpecialProcessorRegFee : Money := 90_000

/-- 九十九（三） 揮発油等の品質の確保等に関する法律第十二条の九（軽油特定加工業者の登録）の軽油特定加工業者の登録の件数につきの額（固定 ¥90,000）。 -/
def lightOilSpecialProcessorRegFee : Money := 90_000

/-- 九十九（四） 揮発油等の品質の確保等に関する法律第十六条の二第一項等の揮発油等に係る分析機関の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasolineAnalysisOrgRegFee : Money := 90_000

/-- 百（一） 液化石油ガスの保安の確保及び取引の適正化に関する法律第三条第一項（事業の登録）の経済産業大臣がする液化石油ガス販売事業者の登録の件数につきの額（固定 ¥30,000）。 -/
def lpgSalesBizRegFee : Money := 30_000

/-- 百（二） 液化石油ガスの保安の確保及び取引の適正化に関する法律第二十九条第一項（認定）の経済産業大臣がする保安機関の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def lpgSecurityOrgCertFee : Money := 90_000

/-- 百（三） 液化石油ガスの保安の確保及び取引の適正化に関する法律第三十三条第一項の規定により経済産業大臣がする保安業務に係る一般消費者等の数の増加の認可の件数につきの額（固定 ¥15,000）。 -/
def lpgConsumerIncreaseApprovalFee : Money := 15_000

/-- 百（四） 液化石油ガスの保安の確保及び取引の適正化に関する法律第四十七条第一項（検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。既に（四）に掲げる登録を受けている者については一万五千円（デーミング、caller-established）。 -/
def lpgInspectOrgRegFee : Money := 90_000

/-- 百一（一） ガス事業法第三条（事業の登録）のガス小売事業の登録の件数につきの額（固定 ¥90,000）。 -/
def gasRetailBizRegFee : Money := 90_000

/-- 百一（二） 電気事業法等の一部を改正する等の法律附則第二十三条第一項の指定旧供給区域等の変更の許可（旧ガス事業法第六条第二項第三号の供給区域の増加に係るものに限り、当該供給区域の属する市町村内における供給区域の増加に係るものを除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasOldAreaChangePermitFee : Money := 90_000

/-- 百一（三） 電気事業法等の一部を改正する等の法律附則第二十三条第一項の指定旧供給区域等の変更の許可（旧ガス事業法第六条第二項第三号の供給地点群の増加に係るものに限る。）の件数につきの額（固定 ¥15,000）。 -/
def gasSupplyPointGroupChangePermitFee : Money := 15_000

/-- 百一（四） ガス事業法第三十四条の二（認定）の認定高度保安実施ガス小売事業者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasCertHighSecurityRetailerCertFee : Money := 90_000

/-- 百一（五） ガス事業法第三十五条（事業の許可）の一般ガス導管事業の許可又は同法第四十条第一項の供給区域の増加に係る変更の許可（これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasGeneralPipelineBizPermitFee : Money := 90_000

/-- 百一（六） ガス事業法第七十一条の二（認定）の認定高度保安実施一般ガス導管事業者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasCertHighSecurityPipelineCertFee : Money := 90_000

/-- 百一（七） ガス事業法第八十四条の二（認定）の認定高度保安実施特定ガス導管事業者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasCertHighSecuritySpecificPipelineCertFee : Money := 90_000

/-- 百一（八） ガス事業法第百四条の二（認定）の認定高度保安実施ガス製造事業者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasCertHighSecurityMakerCertFee : Money := 90_000

/-- 百一（九） ガス事業法第三十三条第一項・第六十九条第一項・第百二条第一項の登録ガス工作物検査機関の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def gasWorkInspectOrgRegFee : Money := 90_000

/-- 百一（十） ガス事業法第百四十六条第一項（検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。既に（十）に掲げる登録を受けている者については一万五千円（デーミング、caller-established）。 -/
def gasProductInspectOrgRegFee : Money := 90_000

/-- 百二（一） 高圧ガス保安法第二十条第三項第二号（完成検査）の認定完成検査実施者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasCompletionInspectCertFee : Money := 90_000

/-- 百二（二） 高圧ガス保安法第三十五条第一項第二号（保安検査）の認定保安検査実施者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasSecurityInspectCertFee : Money := 90_000

/-- 百二（三） 高圧ガス保安法第三十九条の十三（認定）の認定高度保安実施者の認定（更新の認定を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasHighSecurityCertFee : Money := 90_000

/-- 百二（四） 高圧ガス保安法第四十九条第一項（容器再検査）の容器検査所の登録（政令で定めるものに限り、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasContainerInspectOfficeRegFee : Money := 90_000

/-- 百二（五） 高圧ガス保安法第四十九条の五第一項の登録容器等製造業者の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasContainerMakerRegFee : Money := 90_000

/-- 百二（六） 高圧ガス保安法第四十九条の三十一第一項の外国登録容器等製造業者の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasForeignContainerMakerRegFee : Money := 90_000

/-- 百二（七） 高圧ガス保安法第五十六条の六の二第一項の登録特定設備製造業者の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasSpecificEquipMakerRegFee : Money := 90_000

/-- 百二（八） 高圧ガス保安法第五十六条の六の二十二第一項の外国登録特定設備製造業者の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def hpGasForeignSpecificEquipMakerRegFee : Money := 90_000

theorem oilPipelinePermitFee_pos : oilPipelinePermitFee > 0 := by decide
theorem oilImporterRegFee_pos : oilImporterRegFee > 0 := by decide
theorem gasolineSellerRegFee_pos : gasolineSellerRegFee > 0 := by decide
theorem gasolineSpecialProcessorRegFee_pos : gasolineSpecialProcessorRegFee > 0 := by decide
theorem lightOilSpecialProcessorRegFee_pos : lightOilSpecialProcessorRegFee > 0 := by decide
theorem gasolineAnalysisOrgRegFee_pos : gasolineAnalysisOrgRegFee > 0 := by decide
theorem lpgSalesBizRegFee_pos : lpgSalesBizRegFee > 0 := by decide
theorem lpgSecurityOrgCertFee_pos : lpgSecurityOrgCertFee > 0 := by decide
theorem lpgConsumerIncreaseApprovalFee_pos : lpgConsumerIncreaseApprovalFee > 0 := by decide
theorem lpgInspectOrgRegFee_pos : lpgInspectOrgRegFee > 0 := by decide
theorem gasRetailBizRegFee_pos : gasRetailBizRegFee > 0 := by decide
theorem gasOldAreaChangePermitFee_pos : gasOldAreaChangePermitFee > 0 := by decide
theorem gasSupplyPointGroupChangePermitFee_pos : gasSupplyPointGroupChangePermitFee > 0 := by decide
theorem gasCertHighSecurityRetailerCertFee_pos : gasCertHighSecurityRetailerCertFee > 0 := by decide
theorem gasGeneralPipelineBizPermitFee_pos : gasGeneralPipelineBizPermitFee > 0 := by decide
theorem gasCertHighSecurityPipelineCertFee_pos : gasCertHighSecurityPipelineCertFee > 0 := by decide
theorem gasCertHighSecuritySpecificPipelineCertFee_pos : gasCertHighSecuritySpecificPipelineCertFee > 0 := by decide
theorem gasCertHighSecurityMakerCertFee_pos : gasCertHighSecurityMakerCertFee > 0 := by decide
theorem gasWorkInspectOrgRegFee_pos : gasWorkInspectOrgRegFee > 0 := by decide
theorem gasProductInspectOrgRegFee_pos : gasProductInspectOrgRegFee > 0 := by decide
theorem hpGasCompletionInspectCertFee_pos : hpGasCompletionInspectCertFee > 0 := by decide
theorem hpGasSecurityInspectCertFee_pos : hpGasSecurityInspectCertFee > 0 := by decide
theorem hpGasHighSecurityCertFee_pos : hpGasHighSecurityCertFee > 0 := by decide
theorem hpGasContainerInspectOfficeRegFee_pos : hpGasContainerInspectOfficeRegFee > 0 := by decide
theorem hpGasContainerMakerRegFee_pos : hpGasContainerMakerRegFee > 0 := by decide
theorem hpGasForeignContainerMakerRegFee_pos : hpGasForeignContainerMakerRegFee > 0 := by decide
theorem hpGasSpecificEquipMakerRegFee_pos : hpGasSpecificEquipMakerRegFee > 0 := by decide
theorem hpGasForeignSpecificEquipMakerRegFee_pos : hpGasForeignSpecificEquipMakerRegFee > 0 := by decide

example : oilPipelinePermitFee = 90_000 := by decide
example : oilImporterRegFee = 30_000 := by decide
example : gasolineSellerRegFee = 30_000 := by decide
example : gasolineSpecialProcessorRegFee = 90_000 := by decide
example : lightOilSpecialProcessorRegFee = 90_000 := by decide
example : gasolineAnalysisOrgRegFee = 90_000 := by decide
example : lpgSalesBizRegFee = 30_000 := by decide
example : lpgSecurityOrgCertFee = 90_000 := by decide
example : lpgConsumerIncreaseApprovalFee = 15_000 := by decide
example : lpgInspectOrgRegFee = 90_000 := by decide
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
example : hpGasCompletionInspectCertFee = 90_000 := by decide
example : hpGasSecurityInspectCertFee = 90_000 := by decide
example : hpGasHighSecurityCertFee = 90_000 := by decide
example : hpGasContainerInspectOfficeRegFee = 90_000 := by decide
example : hpGasContainerMakerRegFee = 90_000 := by decide
example : hpGasForeignContainerMakerRegFee = 90_000 := by decide
example : hpGasSpecificEquipMakerRegFee = 90_000 := by decide
example : hpGasForeignSpecificEquipMakerRegFee = 90_000 := by decide

end JapanTaxLaw
