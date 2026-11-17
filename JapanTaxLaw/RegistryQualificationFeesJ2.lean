import JapanTaxLaw.TaxFinance

/-!
# RegistryQualificationFeesJ2 — 登録免許税法 別表第一（二）三十九〜四十九（担保付社債信託事業・各種金融業登録等）の flat fee モデル (W-AC)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: reg_qual_B.txt（三十九〜四十九、UTF-8、3,665 文字）。

原文の各 fee string「（件数）一件につき△△円」を読み、定額 `Money` 定数としてモデル化する。
金額は日本語数字で検証して Arabic に変換。

  金額内訳: 十五万円 33 件（150,000）／ 九万円 12 件（90,000）＝ 45 件。
  「につき」は原文に 45 回、十五万円 33 回、九万円 12 回（いずれも本範囲内）。

Scope & honest boundaries:

* 一件（一箇所）につきの固定額であることを検証するのみ。免許・登録・認定・許可の
  要件・適用、および「免許件数」「登録件数」「認定件数」「許可件数」の意味上の区別は
  caller-established とし、ここではモデル化しない（一律 `Money` で扱う）。
* 適用判定 —「更新の登録を除く。」（四十六(一)(二)）、「業務の種別の増加に係るもの」
  「電子募集業務…を行うために受けるもの」（四十一(二)(十)）、
  「同項ただし書の商品先物取引…に共通する業務に係るものを除く。」（四十(二)）、
  「同法第十三条第一項第四号…業務の種別の増加に係るものに限る。」（四十八(二)）等 —
  は caller-established とし、Bool を金額式に入れない。
* 四十二及び四十三は「削除」であり fee string を持たない。fee def を作らず
  caller-established と明記する（下記コメント参照）。原文に金額なし fee 行・
  デーミング規定・軽減額（「既に…については」型）は存在しない
  （千分／百分／割合／みな／既に／政令 の出現はいずれも 0 回を確認）。
* 本範囲に割合型（千分のX）は存在しないため、`TaxRate` / `applyFloor` は導入しない
  （分母 10000 の 10 倍過大バグ警戒対象なし）。
* 三十八 以前・五十 以降は NOT YET COVERED。
* Pinned evidence is in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ2

open JapanTaxLaw.TaxFinance

/-! === 三十九・三十九の二 === -/

/-- 三十九 担保付社債に関する信託事業の免許。担保付社債信託法第三条（免許）の担保付社債に
    関する信託事業の免許、免許件数一件につき十五万円（固定 ¥150,000）。 -/
def securedBondTrustBizLicenseFee : Money := 150_000

/-- 三十九の二 企業価値担保権に関する信託業務の免許。事業性融資の推進等に関する法律
    （令和六年法律第五十二号）第三十二条（免許）の企業価値担保権に関する信託業務の免許、
    免許件数一件につき十五万円（固定 ¥150,000）。 -/
def enterpriseValueSecurityTrustBizLicenseFee : Money := 150_000

/-! === 四十 金融商品市場の開設の免許 等（9 件） === -/

/-- 四十(一) 金融商品取引法第八十条第一項（免許）の金融商品市場の開設の免許、
    免許件数一件につき十五万円（固定 ¥150,000）。 -/
def financialProductMarketOpeningLicenseFee : Money := 150_000

/-- 四十(二) 金融商品取引法第八十七条の二第一項ただし書の認可（同項ただし書の商品先物取引を
    するために必要な市場の開設の業務又は金融商品取引所グループ等に属する二以上の会社に共通する
    業務に係るものを除く。）、認可件数一件につき十五万円（固定 ¥150,000）。
    「…を除く。」の該当性は caller-established。 -/
def internationalCooperationEmissionReductionMarketApprovalFee : Money := 150_000

/-- 四十(三) 金融商品取引法第百一条の十七第一項（組織変更の認可）の組織変更の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def financialExchangeOrgReorganizationApprovalFee : Money := 150_000

