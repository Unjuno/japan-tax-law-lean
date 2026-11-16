import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP5H — 登録免許税法 別表第一（二）第三十二号 百十一〜百十九 の flat fee モデル (W-H)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_111_119.txt（百十一〜百十九、UTF-8）

Models 別表第一（二）第三十二号 の 百十一〜百十九 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 24 箇所で、
割合（千分の△）は本範囲に存在しない。全 24 件を一件につきの固定額としてモデル化する。

  百十一     特定電気用品に係る検査機関の登録 ... 一件につき九万円       → ¥90,000
  百十二     特別特定製品に係る検査機関の登録 ... 一件につき九万円       → ¥90,000
  百十三（一） 登録認証機関の登録（日本産業規格への適合表示） ... 九万円  → ¥90,000
  百十三（二） 国内試験所の製品試験等に係る事業者の登録 ... 九万円        → ¥90,000
  百十三（三） 外国試験所の製品試験等に係る試験事業者の登録 ... 九万円    → ¥90,000
  百十四（一） 計量器の校正等に係る事業者の登録 ... 九万円                → ¥90,000
  百十四（二） 認定特定計量証明事業者の認定 ... 九万円                    → ¥90,000
  百十五     回路配置利用権の設定登録等事務に係る登録機関の登録 ... 九万円 → ¥90,000
  百十六（一） 登録情報処理機関の登録 ... 九万円                          → ¥90,000
  百十六（二） 登録調査機関の登録 ... 九万円                              → ¥90,000
  百十六（三） 特定登録調査機関の登録 ... 九万円                          → ¥90,000
  百十七     国外適合性評価事業の認定 ... 九万円                          → ¥90,000
  百十七の二  認定輸出者の認定（第二種特定原産地証明書） ... 九万円       → ¥90,000
  百十八（一） 前払式割賦販売業の許可 ... 十五万円                         → ¥150,000
  百十八（二） 包括信用購入あつせん業者の登録 ... 十五万円                 → ¥150,000
  百十八（三） 少額包括信用購入あつせん業者の登録 ... 十五万円             → ¥150,000
  百十八（四） 個別信用購入あつせん業者の登録 ... 十五万円                 → ¥150,000
  百十八（五） 前払式特定取引業の許可 ... 十五万円                         → ¥150,000
  百十八（六） クレジットカード番号等取扱契約締結事業者の登録 ... 十五万円 → ¥150,000
  百十八（七） 認定割賦販売協会の認定 ... 十五万円                         → ¥150,000
  百十九（一） 第一種フロン類再生業者の許可 ... 九万円                     → ¥90,000
  百十九（二） フロン類破壊業者の許可 ... 九万円                           → ¥90,000
  百十九の二  認定技術等情報漏えい防止措置認証機関の認定 ... 一万五千円   → ¥15,000
  百十九の三  排出目標量及び排出実績量に係る登録確認機関の登録 ... 九万円 → ¥90,000

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
  caller-established とし、ここではモデル化しない。
* 「更新の登録を除く。」「更新の認定を除く。」「更新の許可を除く。」等の適用判定は
  caller-established とし、金額定数には反映しない（本範囲に「政令で定めるものに限る」
  は存在しない）。
* デーミング規定（百十一・百十二・百十三（一）（二）（三）・百十四（一）・百十七の
  「既に登録／認定を受けている者については、一万五千円」）は金額なし行として扱い、
  デーミング用の fee def は作らない（主たる九万円のみを def 化）。当該適用判定も
  caller-established とする。
* 百十 以前・百二十 以降は NOT YET COVERED（百十七の二・百十九の二・百十九の三は
  本担当範囲に含む）。「認定件数」「登録件数」「許可件数」「申請件数」の意味上の区別は
  非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百十一 電気用品安全法第九条第一項（検査機関の登録）の特定電気用品に係る検査機関の登録
    （更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def specifiedElectricalApplianceInspectOrgRegFee : Money := 90_000

