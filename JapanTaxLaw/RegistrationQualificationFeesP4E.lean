import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP4E — 登録免許税法 別表第一（二）第三十二号 九十〜九十六 の flat fee モデル (W-E)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  section 開始マーカー: "三十二　人の資格の登録若しくは認定又は技能証明"（\u3000 は全角空白）

Models 別表第一（二）第三十二号 の 九十〜九十六 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）:

  九十     食品循環資源 登録再生利用事業者の登録 ... 一件につき九万円       → ¥90,000
  九十一（一）   農林漁業体験民宿業者の登録 ... 一件につき一万五千円          → ¥15,000
  九十一（二）   登録実施機関の登録 ... 一件につき九万円                    → ¥90,000
  九十一の二（一） 木材関連事業者の登録 ... 一件につき一万五千円              → ¥15,000
  九十一の二（二） 登録実施機関の登録 ... 一件につき九万円                  → ¥90,000
  九十二   馬主の登録 ... 一件につき九万円                              → ¥90,000
  九十三（一）   農林中央金庫 外国業務委託契約の認可 ... 一件につき九万円      → ¥90,000
  九十三（二）   農林中央金庫代理業の許可 ... 一件につき九万円               → ¥90,000
  九十三（三）   特定信用事業代理業の許可（農協） ... 一件につき九万円        → ¥90,000
  九十三（四）   特定信用事業代理業の許可（水協） ... 一件につき九万円        → ¥90,000
  九十三の二（一）（二）（三） 電子決済等代行業者の登録 ... 一件につき九万円   → ¥90,000
  九十三の二（四）（五）（六） 認定電子決済等代行事業者協会の認定 ... 十五万円 → ¥150,000
  九十四（一）〜（六） 商品取引所・市場開設・組織変更・持株会社・類似施設 ... 十五万円 → ¥150,000
  九十四（七）   変更の許可（商品／商品指数の増加） ... 一件につき三万円      → ¥30,000
  九十五（一）（三）（四） 商品先物取引業・債務引受業・委託者保護基金 ... 十五万円 → ¥150,000
  九十五（二）   商品先物取引仲介業者の登録 ... 一件につき九万円              → ¥90,000
  九十六（一）   商品投資顧問業の許可 ... 一件につき十五万円                 → ¥150,000
  九十六（二）   業務の種類の変更の認可 ... 一件につき三万円                 → ¥30,000
  九十六の二（一） 商工組合中央金庫電子決済等代行業者の登録 ... 九万円        → ¥90,000
  九十六の二（二） 認定商工組合中央金庫電子決済等代行事業者協会の認定 ... 十五万円 → ¥150,000

本範囲には割合（千分の△）やデーミング規定はなく、全 31 件が一件につきの固定額である。
金額なしの行はない。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
   caller-established とし、ここではモデル化しない。
* 「更新の登録を除く。」「更新の許可を除く。」「政令で定めるものに限る。」
   「同項ただし書の金融商品市場の開設の業務又は金融商品債務引受業等に係るものを除く。）」
   「同法第三百三十二条第二項第三号又は第三百四十二条第二項第三号の取引の対象となる商品又は
   商品指数の増加に係るものに限る。」「同法第五条第一項第六号（許可の申請）の業務の種類の増加に
   係るものに限る。」等の適用判定は caller-established とし、金額定数には反映しない。