/-- 四十(四) 金融商品取引法第六十七条の十二（規則の認可）の店頭売買有価証券市場の開設の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def otcSecuritiesMarketOpeningApprovalFee : Money := 150_000

/-- 四十(五) 金融商品取引法第百五十五条第一項（認可）の外国市場取引の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def foreignMarketTransactionApprovalFee : Money := 150_000

/-- 四十(六) 金融商品取引法第百六条の十第一項又は第三項ただし書（認可等）の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def financialExchangeHoldingCompanyApprovalFee : Money := 150_000

/-- 四十(七) 金融商品取引法第七十八条第一項の認定金融商品取引業協会の認定、
    認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedFinancialInstrumentsFirmAssociationCertFee : Money := 150_000

/-- 四十(八) 金融商品取引法第七十九条の七第一項の認定投資者保護団体の認定、
    認定件数一件につき九万円（固定 ¥90,000）。 -/
def certifiedInvestorProtectionOrgCertFee : Money := 90_000

/-- 四十(九) 金融商品取引法第百二条の十四の自主規制業務の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def selfRegulatoryBusinessApprovalFee : Money := 150_000

/-! === 四十一 金融商品取引業者の登録 等（13 件） === -/

/-- 四十一(一) 金融商品取引法第二十九条（登録）の金融商品取引業者の登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def financialInstrumentsBusinessRegistrationFee : Money := 150_000

/-- 四十一(二) 金融商品取引法第三十一条第四項（変更登録等）の変更登録（業務の種別の増加、
    電子募集業務等を行うために受けるものに限る。）、登録件数一件につき十五万円（固定 ¥150,000）。
    「…に限る。」の該当性は caller-established。 -/
def financialInstrumentsBusinessChangeRegistrationFee : Money := 150_000

/-- 四十一(三) 金融商品取引法第三十条第一項（認可）の業務の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def financialInstrumentsBusinessApprovalFee : Money := 150_000

/-- 四十一(四) 金融商品取引法第五十九条第一項（引受業務の一部の許可）の引受業務の許可、
    許可件数一件につき九万円（固定 ¥90,000）。 -/
def foreignSecuritiesUnderwritingPermissionFee : Money := 90_000

/-- 四十一(五) 金融商品取引法第六十条第一項（取引所取引業務の許可）の取引所取引業務の許可、
    許可件数一件につき十五万円（固定 ¥150,000）。 -/
def exchangeTransactionBusinessPermissionFee : Money := 150_000

/-- 四十一(六) 金融商品取引法第六十条の十四第一項の電子店頭デリバティブ取引等業務の許可、
    許可件数一件につき十五万円（固定 ¥150,000）。 -/
def electronicOtcDerivativeBusinessPermissionFee : Money := 150_000

/-- 四十一(七) 金融商品取引法第六十六条（登録）の金融商品仲介業者の登録、
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def financialInstrumentsIntermediaryRegistrationFee : Money := 90_000

/-- 四十一(八) 金融商品取引法第六十六条の二十七（登録）の信用格付業者の登録、
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def creditRatingAgencyRegistrationFee : Money := 90_000

/-- 四十一(九) 金融商品取引法第六十六条の七十一（登録）の投資運用関係業務受託業者の登録、
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def investmentManagementRelatedBusinessTrusteeRegistrationFee : Money := 90_000

/-- 四十一(十) 金融商品取引法第六十六条の七十五第四項（変更登録等）の変更登録（業務の種別の
    増加に係るものに限る。）、登録件数一件につき九万円（固定 ¥90,000）。
    「…に限る。」の該当性は caller-established。 -/
def financialInstrumentsBusinessChangeRegistrationArticle66_75Fee : Money := 90_000

/-- 四十一(十一) 金融商品取引法第百五十六条の二（免許）の金融商品取引清算機関の金融商品債務
    引受業の免許、免許件数一件につき十五万円（固定 ¥150,000）。 -/
def financialInstrumentClearingCorpDebtAssumptionLicenseFee : Money := 150_000

