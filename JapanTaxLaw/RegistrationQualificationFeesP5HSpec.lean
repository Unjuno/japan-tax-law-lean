import JapanTaxLaw.RegistrationQualificationFeesP5H

/-!
# RegistrationQualificationFeesP5HSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百十一〜百十九

Sources (pinned; identical to RegistrationQualificationFeesP5H.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百十一〜百十九 の flat 額 from the statutory text itself.
全 24 件が一件につきの固定額（割合なし）。7 箇所のデーミング規定
（既に登録／認定を受けている者については一万五千円）は金額なし行として扱い spec def を作らない
（主額の九万円のみ）。

Scope boundaries identical to the implementation（百十 以前・百二十 以降は NOT YET COVERED;
「更新の登録／認定／許可を除く。」等の適用判定は caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百十一 特定電気用品に係る検査機関の登録。 -/
def specSpecifiedElectricalApplianceInspectOrgRegFee : Money := 90_000
/-- Spec: 百十二 特別特定製品に係る検査機関の登録。 -/
def specSpecialSpecificProductInspectOrgRegFee : Money := 90_000
/-- Spec: 百十三（一） 登録認証機関の登録（日本産業規格への適合表示）。 -/
def specJisConformityCertificationBodyRegFee : Money := 90_000
/-- Spec: 百十三（二） 国内試験所の製品試験等に係る事業者の登録。 -/
def specDomesticTestLabBusinessOperatorRegFee : Money := 90_000
/-- Spec: 百十三（三） 外国試験所の製品試験等に係る試験事業者の登録。 -/
def specForeignTestLabBusinessOperatorRegFee : Money := 90_000
/-- Spec: 百十四（一） 計量器の校正等に係る事業者の登録。 -/
def specMeasuringInstrumentCalibrationBizRegFee : Money := 90_000
/-- Spec: 百十四（二） 認定特定計量証明事業者の認定。 -/
def specCertifiedMetrologyCertificationBizLicenseFee : Money := 90_000
/-- Spec: 百十五 回路配置利用権の設定登録等事務に係る登録機関の登録。 -/
def specCircuitLayoutRightRegOrgRegFee : Money := 90_000
/-- Spec: 百十六（一） 登録情報処理機関の登録。 -/
def specRegisteredInfoProcessingOrgRegFee : Money := 90_000
/-- Spec: 百十六（二） 登録調査機関の登録。 -/
def specRegisteredInvestigationOrgRegFee : Money := 90_000
/-- Spec: 百十六（三） 特定登録調査機関の登録。 -/
def specSpecifiedRegisteredInvestigationOrgRegFee : Money := 90_000
/-- Spec: 百十七 国外適合性評価事業の認定。 -/
def specForeignConformityAssessmentBizLicenseFee : Money := 90_000
/-- Spec: 百十七の二 認定輸出者の認定（第二種特定原産地証明書）。 -/
def specCertifiedExporterLicenseFee : Money := 90_000
/-- Spec: 百十八（一） 前払式割賦販売業の許可。 -/
def specPrepaidInstallmentSalesBizPermitFee : Money := 150_000
/-- Spec: 百十八（二） 包括信用購入あつせん業者の登録。 -/
def specComprehensiveCreditPurchaseAgencyRegFee : Money := 150_000
/-- Spec: 百十八（三） 少額包括信用購入あつせん業者の登録。 -/
def specSmallComprehensiveCreditPurchaseAgencyRegFee : Money := 150_000
/-- Spec: 百十八（四） 個別信用購入あつせん業者の登録。 -/
def specIndividualCreditPurchaseAgencyRegFee : Money := 150_000
/-- Spec: 百十八（五） 前払式特定取引業の許可。 -/
def specPrepaidSpecificTransactionBizPermitFee : Money := 150_000
/-- Spec: 百十八（六） クレジットカード番号等取扱契約締結事業者の登録。 -/
def specCreditCardNumberHandlingContractBizRegFee : Money := 150_000
/-- Spec: 百十八（七） 認定割賦販売協会の認定。 -/
def specCertifiedInstallmentSalesAssociationLicenseFee : Money := 150_000
/-- Spec: 百十九（一） 第一種フロン類再生業者の許可。 -/
def specClass1FluorocarbonRecyclingBizPermitFee : Money := 90_000
/-- Spec: 百十九（二） フロン類破壊業者の許可。 -/
def specFluorocarbonDestructionBizPermitFee : Money := 90_000
/-- Spec: 百十九の二 認定技術等情報漏えい防止措置認証機関の認定。 -/
def specTechInfoLeakPreventionCertOrgLicenseFee : Money := 15_000
/-- Spec: 百十九の三 排出目標量及び排出実績量に係る登録確認機関の登録。 -/
def specRegisteredVerificationOrgRegFee : Money := 90_000

example : specSpecifiedElectricalApplianceInspectOrgRegFee = 90_000 := by decide
example : specSpecialSpecificProductInspectOrgRegFee = 90_000 := by decide
example : specJisConformityCertificationBodyRegFee = 90_000 := by decide
example : specDomesticTestLabBusinessOperatorRegFee = 90_000 := by decide
example : specForeignTestLabBusinessOperatorRegFee = 90_000 := by decide
example : specMeasuringInstrumentCalibrationBizRegFee = 90_000 := by decide
example : specCertifiedMetrologyCertificationBizLicenseFee = 90_000 := by decide
example : specCircuitLayoutRightRegOrgRegFee = 90_000 := by decide
example : specRegisteredInfoProcessingOrgRegFee = 90_000 := by decide
example : specRegisteredInvestigationOrgRegFee = 90_000 := by decide
example : specSpecifiedRegisteredInvestigationOrgRegFee = 90_000 := by decide
example : specForeignConformityAssessmentBizLicenseFee = 90_000 := by decide
example : specCertifiedExporterLicenseFee = 90_000 := by decide
example : specPrepaidInstallmentSalesBizPermitFee = 150_000 := by decide
example : specComprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : specSmallComprehensiveCreditPurchaseAgencyRegFee = 150_000 := by decide
example : specIndividualCreditPurchaseAgencyRegFee = 150_000 := by decide
example : specPrepaidSpecificTransactionBizPermitFee = 150_000 := by decide
example : specCreditCardNumberHandlingContractBizRegFee = 150_000 := by decide
example : specCertifiedInstallmentSalesAssociationLicenseFee = 150_000 := by decide
example : specClass1FluorocarbonRecyclingBizPermitFee = 90_000 := by decide
example : specFluorocarbonDestructionBizPermitFee = 90_000 := by decide
example : specTechInfoLeakPreventionCertOrgLicenseFee = 15_000 := by decide
example : specRegisteredVerificationOrgRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP5H : Bool :=
  specSpecifiedElectricalApplianceInspectOrgRegFee == specifiedElectricalApplianceInspectOrgRegFee &&
  specSpecialSpecificProductInspectOrgRegFee == specialSpecificProductInspectOrgRegFee &&
  specJisConformityCertificationBodyRegFee == jisConformityCertificationBodyRegFee &&
  specDomesticTestLabBusinessOperatorRegFee == domesticTestLabBusinessOperatorRegFee &&
  specForeignTestLabBusinessOperatorRegFee == foreignTestLabBusinessOperatorRegFee &&
  specMeasuringInstrumentCalibrationBizRegFee == measuringInstrumentCalibrationBizRegFee &&
  specCertifiedMetrologyCertificationBizLicenseFee == certifiedMetrologyCertificationBizLicenseFee &&
  specCircuitLayoutRightRegOrgRegFee == circuitLayoutRightRegOrgRegFee &&
  specRegisteredInfoProcessingOrgRegFee == registeredInfoProcessingOrgRegFee &&
  specRegisteredInvestigationOrgRegFee == registeredInvestigationOrgRegFee &&
  specSpecifiedRegisteredInvestigationOrgRegFee == specifiedRegisteredInvestigationOrgRegFee &&
  specForeignConformityAssessmentBizLicenseFee == foreignConformityAssessmentBizLicenseFee &&
  specCertifiedExporterLicenseFee == certifiedExporterLicenseFee &&
  specPrepaidInstallmentSalesBizPermitFee == prepaidInstallmentSalesBizPermitFee &&
  specComprehensiveCreditPurchaseAgencyRegFee == comprehensiveCreditPurchaseAgencyRegFee &&
  specSmallComprehensiveCreditPurchaseAgencyRegFee == smallComprehensiveCreditPurchaseAgencyRegFee &&
  specIndividualCreditPurchaseAgencyRegFee == individualCreditPurchaseAgencyRegFee &&
  specPrepaidSpecificTransactionBizPermitFee == prepaidSpecificTransactionBizPermitFee &&
  specCreditCardNumberHandlingContractBizRegFee == creditCardNumberHandlingContractBizRegFee &&
  specCertifiedInstallmentSalesAssociationLicenseFee == certifiedInstallmentSalesAssociationLicenseFee &&
  specClass1FluorocarbonRecyclingBizPermitFee == class1FluorocarbonRecyclingBizPermitFee &&
  specFluorocarbonDestructionBizPermitFee == fluorocarbonDestructionBizPermitFee &&
  specTechInfoLeakPreventionCertOrgLicenseFee == techInfoLeakPreventionCertOrgLicenseFee &&
  specRegisteredVerificationOrgRegFee == registeredVerificationOrgRegFee

example : agreeRegistrationQualificationFeesP5H = true := by decide

end JapanTaxLaw
