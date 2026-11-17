import JapanTaxLaw.RegistryQualificationFeesJ2

/-!
# RegistryQualificationFeesJ2 tests — 別表第一（二）三十九〜四十九 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/


namespace JapanTaxLaw.RegistryQualificationFeesJ2

open JapanTaxLaw.TaxFinance

-- 三十九 担保付社債に関する信託事業の免許
example : securedBondTrustBizLicenseFee = 150_000 := by decide
-- 三十九の二 企業価値担保権に関する信託業務の免許
example : enterpriseValueSecurityTrustBizLicenseFee = 150_000 := by decide

-- 四十(一) 金融商品市場の開設の免許
example : financialProductMarketOpeningLicenseFee = 150_000 := by decide
-- 四十(二) 国際協力排出削減量に係る取引を行う市場の開設等の認可
example : internationalCooperationEmissionReductionMarketApprovalFee = 150_000 := by decide
-- 四十(三) 組織変更の認可
example : financialExchangeOrgReorganizationApprovalFee = 150_000 := by decide
-- 四十(四) 店頭売買有価証券市場の開設の認可
example : otcSecuritiesMarketOpeningApprovalFee = 150_000 := by decide
-- 四十(五) 外国市場取引の認可
example : foreignMarketTransactionApprovalFee = 150_000 := by decide
-- 四十(六) 金融商品取引所持株会社に係る認可
example : financialExchangeHoldingCompanyApprovalFee = 150_000 := by decide
-- 四十(七) 認定金融商品取引業協会の認定
example : certifiedFinancialInstrumentsFirmAssociationCertFee = 150_000 := by decide
-- 四十(八) 認定投資者保護団体の認定
example : certifiedInvestorProtectionOrgCertFee = 90_000 := by decide
-- 四十(九) 自主規制業務の認可
example : selfRegulatoryBusinessApprovalFee = 150_000 := by decide

-- 四十一(一) 金融商品取引業者の登録
example : financialInstrumentsBusinessRegistrationFee = 150_000 := by decide
-- 四十一(二) 変更登録（第三十一条第四項）
example : financialInstrumentsBusinessChangeRegistrationFee = 150_000 := by decide
-- 四十一(三) 業務の認可
example : financialInstrumentsBusinessApprovalFee = 150_000 := by decide
-- 四十一(四) 引受業務の許可
example : foreignSecuritiesUnderwritingPermissionFee = 90_000 := by decide
-- 四十一(五) 取引所取引業務の許可
example : exchangeTransactionBusinessPermissionFee = 150_000 := by decide
-- 四十一(六) 電子店頭デリバティブ取引等業務の許可
example : electronicOtcDerivativeBusinessPermissionFee = 150_000 := by decide
-- 四十一(七) 金融商品仲介業者の登録
example : financialInstrumentsIntermediaryRegistrationFee = 90_000 := by decide
-- 四十一(八) 信用格付業者の登録
example : creditRatingAgencyRegistrationFee = 90_000 := by decide
-- 四十一(九) 投資運用関係業務受託業者の登録
example : investmentManagementRelatedBusinessTrusteeRegistrationFee = 90_000 := by decide
-- 四十一(十) 変更登録（第六十六条の七十五第四項）
example : financialInstrumentsBusinessChangeRegistrationArticle66_75Fee = 90_000 := by decide
-- 四十一(十一) 金融商品取引清算機関の金融商品債務引受業の免許
example : financialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
-- 四十一(十二) 外国金融商品取引清算機関の金融商品債務引受業の免許
example : foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
-- 四十一(十三) 連携金融商品債務引受業務の認可
example : linkedFinancialInstrumentDebtAssumptionApprovalFee = 150_000 := by decide

-- 四十二及び四十三 削除（fee def なし）
-- 四十四 証券金融会社の免許
example : securitiesFinanceCompanyLicenseFee = 150_000 := by decide
-- 四十五 特定金融会社等の登録
example : specifiedFinancialCompanyRegistrationFee = 150_000 := by decide

-- 四十六(一) 貸金業者の登録
example : moneyLenderRegistrationFee = 150_000 := by decide
-- 四十六(二) 登録講習機関の登録
example : moneyLendingBusinessManagerTrainingInstitutionRegistrationFee = 90_000 := by decide

-- 四十七(一) 無尽業の免許
example : mutualFinancingBusinessLicenseFee = 150_000 := by decide
-- 四十七(二) 無尽会社の出張所又は代理店の設置の認可（一箇所あたり）
example : mutualFinancingCompanyBranchOfficeApprovalFee = 90_000 := by decide

-- 四十八(一) 金融サービス仲介業者の登録
example : financialServicesIntermediaryRegistrationFee = 90_000 := by decide
-- 四十八(二) 変更登録（第十六条第一項）
example : financialServicesIntermediaryChangeRegistrationFee = 90_000 := by decide
-- 四十八(三) 認定金融サービス仲介業協会の認定
example : certifiedFinancialServicesIntermediaryAssociationCertFee = 150_000 := by decide

-- 四十九(一) 第三者型前払式支払手段の発行者の登録
example : thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee = 150_000 := by decide
-- 四十九(二) 資金移動業者の登録
example : fundsTransferServiceProviderRegistrationFee = 150_000 := by decide
-- 四十九(三) 変更登録（第四十一条第一項）
example : fundsTransferServiceProviderChangeRegistrationFee = 150_000 := by decide
-- 四十九(四) 電子決済手段等取引業者の登録
example : electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee = 150_000 := by decide
-- 四十九(五) 変更登録（第六十二条の七第一項）
example : electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee = 150_000 := by decide
-- 四十九(六) 暗号資産交換業者の登録
example : cryptoAssetExchangeBusinessRegistrationFee = 150_000 := by decide
-- 四十九(七) 電子決済手段・暗号資産サービス仲介業者の登録
example : electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee = 90_000 := by decide
-- 四十九(八) 変更登録（第六十三条の二十二の六第一項）
example : electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee = 90_000 := by decide
-- 四十九(九) 為替取引分析業者の許可
example : foreignExchangeAnalysisBusinessPermissionFee = 150_000 := by decide
-- 四十九(十) 変更の許可（第六十三条の三十三第一項）
example : businessCategoryChangePermissionFee = 150_000 := by decide
-- 四十九(十一) 資金清算業の免許
example : fundsClearingBusinessLicenseFee = 150_000 := by decide
-- 四十九(十二) 認定資金決済事業者協会の認定
example : certifiedFundsSettlementBusinessAssociationCertFee = 150_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ2