/-- 四十一(十二) 金融商品取引法第百五十六条の二十の二（免許）の外国金融商品取引清算機関の
    金融商品債務引受業の免許、免許件数一件につき十五万円（固定 ¥150,000）。 -/
def foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee : Money := 150_000

/-- 四十一(十三) 金融商品取引法第百五十六条の二十の十六第一項の連携金融商品債務引受業務の認可、
    認可件数一件につき十五万円（固定 ¥150,000）。 -/
def linkedFinancialInstrumentDebtAssumptionApprovalFee : Money := 150_000

/-! === 四十二及び四十三（削除）/ 四十四 / 四十五 === -/

-- 四十二及び四十三　削除。原文に fee string を持たないため fee def を作らない。
-- 当該区分への該当性（登録免許税の課税対象外であること）は caller-established。

/-- 四十四 証券金融会社の免許。金融商品取引法第百五十六条の二十四第一項
    （免許及び免許の申請）の証券金融会社の免許、免許件数一件につき十五万円（固定 ¥150,000）。 -/
def securitiesFinanceCompanyLicenseFee : Money := 150_000

/-- 四十五 特定金融会社等の登録。金融業者の貸付業務のための社債の発行等に関する法律
    （平成十一年法律第三十二号）第三条（登録）の特定金融会社等の登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def specifiedFinancialCompanyRegistrationFee : Money := 150_000

/-! === 四十六 貸金業者等（2 件） === -/

/-- 四十六(一) 貸金業法第三条第一項（登録）の内閣総理大臣がする貸金業者の登録
    （更新の登録を除く。）、登録件数一件につき十五万円（固定 ¥150,000）。
    「更新の登録を除く。」の該当性は caller-established。 -/
def moneyLenderRegistrationFee : Money := 150_000

/-- 四十六(二) 貸金業法第二十四条の二十五第二項（登録講習機関の登録）の登録
    （更新の登録を除く。）、登録件数一件につき九万円（固定 ¥90,000）。
    「更新の登録を除く。」の該当性は caller-established。 -/
def moneyLendingBusinessManagerTrainingInstitutionRegistrationFee : Money := 90_000

/-! === 四十七 無尽業（2 件） === -/

/-- 四十七(一) 無尽業法第二条第一項（免許）の無尽業の免許、
    免許件数一件につき十五万円（固定 ¥150,000）。 -/
def mutualFinancingBusinessLicenseFee : Money := 150_000

/-- 四十七(二) 無尽業法第七条第三号（認可）の無尽会社の出張所又は代理店の設置の認可、
    出張所又は代理店の数一箇所につき九万円（固定 ¥90,000）。 -/
def mutualFinancingCompanyBranchOfficeApprovalFee : Money := 90_000

/-! === 四十八 金融サービス仲介業者等（3 件） === -/

/-- 四十八(一) 金融サービスの提供及び利用環境の整備等に関する法律
    （平成十二年法律第百一号）第十二条（登録）の金融サービス仲介業者の登録、
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def financialServicesIntermediaryRegistrationFee : Money := 90_000

/-- 四十八(二) 同法第十六条第一項（変更登録等）の変更登録（業務の種別の増加に係るものに限る。）、
    登録件数一件につき九万円（固定 ¥90,000）。
    「…に限る。」の該当性は caller-established。 -/
def financialServicesIntermediaryChangeRegistrationFee : Money := 90_000

/-- 四十八(三) 同法第四十条（認定金融サービス仲介業協会の認定）の認定金融サービス仲介業協会の
    認定、認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedFinancialServicesIntermediaryAssociationCertFee : Money := 150_000

/-! === 四十九 資金決済関連（12 件） === -/

/-- 四十九(一) 資金決済に関する法律（平成二十一年法律第五十九号）第七条
    （第三者型発行者の登録）の第三者型前払式支払手段の発行者の登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee : Money := 150_000

/-- 四十九(二) 資金決済に関する法律第三十七条（資金移動業者の登録）の資金移動業者の登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def fundsTransferServiceProviderRegistrationFee : Money := 150_000