/-- 百十二 消費生活用製品安全法第十二条第一項（検査機関の登録）の特別特定製品に係る検査機関の登録
    （更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def specialSpecificProductInspectOrgRegFee : Money := 90_000

/-- 百十三（一） 産業標準化法第三十条第一項若しくは第二項・第三十一条第一項・第三十二条第一項から
    第三項まで・第三十三条第一項又は第三十七条第一項から第六項まで（登録認証機関の登録）の
    登録（更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に（一）に掲げる登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def jisConformityCertificationBodyRegFee : Money := 90_000

/-- 百十三（二） 産業標準化法第五十七条第一項（試験事業者の試験所の登録）の国内にある試験所に
    おける製品試験等に係る事業者の登録（更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に（二）に掲げる登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def domesticTestLabBusinessOperatorRegFee : Money := 90_000

/-- 百十三（三） 産業標準化法第六十六条第一項（外国試験事業者の試験所の登録）の外国にある試験所に
    おける製品試験等に係る試験事業者の登録（更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に（三）に掲げる登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def foreignTestLabBusinessOperatorRegFee : Money := 90_000

/-- 百十四（一） 計量法第百四十三条第一項（登録）の計量器の校正等に係る事業者の登録
    （更新の登録を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に（一）に掲げる登録を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def measuringInstrumentCalibrationBizRegFee : Money := 90_000

/-- 百十四（二） 計量法第百二十一条の二（認定）の認定特定計量証明事業者の認定
    （更新の認定を除く。）の認定件数一件につきの額（固定 ¥90,000）。 -/
def certifiedMetrologyCertificationBizLicenseFee : Money := 90_000

/-- 百十五 半導体集積回路の回路配置に関する法律第二十八条第一項（登録機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。 -/
def circuitLayoutRightRegOrgRegFee : Money := 90_000

/-- 百十六（一） 工業所有権に関する手続等の特例に関する法律第九条第一項（登録情報処理機関の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。 -/
def registeredInfoProcessingOrgRegFee : Money := 90_000

/-- 百十六（二） 工業所有権に関する手続等の特例に関する法律第三十六条第一項（登録調査機関の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。 -/
def registeredInvestigationOrgRegFee : Money := 90_000

/-- 百十六（三） 工業所有権に関する手続等の特例に関する法律第三十九条の二（特定登録調査機関の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。 -/
def specifiedRegisteredInvestigationOrgRegFee : Money := 90_000

/-- 百十七 特定機器に係る適合性評価手続の結果の外国との相互承認の実施に関する法律第三条第一項
    （認定）の国外適合性評価事業の認定（更新の認定を除く。）の申請件数一件につきの額（固定 ¥90,000）。
    既に認定を受けている者については一万五千円（デーミング、caller-established、別 def なし）。 -/
def foreignConformityAssessmentBizLicenseFee : Money := 90_000

/-- 百十七の二 経済連携協定に基づく特定原産地証明書の発給等に関する法律第七条の二第一項
    （認定）の認定輸出者の認定（更新の認定を除く。）の認定件数一件につきの額（固定 ¥90,000）。 -/
def certifiedExporterLicenseFee : Money := 90_000

/-- 百十八（一） 割賦販売法第十一条（前払式割賦販売業の許可）の規定による前払式割賦販売の事業の
    許可の許可件数一件につきの額（固定 ¥150,000）。 -/
def prepaidInstallmentSalesBizPermitFee : Money := 150_000

/-- 百十八（二） 割賦販売法第三十一条（包括信用購入あつせん業者の登録）の登録
    （包括信用購入あつせん業者の登録）の登録件数一件につきの額（固定 ¥150,000）。 -/
def comprehensiveCreditPurchaseAgencyRegFee : Money := 150_000

/-- 百十八（三） 割賦販売法第三十五条の二の三第一項（登録）の登録
    （少額包括信用購入あつせん業者の登録）の登録件数一件につきの額（固定 ¥150,000）。 -/
