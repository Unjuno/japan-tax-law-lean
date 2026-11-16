import JapanTaxLaw.RegistrationQualificationFeesP4E

/-!
# RegistrationQualificationFeesP4ESpec spec — independent restatement of
     登録免許税法 別表第一（二）第三十二号 九十〜九十六

Sources (pinned; identical to RegistrationQualificationFeesP4E.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 九十〜九十六 の flat 額 from the statutory text itself.
本範囲には割合やデーミング規定はなく、全 31 件が一件につきの固定額（金額なしの行なし）。

Scope boundaries identical to the implementation (八十九 以前・九十七 以降は NOT YET COVERED;
「更新の登録を除く」「政令で定めるものに限る」等の適用判定は caller-established).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 1 九十 食品循環資源に係る登録再生利用事業者の登録（登録再生利用事業者の登録（更新の登録を除く。））。 -/
def specFoodRecyclingRegistrantRegFee : Money := 90_000
/-- Spec: 2 九十一（一） 農林漁業体験民宿業者の登録（第十六条第一項）。 -/
def specFarmStayBizRegFee : Money := 15_000
/-- Spec: 3 九十一（二） 農林漁業体験民宿業者に係る登録実施機関の登録（更新の登録を除く。）。 -/
def specFarmStayRegOrgRegFee : Money := 90_000
/-- Spec: 4 九十一の二（一） 木材関連事業者の登録（第十五条、更新の登録を除く。）。 -/
def specTimberRelatedBizRegFee : Money := 15_000
/-- Spec: 5 九十一の二（二） 木材関連事業者に係る登録実施機関の登録（第十五条、更新の登録を除く。）。 -/
def specTimberRegOrgRegFee : Money := 90_000
/-- Spec: 6 九十二 馬主の登録（競馬法第十三条第一項）。 -/
def specHorseOwnerRegFee : Money := 90_000
/-- Spec: 7 九十三（一） 農林中央金庫の外国における業務の委託契約の締結に係る認可。 -/
def specNorinchukinForeignOutsourceApprovalFee : Money := 90_000
/-- Spec: 8 九十三（二） 農林中央金庫代理業の許可（農林中央金庫法第九十五条の二第一項）。 -/
def specNorinchukinAgencyPermitFee : Money := 90_000
/-- Spec: 9 九十三（三） 特定信用事業代理業の許可（農業協同組合法第九十二条の二第一項）。 -/
def specJaCreditAgencyPermitFee : Money := 90_000
/-- Spec: 10 九十三（四） 特定信用事業代理業の許可（水産業協同組合法第百六条第一項）。 -/
def specFisheriesCreditAgencyPermitFee : Money := 90_000
/-- Spec: 11 九十三の二（一） 農林中央金庫電子決済等代行業者の登録（第九十五条の五の二第一項）。 -/
def specNorinchukinEpiAgentRegFee : Money := 90_000
/-- Spec: 12 九十三の二（二） 特定信用事業電子決済等代行業者の登録（農業協同組合法第九十二条の五の二第一項）。 -/
def specJaEpiAgentRegFee : Money := 90_000
/-- Spec: 13 九十三の二（三） 特定信用事業電子決済等代行業者の登録（水産業協同組合法第百十条第一項）。 -/
def specFisheriesEpiAgentRegFee : Money := 90_000
/-- Spec: 14 九十三の二（四） 認定農林中央金庫電子決済等代行事業者協会の認定（第九十五条の五の七）。 -/
def specCertNorinchukinEpiAssocCertFee : Money := 150_000
/-- Spec: 15 九十三の二（五） 認定特定信用事業電子決済等代行事業者協会の認定（農業協同組合法第九十二条の五の六）。 -/
def specCertJaEpiAssocCertFee : Money := 150_000
/-- Spec: 16 九十三の二（六） 認定特定信用事業電子決済等代行事業者協会の認定（水産業協同組合法第百十四条）。 -/
def specCertFisheriesEpiAssocCertFee : Money := 150_000
/-- Spec: 17 九十四（一） 会員商品取引所の設立の許可又は株式会社商品取引所の許可。 -/
def specCommodityExchangeEstabPermitFee : Money := 150_000
/-- Spec: 18 九十四（二） 国際協力排出削減量に係る取引を行う市場の開設等の認可。 -/
def specIntlEmissionMarketApprovalFee : Money := 150_000
/-- Spec: 19 九十四（三） 組織変更の認可（商品先物取引法第百三十二条第一項）。 -/
def specCommodityOrgChangeApprovalFee : Money := 150_000
/-- Spec: 20 九十四（四） 商品取引所持株会社に係る認可（第九十六条の二十五第一項又は第三項ただし書）。 -/
def specCommodityHoldingCoApprovalFee : Money := 150_000
/-- Spec: 21 九十四（五） 第一種特定商品市場類似施設の開設の許可（第三百三十二条第一項）。 -/
def specType1SimilarMarketFacilityPermitFee : Money := 150_000
/-- Spec: 22 九十四（六） 第二種特定商品市場類似施設の開設の許可（第三百四十二条第一項）。 -/
def specType2SimilarMarketFacilityPermitFee : Money := 150_000
/-- Spec: 23 九十四（七） 変更の許可（第三百三十五条第一項、商品又は商品指数の増加に係るものに限る。）。 -/
def specCommodityChangePermitFee : Money := 30_000
/-- Spec: 24 九十五（一） 商品先物取引業の許可（第百九十条第一項、更新の許可を除く。）。 -/
def specCommodityFuturesBizPermitFee : Money := 150_000
/-- Spec: 25 九十五（二） 商品先物取引仲介業者の登録（第二百四十条の二第一項、更新の登録を除く。）。 -/
def specCommodityFuturesBrokerRegFee : Money := 90_000
/-- Spec: 26 九十五（三） 商品取引債務引受業の許可（第百六十七条）。 -/
def specCommodityDebtAssumptionPermitFee : Money := 150_000
/-- Spec: 27 九十五（四） 委託者保護基金の設立の認可（第二百七十九条第一項）。 -/
def specClientProtectionFundApprovalFee : Money := 150_000
/-- Spec: 28 九十六（一） 商品投資顧問業の許可（第三条、更新の許可を除く。）。 -/
def specCommodityInvestAdvisorPermitFee : Money := 150_000
/-- Spec: 29 九十六（二） 業務の種類の変更の認可（第九条、業務の種類の増加に係るものに限る。）。 -/
def specCommodityBizTypeChangeApprovalFee : Money := 30_000
/-- Spec: 30 九十六の二（一） 商工組合中央金庫電子決済等代行業者の登録（第六十条の三）。 -/
def specShokochukinEpiAgentRegFee : Money := 90_000
/-- Spec: 31 九十六の二（二） 認定商工組合中央金庫電子決済等代行事業者協会の認定（第六十条の二十一）。 -/
def specCertShokochukinEpiAssocCertFee : Money := 150_000

example : specFoodRecyclingRegistrantRegFee = 90_000 := by decide
example : specFarmStayBizRegFee = 15_000 := by decide
example : specFarmStayRegOrgRegFee = 90_000 := by decide
example : specTimberRelatedBizRegFee = 15_000 := by decide
example : specTimberRegOrgRegFee = 90_000 := by decide
example : specHorseOwnerRegFee = 90_000 := by decide
example : specNorinchukinForeignOutsourceApprovalFee = 90_000 := by decide
example : specNorinchukinAgencyPermitFee = 90_000 := by decide
example : specJaCreditAgencyPermitFee = 90_000 := by decide
example : specFisheriesCreditAgencyPermitFee = 90_000 := by decide
example : specNorinchukinEpiAgentRegFee = 90_000 := by decide
example : specJaEpiAgentRegFee = 90_000 := by decide
example : specFisheriesEpiAgentRegFee = 90_000 := by decide
example : specCertNorinchukinEpiAssocCertFee = 150_000 := by decide
example : specCertJaEpiAssocCertFee = 150_000 := by decide
example : specCertFisheriesEpiAssocCertFee = 150_000 := by decide
example : specCommodityExchangeEstabPermitFee = 150_000 := by decide
example : specIntlEmissionMarketApprovalFee = 150_000 := by decide
example : specCommodityOrgChangeApprovalFee = 150_000 := by decide
example : specCommodityHoldingCoApprovalFee = 150_000 := by decide
example : specType1SimilarMarketFacilityPermitFee = 150_000 := by decide
example : specType2SimilarMarketFacilityPermitFee = 150_000 := by decide
example : specCommodityChangePermitFee = 30_000 := by decide
example : specCommodityFuturesBizPermitFee = 150_000 := by decide
example : specCommodityFuturesBrokerRegFee = 90_000 := by decide
example : specCommodityDebtAssumptionPermitFee = 150_000 := by decide
example : specClientProtectionFundApprovalFee = 150_000 := by decide
example : specCommodityInvestAdvisorPermitFee = 150_000 := by decide
example : specCommodityBizTypeChangeApprovalFee = 30_000 := by decide
example : specShokochukinEpiAgentRegFee = 90_000 := by decide
example : specCertShokochukinEpiAssocCertFee = 150_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP4E : Bool :=
  specFoodRecyclingRegistrantRegFee == foodRecyclingRegistrantRegFee &&
  specFarmStayBizRegFee == farmStayBizRegFee &&
  specFarmStayRegOrgRegFee == farmStayRegOrgRegFee &&
  specTimberRelatedBizRegFee == timberRelatedBizRegFee &&
  specTimberRegOrgRegFee == timberRegOrgRegFee &&
  specHorseOwnerRegFee == horseOwnerRegFee &&
  specNorinchukinForeignOutsourceApprovalFee == norinchukinForeignOutsourceApprovalFee &&
  specNorinchukinAgencyPermitFee == norinchukinAgencyPermitFee &&
  specJaCreditAgencyPermitFee == jaCreditAgencyPermitFee &&
  specFisheriesCreditAgencyPermitFee == fisheriesCreditAgencyPermitFee &&
  specNorinchukinEpiAgentRegFee == norinchukinEpiAgentRegFee &&
  specJaEpiAgentRegFee == jaEpiAgentRegFee &&
  specFisheriesEpiAgentRegFee == fisheriesEpiAgentRegFee &&
  specCertNorinchukinEpiAssocCertFee == certNorinchukinEpiAssocCertFee &&
  specCertJaEpiAssocCertFee == certJaEpiAssocCertFee &&
  specCertFisheriesEpiAssocCertFee == certFisheriesEpiAssocCertFee &&
  specCommodityExchangeEstabPermitFee == commodityExchangeEstabPermitFee &&
  specIntlEmissionMarketApprovalFee == intlEmissionMarketApprovalFee &&
  specCommodityOrgChangeApprovalFee == commodityOrgChangeApprovalFee &&
  specCommodityHoldingCoApprovalFee == commodityHoldingCoApprovalFee &&
  specType1SimilarMarketFacilityPermitFee == type1SimilarMarketFacilityPermitFee &&
  specType2SimilarMarketFacilityPermitFee == type2SimilarMarketFacilityPermitFee &&
  specCommodityChangePermitFee == commodityChangePermitFee &&
  specCommodityFuturesBizPermitFee == commodityFuturesBizPermitFee &&
  specCommodityFuturesBrokerRegFee == commodityFuturesBrokerRegFee &&
  specCommodityDebtAssumptionPermitFee == commodityDebtAssumptionPermitFee &&
  specClientProtectionFundApprovalFee == clientProtectionFundApprovalFee &&
  specCommodityInvestAdvisorPermitFee == commodityInvestAdvisorPermitFee &&
  specCommodityBizTypeChangeApprovalFee == commodityBizTypeChangeApprovalFee &&
  specShokochukinEpiAgentRegFee == shokochukinEpiAgentRegFee &&
  specCertShokochukinEpiAssocCertFee == certShokochukinEpiAssocCertFee

example : agreeRegistrationQualificationFeesP4E = true := by decide

end JapanTaxLaw