* 八十九 以前・九十七 以降は NOT YET COVERED。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 九十 食品循環資源に係る登録再生利用事業者の登録（登録再生利用事業者の登録（更新の登録を除く。））の件数につきの額（固定 ¥90_000）。 -/
def foodRecyclingRegistrantRegFee : Money := 90_000
/-- 九十一（一） 農林漁業体験民宿業者の登録（第十六条第一項）の件数につきの額（固定 ¥15_000）。 -/
def farmStayBizRegFee : Money := 15_000
/-- 九十一（二） 農林漁業体験民宿業者に係る登録実施機関の登録（更新の登録を除く。）の件数につきの額（固定 ¥90_000）。 -/
def farmStayRegOrgRegFee : Money := 90_000
/-- 九十一の二（一） 木材関連事業者の登録（第十五条、更新の登録を除く。）の件数につきの額（固定 ¥15_000）。 -/
def timberRelatedBizRegFee : Money := 15_000
/-- 九十一の二（二） 木材関連事業者に係る登録実施機関の登録（第十五条、更新の登録を除く。）の件数につきの額（固定 ¥90_000）。 -/
def timberRegOrgRegFee : Money := 90_000
/-- 九十二 馬主の登録（競馬法第十三条第一項）の件数につきの額（固定 ¥90_000）。 -/
def horseOwnerRegFee : Money := 90_000
/-- 九十三（一） 農林中央金庫の外国における業務の委託契約の締結に係る認可の件数につきの額（固定 ¥90_000）。 -/
def norinchukinForeignOutsourceApprovalFee : Money := 90_000
/-- 九十三（二） 農林中央金庫代理業の許可（農林中央金庫法第九十五条の二第一項）の件数につきの額（固定 ¥90_000）。 -/
def norinchukinAgencyPermitFee : Money := 90_000
/-- 九十三（三） 特定信用事業代理業の許可（農業協同組合法第九十二条の二第一項）の件数につきの額（固定 ¥90_000）。 -/
def jaCreditAgencyPermitFee : Money := 90_000
/-- 九十三（四） 特定信用事業代理業の許可（水産業協同組合法第百六条第一項）の件数につきの額（固定 ¥90_000）。 -/
def fisheriesCreditAgencyPermitFee : Money := 90_000
/-- 九十三の二（一） 農林中央金庫電子決済等代行業者の登録（第九十五条の五の二第一項）の件数につきの額（固定 ¥90_000）。 -/
def norinchukinEpiAgentRegFee : Money := 90_000
/-- 九十三の二（二） 特定信用事業電子決済等代行業者の登録（農業協同組合法第九十二条の五の二第一項）の件数につきの額（固定 ¥90_000）。 -/
def jaEpiAgentRegFee : Money := 90_000
/-- 九十三の二（三） 特定信用事業電子決済等代行業者の登録（水産業協同組合法第百十条第一項）の件数につきの額（固定 ¥90_000）。 -/
def fisheriesEpiAgentRegFee : Money := 90_000
/-- 九十三の二（四） 認定農林中央金庫電子決済等代行事業者協会の認定（第九十五条の五の七）の件数につきの額（固定 ¥150_000）。 -/
def certNorinchukinEpiAssocCertFee : Money := 150_000
/-- 九十三の二（五） 認定特定信用事業電子決済等代行事業者協会の認定（農業協同組合法第九十二条の五の六）の件数につきの額（固定 ¥150_000）。 -/
def certJaEpiAssocCertFee : Money := 150_000
/-- 九十三の二（六） 認定特定信用事業電子決済等代行事業者協会の認定（水産業協同組合法第百十四条）の件数につきの額（固定 ¥150_000）。 -/
def certFisheriesEpiAssocCertFee : Money := 150_000
/-- 九十四（一） 会員商品取引所の設立の許可又は株式会社商品取引所の許可の件数につきの額（固定 ¥150_000）。 -/
def commodityExchangeEstabPermitFee : Money := 150_000
/-- 九十四（二） 国際協力排出削減量に係る取引を行う市場の開設等の認可の件数につきの額（固定 ¥150_000）。 -/
def intlEmissionMarketApprovalFee : Money := 150_000
/-- 九十四（三） 組織変更の認可（商品先物取引法第百三十二条第一項）の件数につきの額（固定 ¥150_000）。 -/
def commodityOrgChangeApprovalFee : Money := 150_000
/-- 九十四（四） 商品取引所持株会社に係る認可（第九十六条の二十五第一項又は第三項ただし書）の件数につきの額（固定 ¥150_000）。 -/
def commodityHoldingCoApprovalFee : Money := 150_000
/-- 九十四（五） 第一種特定商品市場類似施設の開設の許可（第三百三十二条第一項）の件数につきの額（固定 ¥150_000）。 -/
def type1SimilarMarketFacilityPermitFee : Money := 150_000
/-- 九十四（六） 第二種特定商品市場類似施設の開設の許可（第三百四十二条第一項）の件数につきの額（固定 ¥150_000）。 -/
def type2SimilarMarketFacilityPermitFee : Money := 150_000
/-- 九十四（七） 変更の許可（第三百三十五条第一項、商品又は商品指数の増加に係るものに限る。）の件数につきの額（固定 ¥30_000）。 -/
def commodityChangePermitFee : Money := 30_000
/-- 九十五（一） 商品先物取引業の許可（第百九十条第一項、更新の許可を除く。）の件数につきの額（固定 ¥150_000）。 -/
def commodityFuturesBizPermitFee : Money := 150_000
/-- 九十五（二） 商品先物取引仲介業者の登録（第二百四十条の二第一項、更新の登録を除く。）の件数につきの額（固定 ¥90_000）。 -/
def commodityFuturesBrokerRegFee : Money := 90_000
/-- 九十五（三） 商品取引債務引受業の許可（第百六十七条）の件数につきの額（固定 ¥150_000）。 -/
def commodityDebtAssumptionPermitFee : Money := 150_000
/-- 九十五（四） 委託者保護基金の設立の認可（第二百七十九条第一項）の件数につきの額（固定 ¥150_000）。 -/
def clientProtectionFundApprovalFee : Money := 150_000
/-- 九十六（一） 商品投資顧問業の許可（第三条、更新の許可を除く。）の件数につきの額（固定 ¥150_000）。 -/
def commodityInvestAdvisorPermitFee : Money := 150_000
/-- 九十六（二） 業務の種類の変更の認可（第九条、業務の種類の増加に係るものに限る。）の件数につきの額（固定 ¥30_000）。 -/
def commodityBizTypeChangeApprovalFee : Money := 30_000
/-- 九十六の二（一） 商工組合中央金庫電子決済等代行業者の登録（第六十条の三）の件数につきの額（固定 ¥90_000）。 -/
def shokochukinEpiAgentRegFee : Money := 90_000
/-- 九十六の二（二） 認定商工組合中央金庫電子決済等代行事業者協会の認定（第六十条の二十一）の件数につきの額（固定 ¥150_000）。 -/
def certShokochukinEpiAssocCertFee : Money := 150_000

