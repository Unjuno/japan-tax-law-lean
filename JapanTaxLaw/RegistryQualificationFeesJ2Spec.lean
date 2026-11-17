import JapanTaxLaw.RegistryQualificationFeesJ2

/-!
# RegistryQualificationFeesJ2Spec spec — independent restatement of
       登録免許税法 別表第一（二）三十九〜四十九（担保付社債信託事業・各種金融業登録等）

Sources (pinned; identical to RegistryQualificationFeesJ2.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 三十九〜四十九 の flat 額 from the statutory text itself.
全 45 件が一件（一箇所）につきの固定額（割合なし、デーミング規定・金額なし行なし、
四十二及び四十三は削除で fee 行なし）。scope boundaries identical to the implementation
（三十八 以前・五十 以降は NOT YET COVERED;「更新の登録を除く」「…に限る」「…を除く」
等の適用判定はすべて caller-established、`agree` は有限点の `==` 一致確認にすぎない）。
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ2

open JapanTaxLaw.TaxFinance

/-! === 三十九・三十九の二 === -/
/-- Spec: 三十九 担保付社債に関する信託事業の免許。 -/
def specSecuredBondTrustBizLicenseFee : Money := 150_000
/-- Spec: 三十九の二 企業価値担保権に関する信託業務の免許。 -/
def specEnterpriseValueSecurityTrustBizLicenseFee : Money := 150_000

/-! === 四十（9 件） === -/
/-- Spec: 四十(一) 金融商品市場の開設の免許。 -/
def specFinancialProductMarketOpeningLicenseFee : Money := 150_000
/-- Spec: 四十(二) 国際協力排出削減量に係る取引を行う市場の開設等の認可。 -/
def specInternationalCooperationEmissionReductionMarketApprovalFee : Money := 150_000
/-- Spec: 四十(三) 組織変更の認可。 -/
def specFinancialExchangeOrgReorganizationApprovalFee : Money := 150_000
/-- Spec: 四十(四) 店頭売買有価証券市場の開設の認可。 -/
def specOtcSecuritiesMarketOpeningApprovalFee : Money := 150_000
/-- Spec: 四十(五) 外国市場取引の認可。 -/
def specForeignMarketTransactionApprovalFee : Money := 150_000
/-- Spec: 四十(六) 金融商品取引所持株会社に係る認可。 -/
def specFinancialExchangeHoldingCompanyApprovalFee : Money := 150_000
/-- Spec: 四十(七) 認定金融商品取引業協会の認定。 -/
def specCertifiedFinancialInstrumentsFirmAssociationCertFee : Money := 150_000
/-- Spec: 四十(八) 認定投資者保護団体の認定。 -/
def specCertifiedInvestorProtectionOrgCertFee : Money := 90_000
/-- Spec: 四十(九) 自主規制業務の認可。 -/
def specSelfRegulatoryBusinessApprovalFee : Money := 150_000

/-! === 四十一（13 件） === -/
/-- Spec: 四十一(一) 金融商品取引業者の登録。 -/
def specFinancialInstrumentsBusinessRegistrationFee : Money := 150_000
/-- Spec: 四十一(二) 変更登録（第三十一条第四項）。 -/
def specFinancialInstrumentsBusinessChangeRegistrationFee : Money := 150_000
/-- Spec: 四十一(三) 業務の認可。 -/
def specFinancialInstrumentsBusinessApprovalFee : Money := 150_000
/-- Spec: 四十一(四) 引受業務の許可。 -/
def specForeignSecuritiesUnderwritingPermissionFee : Money := 90_000
/-- Spec: 四十一(五) 取引所取引業務の許可。 -/
def specExchangeTransactionBusinessPermissionFee : Money := 150_000
/-- Spec: 四十一(六) 電子店頭デリバティブ取引等業務の許可。 -/
def specElectronicOtcDerivativeBusinessPermissionFee : Money := 150_000
/-- Spec: 四十一(七) 金融商品仲介業者の登録。 -/
def specFinancialInstrumentsIntermediaryRegistrationFee : Money := 90_000
/-- Spec: 四十一(八) 信用格付業者の登録。 -/
def specCreditRatingAgencyRegistrationFee : Money := 90_000
/-- Spec: 四十一(九) 投資運用関係業務受託業者の登録。 -/
def specInvestmentManagementRelatedBusinessTrusteeRegistrationFee : Money := 90_000
/-- Spec: 四十一(十) 変更登録（第六十六条の七十五第四項）。 -/
def specFinancialInstrumentsBusinessChangeRegistrationArticle66_75Fee : Money := 90_000
/-- Spec: 四十一(十一) 金融商品取引清算機関の金融商品債務引受業の免許。 -/
def specFinancialInstrumentClearingCorpDebtAssumptionLicenseFee : Money := 150_000
/-- Spec: 四十一(十二) 外国金融商品取引清算機関の金融商品債務引受業の免許。 -/
def specForeignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee : Money := 150_000
/-- Spec: 四十一(十三) 連携金融商品債務引受業務の認可。 -/
def specLinkedFinancialInstrumentDebtAssumptionApprovalFee : Money := 150_000

/-! === 四十四・四十五 === -/
-- 四十二及び四十三　削除（fee 行なし、Spec にも対応定数を置かない）。
/-- Spec: 四十四 証券金融会社の免許。 -/
def specSecuritiesFinanceCompanyLicenseFee : Money := 150_000
/-- Spec: 四十五 特定金融会社等の登録。 -/
def specSpecifiedFinancialCompanyRegistrationFee : Money := 150_000

/-! === 四十六（2 件） === -/
/-- Spec: 四十六(一) 貸金業者の登録（更新の登録を除く。）。 -/
def specMoneyLenderRegistrationFee : Money := 150_000
/-- Spec: 四十六(二) 貸金業務取扱主任者に係る登録講習機関の登録（更新の登録を除く。）。 -/
def specMoneyLendingBusinessManagerTrainingInstitutionRegistrationFee : Money := 90_000

/-! === 四十七（2 件） === -/
/-- Spec: 四十七(一) 無尽業の免許。 -/
def specMutualFinancingBusinessLicenseFee : Money := 150_000
/-- Spec: 四十七(二) 無尽会社の出張所又は代理店の設置の認可（一箇所あたり）。 -/
def specMutualFinancingCompanyBranchOfficeApprovalFee : Money := 90_000

/-! === 四十八（3 件） === -/
/-- Spec: 四十八(一) 金融サービス仲介業者の登録。 -/
def specFinancialServicesIntermediaryRegistrationFee : Money := 90_000
/-- Spec: 四十八(二) 変更登録（第十六条第一項）。 -/
def specFinancialServicesIntermediaryChangeRegistrationFee : Money := 90_000
/-- Spec: 四十八(三) 認定金融サービス仲介業協会の認定。 -/
def specCertifiedFinancialServicesIntermediaryAssociationCertFee : Money := 150_000

/-! === 四十九（12 件） === -/
/-- Spec: 四十九(一) 第三者型前払式支払手段の発行者の登録。 -/
def specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee : Money := 150_000
/-- Spec: 四十九(二) 資金移動業者の登録。 -/
def specFundsTransferServiceProviderRegistrationFee : Money := 150_000
/-- Spec: 四十九(三) 変更登録（第四十一条第一項）。 -/
def specFundsTransferServiceProviderChangeRegistrationFee : Money := 150_000
/-- Spec: 四十九(四) 電子決済手段等取引業者の登録。 -/
def specElectronicPaymentInstrumentEtcTransactionBusinessRegistrationFee : Money := 150_000
/-- Spec: 四十九(五) 変更登録（第六十二条の七第一項）。 -/
def specElectronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee : Money := 150_000
/-- Spec: 四十九(六) 暗号資産交換業者の登録。 -/
def specCryptoAssetExchangeBusinessRegistrationFee : Money := 150_000
/-- Spec: 四十九(七) 電子決済手段・暗号資産サービス仲介業者の登録。 -/
def specElectronicPaymentCryptoAssetServiceIntermediaryRegistrationFee : Money := 90_000
/-- Spec: 四十九(八) 変更登録（第六十三条の二十二の六第一項）。 -/
def specElectronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee : Money := 90_000
/-- Spec: 四十九(九) 為替取引分析業者の許可。 -/
def specForeignExchangeAnalysisBusinessPermissionFee : Money := 150_000
/-- Spec: 四十九(十) 変更の許可（第六十三条の三十三第一項）。 -/
def specBusinessCategoryChangePermissionFee : Money := 150_000
/-- Spec: 四十九(十一) 資金清算業の免許。 -/
def specFundsClearingBusinessLicenseFee : Money := 150_000
/-- Spec: 四十九(十二) 認定資金決済事業者協会の認定。 -/
def specCertifiedFundsSettlementBusinessAssociationCertFee : Money := 150_000

/-! === Spec smoke（45 件、kernel-decide） === -/

example : specSecuredBondTrustBizLicenseFee = 150_000 := by decide
example : specEnterpriseValueSecurityTrustBizLicenseFee = 150_000 := by decide
example : specFinancialProductMarketOpeningLicenseFee = 150_000 := by decide
example : specInternationalCooperationEmissionReductionMarketApprovalFee = 150_000 := by decide
example : specFinancialExchangeOrgReorganizationApprovalFee = 150_000 := by decide
example : specOtcSecuritiesMarketOpeningApprovalFee = 150_000 := by decide
example : specForeignMarketTransactionApprovalFee = 150_000 := by decide
example : specFinancialExchangeHoldingCompanyApprovalFee = 150_000 := by decide
example : specCertifiedFinancialInstrumentsFirmAssociationCertFee = 150_000 := by decide
example : specCertifiedInvestorProtectionOrgCertFee = 90_000 := by decide
example : specSelfRegulatoryBusinessApprovalFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessRegistrationFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessChangeRegistrationFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessApprovalFee = 150_000 := by decide
example : specForeignSecuritiesUnderwritingPermissionFee = 90_000 := by decide
example : specExchangeTransactionBusinessPermissionFee = 150_000 := by decide
example : specElectronicOtcDerivativeBusinessPermissionFee = 150_000 := by decide
example : specFinancialInstrumentsIntermediaryRegistrationFee = 90_000 := by decide
example : specCreditRatingAgencyRegistrationFee = 90_000 := by decide
example : specInvestmentManagementRelatedBusinessTrusteeRegistrationFee = 90_000 := by decide
example : specFinancialInstrumentsBusinessChangeRegistrationArticle66_75Fee = 90_000 := by decide
example : specFinancialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
example : specForeignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
example : specLinkedFinancialInstrumentDebtAssumptionApprovalFee = 150_000 := by decide
example : specSecuritiesFinanceCompanyLicenseFee = 150_000 := by decide
example : specSpecifiedFinancialCompanyRegistrationFee = 150_000 := by decide
example : specMoneyLenderRegistrationFee = 150_000 := by decide
example : specMoneyLendingBusinessManagerTrainingInstitutionRegistrationFee = 90_000 := by decide
example : specMutualFinancingBusinessLicenseFee = 150_000 := by decide
example : specMutualFinancingCompanyBranchOfficeApprovalFee = 90_000 := by decide
example : specFinancialServicesIntermediaryRegistrationFee = 90_000 := by decide
example : specFinancialServicesIntermediaryChangeRegistrationFee = 90_000 := by decide
example : specCertifiedFinancialServicesIntermediaryAssociationCertFee = 150_000 := by decide
example : specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee = 150_000 := by decide
example : specFundsTransferServiceProviderRegistrationFee = 150_000 := by decide
example : specFundsTransferServiceProviderChangeRegistrationFee = 150_000 := by decide
example : specElectronicPaymentInstrumentEtcTransactionBusinessRegistrationFee = 150_000 := by decide
example : specElectronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee = 150_000 := by decide
example : specCryptoAssetExchangeBusinessRegistrationFee = 150_000 := by decide
example : specElectronicPaymentCryptoAssetServiceIntermediaryRegistrationFee = 90_000 := by decide
example : specElectronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee = 90_000 := by decide
example : specForeignExchangeAnalysisBusinessPermissionFee = 150_000 := by decide
example : specBusinessCategoryChangePermissionFee = 150_000 := by decide
example : specFundsClearingBusinessLicenseFee = 150_000 := by decide
example : specCertifiedFundsSettlementBusinessAssociationCertFee = 150_000 := by decide

/-! === agreement（impl ≡ spec、45 件の == 一致） === -/

def agreeRegistryQualificationFeesJ2 : Bool :=
  specSecuredBondTrustBizLicenseFee == securedBondTrustBizLicenseFee &&
  specEnterpriseValueSecurityTrustBizLicenseFee == enterpriseValueSecurityTrustBizLicenseFee &&
  specFinancialProductMarketOpeningLicenseFee == financialProductMarketOpeningLicenseFee &&
  specInternationalCooperationEmissionReductionMarketApprovalFee == internationalCooperationEmissionReductionMarketApprovalFee &&
  specFinancialExchangeOrgReorganizationApprovalFee == financialExchangeOrgReorganizationApprovalFee &&
  specOtcSecuritiesMarketOpeningApprovalFee == otcSecuritiesMarketOpeningApprovalFee &&
  specForeignMarketTransactionApprovalFee == foreignMarketTransactionApprovalFee &&
  specFinancialExchangeHoldingCompanyApprovalFee == financialExchangeHoldingCompanyApprovalFee &&
  specCertifiedFinancialInstrumentsFirmAssociationCertFee == certifiedFinancialInstrumentsFirmAssociationCertFee &&
  specCertifiedInvestorProtectionOrgCertFee == certifiedInvestorProtectionOrgCertFee &&
  specSelfRegulatoryBusinessApprovalFee == selfRegulatoryBusinessApprovalFee &&
  specFinancialInstrumentsBusinessRegistrationFee == financialInstrumentsBusinessRegistrationFee &&
  specFinancialInstrumentsBusinessChangeRegistrationFee == financialInstrumentsBusinessChangeRegistrationFee &&
  specFinancialInstrumentsBusinessApprovalFee == financialInstrumentsBusinessApprovalFee &&
  specForeignSecuritiesUnderwritingPermissionFee == foreignSecuritiesUnderwritingPermissionFee &&
  specExchangeTransactionBusinessPermissionFee == exchangeTransactionBusinessPermissionFee &&
  specElectronicOtcDerivativeBusinessPermissionFee == electronicOtcDerivativeBusinessPermissionFee &&
  specFinancialInstrumentsIntermediaryRegistrationFee == financialInstrumentsIntermediaryRegistrationFee &&
  specCreditRatingAgencyRegistrationFee == creditRatingAgencyRegistrationFee &&
  specInvestmentManagementRelatedBusinessTrusteeRegistrationFee == investmentManagementRelatedBusinessTrusteeRegistrationFee &&
  specFinancialInstrumentsBusinessChangeRegistrationArticle66_75Fee == financialInstrumentsBusinessChangeRegistrationArticle66_75Fee &&
  specFinancialInstrumentClearingCorpDebtAssumptionLicenseFee == financialInstrumentClearingCorpDebtAssumptionLicenseFee &&
  specForeignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee == foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee &&
  specLinkedFinancialInstrumentDebtAssumptionApprovalFee == linkedFinancialInstrumentDebtAssumptionApprovalFee &&
  specSecuritiesFinanceCompanyLicenseFee == securitiesFinanceCompanyLicenseFee &&
  specSpecifiedFinancialCompanyRegistrationFee == specifiedFinancialCompanyRegistrationFee &&
  specMoneyLenderRegistrationFee == moneyLenderRegistrationFee &&
  specMoneyLendingBusinessManagerTrainingInstitutionRegistrationFee == moneyLendingBusinessManagerTrainingInstitutionRegistrationFee &&
  specMutualFinancingBusinessLicenseFee == mutualFinancingBusinessLicenseFee &&
  specMutualFinancingCompanyBranchOfficeApprovalFee == mutualFinancingCompanyBranchOfficeApprovalFee &&
  specFinancialServicesIntermediaryRegistrationFee == financialServicesIntermediaryRegistrationFee &&
  specFinancialServicesIntermediaryChangeRegistrationFee == financialServicesIntermediaryChangeRegistrationFee &&
  specCertifiedFinancialServicesIntermediaryAssociationCertFee == certifiedFinancialServicesIntermediaryAssociationCertFee &&
  specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee == thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee &&
  specFundsTransferServiceProviderRegistrationFee == fundsTransferServiceProviderRegistrationFee &&
  specFundsTransferServiceProviderChangeRegistrationFee == fundsTransferServiceProviderChangeRegistrationFee &&
  specElectronicPaymentInstrumentEtcTransactionBusinessRegistrationFee == electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee &&
  specElectronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee == electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee &&
  specCryptoAssetExchangeBusinessRegistrationFee == cryptoAssetExchangeBusinessRegistrationFee &&
  specElectronicPaymentCryptoAssetServiceIntermediaryRegistrationFee == electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee &&
  specElectronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee == electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee &&
  specForeignExchangeAnalysisBusinessPermissionFee == foreignExchangeAnalysisBusinessPermissionFee &&
  specBusinessCategoryChangePermissionFee == businessCategoryChangePermissionFee &&
  specFundsClearingBusinessLicenseFee == fundsClearingBusinessLicenseFee &&
  specCertifiedFundsSettlementBusinessAssociationCertFee == certifiedFundsSettlementBusinessAssociationCertFee

example : agreeRegistryQualificationFeesJ2 = true := by decide

end JapanTaxLaw.RegistryQualificationFeesJ2