/-- 四十九(三) 資金決済に関する法律第四十一条第一項（変更登録等）の変更登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def fundsTransferServiceProviderChangeRegistrationFee : Money := 150_000

/-- 四十九(四) 資金決済に関する法律第六十二条の三の電子決済手段等取引業者の登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee : Money := 150_000

/-- 四十九(五) 資金決済に関する法律第六十二条の七第一項（変更登録等）の変更登録、
    登録件数一件につき十五万円（固定 ¥150,000）。 -/
def electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee : Money := 150_000

/-- 四十九(六) 資金決済に関する法律第六十三条の二（暗号資産交換業者の登録）の暗号資産
    交換業者の登録、登録件数一件につき十五万円（固定 ¥150,000）。 -/
def cryptoAssetExchangeBusinessRegistrationFee : Money := 150_000

/-- 四十九(七) 資金決済に関する法律第六十三条の二十二の二の電子決済手段・暗号資産サービス
    仲介業者の登録、登録件数一件につき九万円（固定 ¥90,000）。 -/
def electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee : Money := 90_000

/-- 四十九(八) 資金決済に関する法律第六十三条の二十二の六第一項（変更登録等）の変更登録、
    登録件数一件につき九万円（固定 ¥90,000）。 -/
def electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee : Money := 90_000

/-- 四十九(九) 資金決済に関する法律第六十三条の二十三（為替取引分析業者の許可）の為替取引
    分析業者の許可、許可件数一件につき十五万円（固定 ¥150,000）。 -/
def foreignExchangeAnalysisBusinessPermissionFee : Money := 150_000

/-- 四十九(十) 資金決済に関する法律第六十三条の三十三第一項（業務の種別の変更の許可等）の
    変更の許可、許可件数一件につき十五万円（固定 ¥150,000）。 -/
def businessCategoryChangePermissionFee : Money := 150_000

/-- 四十九(十一) 資金決済に関する法律第六十四条第一項（資金清算機関の免許等）の資金清算業の
    免許、免許件数一件につき十五万円（固定 ¥150,000）。 -/
def fundsClearingBusinessLicenseFee : Money := 150_000

/-- 四十九(十二) 資金決済に関する法律第八十七条（認定資金決済事業者協会の認定）の認定資金
    決済事業者協会の認定、認定件数一件につき十五万円（固定 ¥150,000）。 -/
def certifiedFundsSettlementBusinessAssociationCertFee : Money := 150_000

/-! === positivity（45 件） === -/

