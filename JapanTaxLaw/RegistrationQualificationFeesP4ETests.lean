import JapanTaxLaw.RegistrationQualificationFeesP4E

/-!
# RegistrationQualificationFeesP4E tests — 別表第一（二）第三十二号 九十〜九十六 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 1 九十 食品循環資源に係る登録再生利用事業者の登録（登録再生利用事業者の登録（更新の登録を除く。））
example : foodRecyclingRegistrantRegFee = 90_000 := by decide
-- 2 九十一（一） 農林漁業体験民宿業者の登録（第十六条第一項）
example : farmStayBizRegFee = 15_000 := by decide
-- 3 九十一（二） 農林漁業体験民宿業者に係る登録実施機関の登録（更新の登録を除く。）
example : farmStayRegOrgRegFee = 90_000 := by decide
-- 4 九十一の二（一） 木材関連事業者の登録（第十五条、更新の登録を除く。）
example : timberRelatedBizRegFee = 15_000 := by decide
-- 5 九十一の二（二） 木材関連事業者に係る登録実施機関の登録（第十五条、更新の登録を除く。）
example : timberRegOrgRegFee = 90_000 := by decide
-- 6 九十二 馬主の登録（競馬法第十三条第一項）
example : horseOwnerRegFee = 90_000 := by decide
-- 7 九十三（一） 農林中央金庫の外国における業務の委託契約の締結に係る認可
example : norinchukinForeignOutsourceApprovalFee = 90_000 := by decide
-- 8 九十三（二） 農林中央金庫代理業の許可（農林中央金庫法第九十五条の二第一項）
example : norinchukinAgencyPermitFee = 90_000 := by decide
-- 9 九十三（三） 特定信用事業代理業の許可（農業協同組合法第九十二条の二第一項）
example : jaCreditAgencyPermitFee = 90_000 := by decide
-- 10 九十三（四） 特定信用事業代理業の許可（水産業協同組合法第百六条第一項）
example : fisheriesCreditAgencyPermitFee = 90_000 := by decide
-- 11 九十三の二（一） 農林中央金庫電子決済等代行業者の登録（第九十五条の五の二第一項）
example : norinchukinEpiAgentRegFee = 90_000 := by decide
-- 12 九十三の二（二） 特定信用事業電子決済等代行業者の登録（農業協同組合法第九十二条の五の二第一項）
example : jaEpiAgentRegFee = 90_000 := by decide
-- 13 九十三の二（三） 特定信用事業電子決済等代行業者の登録（水産業協同組合法第百十条第一項）
example : fisheriesEpiAgentRegFee = 90_000 := by decide
-- 14 九十三の二（四） 認定農林中央金庫電子決済等代行事業者協会の認定（第九十五条の五の七）
example : certNorinchukinEpiAssocCertFee = 150_000 := by decide
-- 15 九十三の二（五） 認定特定信用事業電子決済等代行事業者協会の認定（農業協同組合法第九十二条の五の六）
example : certJaEpiAssocCertFee = 150_000 := by decide
-- 16 九十三の二（六） 認定特定信用事業電子決済等代行事業者協会の認定（水産業協同組合法第百十四条）
example : certFisheriesEpiAssocCertFee = 150_000 := by decide
-- 17 九十四（一） 会員商品取引所の設立の許可又は株式会社商品取引所の許可
example : commodityExchangeEstabPermitFee = 150_000 := by decide
-- 18 九十四（二） 国際協力排出削減量に係る取引を行う市場の開設等の認可
example : intlEmissionMarketApprovalFee = 150_000 := by decide
-- 19 九十四（三） 組織変更の認可（商品先物取引法第百三十二条第一項）
example : commodityOrgChangeApprovalFee = 150_000 := by decide
-- 20 九十四（四） 商品取引所持株会社に係る認可（第九十六条の二十五第一項又は第三項ただし書）
example : commodityHoldingCoApprovalFee = 150_000 := by decide
-- 21 九十四（五） 第一種特定商品市場類似施設の開設の許可（第三百三十二条第一項）
example : type1SimilarMarketFacilityPermitFee = 150_000 := by decide
-- 22 九十四（六） 第二種特定商品市場類似施設の開設の許可（第三百四十二条第一項）
example : type2SimilarMarketFacilityPermitFee = 150_000 := by decide
-- 23 九十四（七） 変更の許可（第三百三十五条第一項、商品又は商品指数の増加に係るものに限る。）
example : commodityChangePermitFee = 30_000 := by decide
-- 24 九十五（一） 商品先物取引業の許可（第百九十条第一項、更新の許可を除く。）
example : commodityFuturesBizPermitFee = 150_000 := by decide
-- 25 九十五（二） 商品先物取引仲介業者の登録（第二百四十条の二第一項、更新の登録を除く。）
example : commodityFuturesBrokerRegFee = 90_000 := by decide
-- 26 九十五（三） 商品取引債務引受業の許可（第百六十七条）
example : commodityDebtAssumptionPermitFee = 150_000 := by decide
-- 27 九十五（四） 委託者保護基金の設立の認可（第二百七十九条第一項）
example : clientProtectionFundApprovalFee = 150_000 := by decide
-- 28 九十六（一） 商品投資顧問業の許可（第三条、更新の許可を除く。）
example : commodityInvestAdvisorPermitFee = 150_000 := by decide
-- 29 九十六（二） 業務の種類の変更の認可（第九条、業務の種類の増加に係るものに限る。）
example : commodityBizTypeChangeApprovalFee = 30_000 := by decide
-- 30 九十六の二（一） 商工組合中央金庫電子決済等代行業者の登録（第六十条の三）
example : shokochukinEpiAgentRegFee = 90_000 := by decide
-- 31 九十六の二（二） 認定商工組合中央金庫電子決済等代行事業者協会の認定（第六十条の二十一）
example : certShokochukinEpiAssocCertFee = 150_000 := by decide

end JapanTaxLaw