theorem foodRecyclingRegistrantRegFee_pos : foodRecyclingRegistrantRegFee > 0 := by decide
theorem farmStayBizRegFee_pos : farmStayBizRegFee > 0 := by decide
theorem farmStayRegOrgRegFee_pos : farmStayRegOrgRegFee > 0 := by decide
theorem timberRelatedBizRegFee_pos : timberRelatedBizRegFee > 0 := by decide
theorem timberRegOrgRegFee_pos : timberRegOrgRegFee > 0 := by decide
theorem horseOwnerRegFee_pos : horseOwnerRegFee > 0 := by decide
theorem norinchukinForeignOutsourceApprovalFee_pos : norinchukinForeignOutsourceApprovalFee > 0 := by decide
theorem norinchukinAgencyPermitFee_pos : norinchukinAgencyPermitFee > 0 := by decide
theorem jaCreditAgencyPermitFee_pos : jaCreditAgencyPermitFee > 0 := by decide
theorem fisheriesCreditAgencyPermitFee_pos : fisheriesCreditAgencyPermitFee > 0 := by decide
theorem norinchukinEpiAgentRegFee_pos : norinchukinEpiAgentRegFee > 0 := by decide
theorem jaEpiAgentRegFee_pos : jaEpiAgentRegFee > 0 := by decide
theorem fisheriesEpiAgentRegFee_pos : fisheriesEpiAgentRegFee > 0 := by decide
theorem certNorinchukinEpiAssocCertFee_pos : certNorinchukinEpiAssocCertFee > 0 := by decide
theorem certJaEpiAssocCertFee_pos : certJaEpiAssocCertFee > 0 := by decide
theorem certFisheriesEpiAssocCertFee_pos : certFisheriesEpiAssocCertFee > 0 := by decide
theorem commodityExchangeEstabPermitFee_pos : commodityExchangeEstabPermitFee > 0 := by decide
theorem intlEmissionMarketApprovalFee_pos : intlEmissionMarketApprovalFee > 0 := by decide
theorem commodityOrgChangeApprovalFee_pos : commodityOrgChangeApprovalFee > 0 := by decide
theorem commodityHoldingCoApprovalFee_pos : commodityHoldingCoApprovalFee > 0 := by decide
theorem type1SimilarMarketFacilityPermitFee_pos : type1SimilarMarketFacilityPermitFee > 0 := by decide
theorem type2SimilarMarketFacilityPermitFee_pos : type2SimilarMarketFacilityPermitFee > 0 := by decide
theorem commodityChangePermitFee_pos : commodityChangePermitFee > 0 := by decide
theorem commodityFuturesBizPermitFee_pos : commodityFuturesBizPermitFee > 0 := by decide
theorem commodityFuturesBrokerRegFee_pos : commodityFuturesBrokerRegFee > 0 := by decide
theorem commodityDebtAssumptionPermitFee_pos : commodityDebtAssumptionPermitFee > 0 := by decide
theorem clientProtectionFundApprovalFee_pos : clientProtectionFundApprovalFee > 0 := by decide
theorem commodityInvestAdvisorPermitFee_pos : commodityInvestAdvisorPermitFee > 0 := by decide
theorem commodityBizTypeChangeApprovalFee_pos : commodityBizTypeChangeApprovalFee > 0 := by decide
theorem shokochukinEpiAgentRegFee_pos : shokochukinEpiAgentRegFee > 0 := by decide
theorem certShokochukinEpiAssocCertFee_pos : certShokochukinEpiAssocCertFee > 0 := by decide