theorem securedBondTrustBizLicenseFee_pos : securedBondTrustBizLicenseFee > 0 := by decide
theorem enterpriseValueSecurityTrustBizLicenseFee_pos : enterpriseValueSecurityTrustBizLicenseFee > 0 := by decide
theorem financialProductMarketOpeningLicenseFee_pos : financialProductMarketOpeningLicenseFee > 0 := by decide
theorem internationalCooperationEmissionReductionMarketApprovalFee_pos : internationalCooperationEmissionReductionMarketApprovalFee > 0 := by decide
theorem financialExchangeOrgReorganizationApprovalFee_pos : financialExchangeOrgReorganizationApprovalFee > 0 := by decide
theorem otcSecuritiesMarketOpeningApprovalFee_pos : otcSecuritiesMarketOpeningApprovalFee > 0 := by decide
theorem foreignMarketTransactionApprovalFee_pos : foreignMarketTransactionApprovalFee > 0 := by decide
theorem financialExchangeHoldingCompanyApprovalFee_pos : financialExchangeHoldingCompanyApprovalFee > 0 := by decide
theorem certifiedFinancialInstrumentsFirmAssociationCertFee_pos : certifiedFinancialInstrumentsFirmAssociationCertFee > 0 := by decide
theorem certifiedInvestorProtectionOrgCertFee_pos : certifiedInvestorProtectionOrgCertFee > 0 := by decide
theorem selfRegulatoryBusinessApprovalFee_pos : selfRegulatoryBusinessApprovalFee > 0 := by decide
theorem financialInstrumentsBusinessRegistrationFee_pos : financialInstrumentsBusinessRegistrationFee > 0 := by decide
theorem financialInstrumentsBusinessChangeRegistrationFee_pos : financialInstrumentsBusinessChangeRegistrationFee > 0 := by decide
theorem financialInstrumentsBusinessApprovalFee_pos : financialInstrumentsBusinessApprovalFee > 0 := by decide
theorem foreignSecuritiesUnderwritingPermissionFee_pos : foreignSecuritiesUnderwritingPermissionFee > 0 := by decide
theorem exchangeTransactionBusinessPermissionFee_pos : exchangeTransactionBusinessPermissionFee > 0 := by decide
theorem electronicOtcDerivativeBusinessPermissionFee_pos : electronicOtcDerivativeBusinessPermissionFee > 0 := by decide
theorem financialInstrumentsIntermediaryRegistrationFee_pos : financialInstrumentsIntermediaryRegistrationFee > 0 := by decide
theorem creditRatingAgencyRegistrationFee_pos : creditRatingAgencyRegistrationFee > 0 := by decide
theorem investmentManagementRelatedBusinessTrusteeRegistrationFee_pos : investmentManagementRelatedBusinessTrusteeRegistrationFee > 0 := by decide
theorem financialInstrumentsBusinessChangeRegistrationArticle66_75Fee_pos : financialInstrumentsBusinessChangeRegistrationArticle66_75Fee > 0 := by decide
theorem financialInstrumentClearingCorpDebtAssumptionLicenseFee_pos : financialInstrumentClearingCorpDebtAssumptionLicenseFee > 0 := by decide
theorem foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee_pos : foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee > 0 := by decide
theorem linkedFinancialInstrumentDebtAssumptionApprovalFee_pos : linkedFinancialInstrumentDebtAssumptionApprovalFee > 0 := by decide
theorem securitiesFinanceCompanyLicenseFee_pos : securitiesFinanceCompanyLicenseFee > 0 := by decide
theorem specifiedFinancialCompanyRegistrationFee_pos : specifiedFinancialCompanyRegistrationFee > 0 := by decide
theorem moneyLenderRegistrationFee_pos : moneyLenderRegistrationFee > 0 := by decide
theorem moneyLendingBusinessManagerTrainingInstitutionRegistrationFee_pos : moneyLendingBusinessManagerTrainingInstitutionRegistrationFee > 0 := by decide
theorem mutualFinancingBusinessLicenseFee_pos : mutualFinancingBusinessLicenseFee > 0 := by decide
theorem mutualFinancingCompanyBranchOfficeApprovalFee_pos : mutualFinancingCompanyBranchOfficeApprovalFee > 0 := by decide
theorem financialServicesIntermediaryRegistrationFee_pos : financialServicesIntermediaryRegistrationFee > 0 := by decide
theorem financialServicesIntermediaryChangeRegistrationFee_pos : financialServicesIntermediaryChangeRegistrationFee > 0 := by decide
theorem certifiedFinancialServicesIntermediaryAssociationCertFee_pos : certifiedFinancialServicesIntermediaryAssociationCertFee > 0 := by decide
theorem thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee_pos : thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee > 0 := by decide
theorem fundsTransferServiceProviderRegistrationFee_pos : fundsTransferServiceProviderRegistrationFee > 0 := by decide
theorem fundsTransferServiceProviderChangeRegistrationFee_pos : fundsTransferServiceProviderChangeRegistrationFee > 0 := by decide
theorem electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee_pos : electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee > 0 := by decide
theorem electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee_pos : electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee > 0 := by decide
theorem cryptoAssetExchangeBusinessRegistrationFee_pos : cryptoAssetExchangeBusinessRegistrationFee > 0 := by decide
theorem electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee_pos : electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee > 0 := by decide
theorem electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee_pos : electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee > 0 := by decide
theorem foreignExchangeAnalysisBusinessPermissionFee_pos : foreignExchangeAnalysisBusinessPermissionFee > 0 := by decide
theorem businessCategoryChangePermissionFee_pos : businessCategoryChangePermissionFee > 0 := by decide
theorem fundsClearingBusinessLicenseFee_pos : fundsClearingBusinessLicenseFee > 0 := by decide
theorem certifiedFundsSettlementBusinessAssociationCertFee_pos : certifiedFundsSettlementBusinessAssociationCertFee > 0 := by decide