def smallComprehensiveCreditPurchaseAgencyRegFee : Money := 150_000

/-- 百十八（四） 割賦販売法第三十五条の三の二十三（個別信用購入あつせん業者の登録）の登録
    （個別信用購入あつせん業者の登録、更新の登録を除く。）の登録件数一件につきの額（固定 ¥150,000）。 -/
def individualCreditPurchaseAgencyRegFee : Money := 150_000

/-- 百十八（五） 割賦販売法第三十五条の三の六十一（前払式特定取引業の許可）の規定による
    前払式特定取引の事業の許可の許可件数一件につきの額（固定 ¥150,000）。 -/
def prepaidSpecificTransactionBizPermitFee : Money := 150_000

/-- 百十八（六） 割賦販売法第三十五条の十七の二（クレジットカード番号等取扱契約締結事業者の登録）の
    登録（同事業者の登録）の登録件数一件につきの額（固定 ¥150,000）。 -/
def creditCardNumberHandlingContractBizRegFee : Money := 150_000

/-- 百十八（七） 割賦販売法第三十五条の十八第一項（認定割賦販売協会の認定及び業務）の
    認定割賦販売協会の認定の認定件数一件につきの額（固定 ¥150,000）。 -/
def certifiedInstallmentSalesAssociationLicenseFee : Money := 150_000

/-- 百十九（一） フロン類の使用の合理化及び管理の適正化に関する法律第五十条第一項
    （第一種フロン類再生業者の許可）の第一種フロン類再生業者の許可（更新の許可を除く。）の
    許可件数一件につきの額（固定 ¥90,000）。 -/
def class1FluorocarbonRecyclingBizPermitFee : Money := 90_000

/-- 百十九（二） フロン類の使用の合理化及び管理の適正化に関する法律第六十三条第一項
    （フロン類破壊業者の許可）のフロン類破壊業者の許可（更新の許可を除く。）の
    許可件数一件につきの額（固定 ¥90,000）。 -/
def fluorocarbonDestructionBizPermitFee : Money := 90_000

/-- 百十九の二 産業競争力強化法第六十八条第一項（認定技術等情報漏えい防止措置認証機関の認定）の
    認定（更新の認定を除く。）の認定件数一件につきの額（固定 ¥15,000）。 -/
def techInfoLeakPreventionCertOrgLicenseFee : Money := 15_000

/-- 百十九の三 脱炭素成長型経済構造への円滑な移行の推進に関する法律第三十三条第二項
    （登録確認機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。 -/
def registeredVerificationOrgRegFee : Money := 90_000

theorem specifiedElectricalApplianceInspectOrgRegFee_pos :
    specifiedElectricalApplianceInspectOrgRegFee > 0 := by decide
theorem specialSpecificProductInspectOrgRegFee_pos :
    specialSpecificProductInspectOrgRegFee > 0 := by decide
theorem jisConformityCertificationBodyRegFee_pos :
    jisConformityCertificationBodyRegFee > 0 := by decide
theorem domesticTestLabBusinessOperatorRegFee_pos :
    domesticTestLabBusinessOperatorRegFee > 0 := by decide
theorem foreignTestLabBusinessOperatorRegFee_pos :
    foreignTestLabBusinessOperatorRegFee > 0 := by decide
theorem measuringInstrumentCalibrationBizRegFee_pos :
    measuringInstrumentCalibrationBizRegFee > 0 := by decide
theorem certifiedMetrologyCertificationBizLicenseFee_pos :
    certifiedMetrologyCertificationBizLicenseFee > 0 := by decide
theorem circuitLayoutRightRegOrgRegFee_pos :
    circuitLayoutRightRegOrgRegFee > 0 := by decide
theorem registeredInfoProcessingOrgRegFee_pos :
    registeredInfoProcessingOrgRegFee > 0 := by decide