example : foodRecyclingRegistrantRegFee = 90_000 := by decide
example : farmStayBizRegFee = 15_000 := by decide
example : farmStayRegOrgRegFee = 90_000 := by decide
example : timberRelatedBizRegFee = 15_000 := by decide
example : timberRegOrgRegFee = 90_000 := by decide
example : horseOwnerRegFee = 90_000 := by decide
example : norinchukinForeignOutsourceApprovalFee = 90_000 := by decide
example : norinchukinAgencyPermitFee = 90_000 := by decide
example : jaCreditAgencyPermitFee = 90_000 := by decide
example : fisheriesCreditAgencyPermitFee = 90_000 := by decide
example : norinchukinEpiAgentRegFee = 90_000 := by decide
example : jaEpiAgentRegFee = 90_000 := by decide
example : fisheriesEpiAgentRegFee = 90_000 := by decide
example : certNorinchukinEpiAssocCertFee = 150_000 := by decide
example : certJaEpiAssocCertFee = 150_000 := by decide
example : certFisheriesEpiAssocCertFee = 150_000 := by decide
example : commodityExchangeEstabPermitFee = 150_000 := by decide
example : intlEmissionMarketApprovalFee = 150_000 := by decide
example : commodityOrgChangeApprovalFee = 150_000 := by decide
example : commodityHoldingCoApprovalFee = 150_000 := by decide
example : type1SimilarMarketFacilityPermitFee = 150_000 := by decide
example : type2SimilarMarketFacilityPermitFee = 150_000 := by decide
example : commodityChangePermitFee = 30_000 := by decide
example : commodityFuturesBizPermitFee = 150_000 := by decide
example : commodityFuturesBrokerRegFee = 90_000 := by decide
example : commodityDebtAssumptionPermitFee = 150_000 := by decide
example : clientProtectionFundApprovalFee = 150_000 := by decide
example : commodityInvestAdvisorPermitFee = 150_000 := by decide
example : commodityBizTypeChangeApprovalFee = 30_000 := by decide
example : shokochukinEpiAgentRegFee = 90_000 := by decide
example : certShokochukinEpiAssocCertFee = 150_000 := by decide

end JapanTaxLaw