/-! === smoke（45 件、kernel-decide） === -/

example : securedBondTrustBizLicenseFee = 150_000 := by decide
example : enterpriseValueSecurityTrustBizLicenseFee = 150_000 := by decide
example : financialProductMarketOpeningLicenseFee = 150_000 := by decide
example : internationalCooperationEmissionReductionMarketApprovalFee = 150_000 := by decide
example : financialExchangeOrgReorganizationApprovalFee = 150_000 := by decide
example : otcSecuritiesMarketOpeningApprovalFee = 150_000 := by decide
example : foreignMarketTransactionApprovalFee = 150_000 := by decide
example : financialExchangeHoldingCompanyApprovalFee = 150_000 := by decide
example : certifiedFinancialInstrumentsFirmAssociationCertFee = 150_000 := by decide
example : certifiedInvestorProtectionOrgCertFee = 90_000 := by decide
example : selfRegulatoryBusinessApprovalFee = 150_000 := by decide
example : financialInstrumentsBusinessRegistrationFee = 150_000 := by decide
example : financialInstrumentsBusinessChangeRegistrationFee = 150_000 := by decide
example : financialInstrumentsBusinessApprovalFee = 150_000 := by decide
example : foreignSecuritiesUnderwritingPermissionFee = 90_000 := by decide
example : exchangeTransactionBusinessPermissionFee = 150_000 := by decide
example : electronicOtcDerivativeBusinessPermissionFee = 150_000 := by decide
example : financialInstrumentsIntermediaryRegistrationFee = 90_000 := by decide
example : creditRatingAgencyRegistrationFee = 90_000 := by decide
example : investmentManagementRelatedBusinessTrusteeRegistrationFee = 90_000 := by decide
example : financialInstrumentsBusinessChangeRegistrationArticle66_75Fee = 90_000 := by decide
example : financialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
example : foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee = 150_000 := by decide
example : linkedFinancialInstrumentDebtAssumptionApprovalFee = 150_000 := by decide
example : securitiesFinanceCompanyLicenseFee = 150_000 := by decide
example : specifiedFinancialCompanyRegistrationFee = 150_000 := by decide
example : moneyLenderRegistrationFee = 150_000 := by decide
example : moneyLendingBusinessManagerTrainingInstitutionRegistrationFee = 90_000 := by decide
example : mutualFinancingBusinessLicenseFee = 150_000 := by decide
example : mutualFinancingCompanyBranchOfficeApprovalFee = 90_000 := by decide
example : financialServicesIntermediaryRegistrationFee = 90_000 := by decide
example : financialServicesIntermediaryChangeRegistrationFee = 90_000 := by decide
example : certifiedFinancialServicesIntermediaryAssociationCertFee = 150_000 := by decide
example : thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee = 150_000 := by decide
example : fundsTransferServiceProviderRegistrationFee = 150_000 := by decide
example : fundsTransferServiceProviderChangeRegistrationFee = 150_000 := by decide
example : electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee = 150_000 := by decide
example : electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee = 150_000 := by decide
example : cryptoAssetExchangeBusinessRegistrationFee = 150_000 := by decide
example : electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee = 90_000 := by decide
example : electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee = 90_000 := by decide
example : foreignExchangeAnalysisBusinessPermissionFee = 150_000 := by decide
example : businessCategoryChangePermissionFee = 150_000 := by decide
example : fundsClearingBusinessLicenseFee = 150_000 := by decide
example : certifiedFundsSettlementBusinessAssociationCertFee = 150_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ2