theorem registeredInvestigationOrgRegFee_pos :
    registeredInvestigationOrgRegFee > 0 := by decide
theorem specifiedRegisteredInvestigationOrgRegFee_pos :
    specifiedRegisteredInvestigationOrgRegFee > 0 := by decide
theorem foreignConformityAssessmentBizLicenseFee_pos :
    foreignConformityAssessmentBizLicenseFee > 0 := by decide
theorem certifiedExporterLicenseFee_pos :
    certifiedExporterLicenseFee > 0 := by decide
theorem prepaidInstallmentSalesBizPermitFee_pos :
    prepaidInstallmentSalesBizPermitFee > 0 := by decide
theorem comprehensiveCreditPurchaseAgencyRegFee_pos :
    comprehensiveCreditPurchaseAgencyRegFee > 0 := by decide
theorem smallComprehensiveCreditPurchaseAgencyRegFee_pos :
    smallComprehensiveCreditPurchaseAgencyRegFee > 0 := by decide
theorem individualCreditPurchaseAgencyRegFee_pos :
    individualCreditPurchaseAgencyRegFee > 0 := by decide
theorem prepaidSpecificTransactionBizPermitFee_pos :
    prepaidSpecificTransactionBizPermitFee > 0 := by decide
theorem creditCardNumberHandlingContractBizRegFee_pos :
    creditCardNumberHandlingContractBizRegFee > 0 := by decide
theorem certifiedInstallmentSalesAssociationLicenseFee_pos :
    certifiedInstallmentSalesAssociationLicenseFee > 0 := by decide
theorem class1FluorocarbonRecyclingBizPermitFee_pos :
    class1FluorocarbonRecyclingBizPermitFee > 0 := by decide
theorem fluorocarbonDestructionBizPermitFee_pos :
    fluorocarbonDestructionBizPermitFee > 0 := by decide
theorem techInfoLeakPreventionCertOrgLicenseFee_pos :
    techInfoLeakPreventionCertOrgLicenseFee > 0 := by decide
theorem registeredVerificationOrgRegFee_pos :
    registeredVerificationOrgRegFee > 0 := by decide

example : specifiedElectricalApplianceInspectOrgRegFee = 90_000 := by decide
example : specialSpecificProductInspectOrgRegFee = 90_000 := by decide
example : jisConformityCertificationBodyRegFee = 90_000 := by decide
example : domesticTestLabBusinessOperatorRegFee = 90_000 := by decide
example : foreignTestLabBusinessOperatorRegFee = 90_000 := by decide
example : measuringInstrumentCalibrationBizRegFee = 90_000 := by decide
example : certifiedMetrologyCertificationBizLicenseFee = 90_000 := by decide
example : circuitLayoutRightRegOrgRegFee = 90_000 := by decide
example : registeredInfoProcessingOrgRegFee = 90_000 := by decide
example : registeredInvestigationOrgRegFee = 90_000 := by decide
example : specifiedRegisteredInvestigationOrgRegFee = 90_000 := by decide
example : foreignConformityAssessmentBizLicenseFee = 90_000 := by decide
example : certifiedExporterLicenseFee = 90_000 := by decide
example : prepaidInstallmentSalesBizPermitFee = 150_000 := by decide
example : comprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : smallComprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : individualCreditPurchaseAgencyRegFee = 150_000 := by decide
example : prepaidSpecificTransactionBizPermitFee = 150_000 := by decide
example : creditCardNumberHandlingContractBizRegFee = 150_000 := by decide
example : certifiedInstallmentSalesAssociationLicenseFee = 150_000 := by decide
example : class1FluorocarbonRecyclingBizPermitFee = 90_000 := by decide
example : fluorocarbonDestructionBizPermitFee = 90_000 := by decide
example : techInfoLeakPreventionCertOrgLicenseFee = 15_000 := by decide
example : registeredVerificationOrgRegFee = 90_000 := by decide

end JapanTaxLaw
