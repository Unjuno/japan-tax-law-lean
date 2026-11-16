import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP8M — 登録免許税法 別表第一（二）第三十二号 百四十〜百五十一 の flat fee モデル (W-M)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_140_151.txt（百四十〜百五十一、UTF-8）

Models 別表第一（二）第三十二号 の 百四十〜百五十一 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」および
「倉庫／トランクルームの数一個につき△△円」は 40 箇所。全 40 件を一件／一箇につきの
固定額としてモデル化する（割合（千分の△）は本範囲に存在しない）。

百四十(一) 倉庫業者の登録 ..................................... 九万円   → ¥90,000
百四十(二) 変更登録（新設・政令で定めるものに限る。）一個につき 三万円   → ¥30,000
百四十(三) トランクルームの認定 一個につき .................... 一万円   → ¥10,000
百四十一(一) ホテルの登録 .................................... 十五万円 → ¥150,000
百四十一(二)(三) 旅館の登録／登録実施機関の登録 .............. 2×九万円 → ¥90,000
百四十一の二 全国通訳案内士の登録研修機関の登録 .............. 九万円   → ¥90,000
百四十二(一)(三)(四)(五) 旅行業等／登録研修機関 .............. 4×九万円 → ¥90,000
百四十二(二) 旅行業者代理業の登録 ............................ 一万五千円 → ¥15,000
百四十二の二 観光圏整備実施計画（観光案内所）の認定 .......... 一万五千円 → ¥15,000
百四十二の三(一)(二) 住宅宿泊管理／仲介業者の登録 ........... 2×九万円 → ¥90,000
百四十三(一)〜(五) 予報業務の許可等・気象測器の認定／登録 .... 5×九万円 → ¥90,000
百四十四(一)イ・ロ 建設業の許可（第一号／第二号） ........... 2×十五万円 → ¥150,000
百四十四(二)(三) 講習／登録経営状況分析機関の登録 ........... 2×九万円 → ¥90,000
百四十五(一)(二) 工場／外国工場で製造する浄化槽の型式認定 .... 2×九万円 → ¥90,000
百四十六(一)(二) 不動産鑑定業者／実務修習機関 ............... 2×九万円 → ¥90,000
百四十七(一)(二) 宅地建物取引業の免許／登録講習機関 ......... 2×九万円 → ¥90,000
百四十八 積立式宅地建物販売業の許可 .......................... 十五万円 → ¥150,000
百四十九 前払金保証事業の登録 ................................ 十五万円 → ¥150,000
百五十(一)(三) 不動産特定共同事業／小規模…の許可・登録 ....... 2×十五万円 → ¥150,000
百五十(二)(四) 種別の増加に係る変更の認可／変更の登録 ........ 2×三万円 → ¥30,000
百五十一(一)〜(三) マンション管理業者／登録講習機関 ......... 3×九万円 → ¥90,000
百五十一の二 賃貸住宅管理業者の登録 .......................... 九万円   → ¥90,000

Scope & honest boundaries:

* 一件／一箇につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
  caller-established とし、ここではモデル化しない。個数（倉庫数・トランクルーム数）の
  掛け算も caller-established（定数は単価のみを表す）。
* 「政令で定めるものに限る」「更新の登録／免許／認定を除く」「既に…については一万五千円」
  「既に当該認定を受けている者が受けるものを除く」等の適用判定・軽減額は caller-established
  とし、金額定数には反映しない（Bool を式に入れず、軽減額の別 def も作らない）。
  特に百四十五(一)(二) の括弧書「既に…異なる場合…については一万五千円」は軽減額であり、
  対応する別 def は作っていない（主たる fee は九万円）。
* 百四十の（注）（物資流通効率化法／福島復興再生特別措置法によるみなし）および百四十二の
  （注）（観光圏整備法／奄美群島・小笠原諸島振興開発特別措置法によるみなし）は長大な適用
  判定であり、金額を伴わないため fee def を作らない（caller-established）。
* 原文に「既に」は 5 回出現する。百四十二の二（既に認定を受けている者を除く）、百四十三(二)
  （既に同号の予報の業務の許可を受けている者…を除く）、百四十四(一)（既に他の建設業について
  許可がされている場合…を除く）は適用判定であり caller-established。百四十五(一)(二) の
  括弧書 2 回のみが軽減額（政令で定めるものについては一万五千円）であり、軽減額の別 def は
  作らない。デーミング規定（金額が軽減される旨の定め）は本範囲にこれら 2 回のみ。
* 百三十九 以前・百五十二 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」
  「免許件数」の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百四十(一) 倉庫業法第三条（登録）の倉庫業者の登録の登録件数一件につきの額（固定 ¥90,000）。
    （注）の登録・変更登録とみなす規定の適用は caller-established。
 -/
def warehouseOperatorRegFee : Money := 90_000

/-- 百四十(二) 倉庫業法第七条第一項（変更登録等）の変更登録（倉庫の新設に係る変更登録で政令で定めるものに限る。）の倉庫の数一個につきの額（固定 ¥30,000）。
    「政令で定めるものに限る。」は caller-established。掛け算（個数）は caller。
 -/
def warehouseNewChangeRegFeePerUnit : Money := 30_000

/-- 百四十(三) 倉庫業法第二十五条（トランクルームの認定）の認定のトランクルームの数一個につきの額（固定 ¥10,000）。
    掛け算（個数）は caller。
 -/
def trunkRoomCertificationFeePerUnit : Money := 10_000

/-- 百四十一(一) 国際観光ホテル整備法第三条（ホテルの登録）のホテルの登録の登録件数一件につきの額（固定 ¥150,000）。
 -/
def hotelRegFee : Money := 150_000

/-- 百四十一(二) 国際観光ホテル整備法第十八条第一項（旅館の登録）の旅館の登録の登録件数一件につきの額（固定 ¥90,000）。
 -/
def ryokanRegFee : Money := 90_000

/-- 百四十一(三) 国際観光ホテル整備法第三条又は第十八条第一項の登録実施機関に係る登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def foreignGuestLodgingRegOrgRegFee : Money := 90_000

/-- 百四十一の二 通訳案内士法第三十条第一項（登録研修機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def nationalGuideTrainingOrgRegFee : Money := 90_000

/-- 百四十二(一) 旅行業法第三条（登録）又は第六条の四第一項（変更登録）の旅行業の登録又は変更登録（政令で定めるものに限り、更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「政令で定めるものに限り、更新の登録を除く。」および（注）のみなし規定の適用は caller-established。
 -/
def travelAgencyRegFee : Money := 90_000

/-- 百四十二(二) 旅行業法第三条の旅行業者代理業の登録（政令で定めるものに限る。）の登録件数一件につきの額（固定 ¥15,000）。
    「政令で定めるものに限る。」（注）のみなし規定の適用は caller-established。この一万五千円は軽減額ではなく主たる fee string である。
 -/
def travelAgencySubAgentRegFee : Money := 15_000

/-- 百四十二(三) 旅行業法第二十三条（登録）の旅行サービス手配業の登録（政令で定めるものに限る。）の登録件数一件につきの額（固定 ¥90,000）。
    「政令で定めるものに限る。」は caller-established。
 -/
def travelServiceArrangerRegFee : Money := 90_000

/-- 百四十二(四) 旅行業法第十二条の十一第一項（登録研修機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def travelAgencyTrainingOrgRegFee : Money := 90_000

/-- 百四十二(五) 旅行業法第二十八条第五項（登録研修機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def travelAgencyManagerTrainingOrgRegFee : Money := 90_000

/-- 百四十二の二 観光圏整備実施計画（同法第十条第一項（認定観光圏案内所）に規定するものに限る。）の認定（既に当該認定を受けている者が受けるものを除く。）の認定件数一件につきの額（固定 ¥15,000）。
    「既に当該認定を受けている者が受けるものを除く。」は caller-established。この一万五千円は軽減額ではなく主たる fee string である。
 -/
def tourismZoneGuideOfficePlanCertificationFee : Money := 15_000

/-- 百四十二の三(一) 住宅宿泊事業法第二十二条第一項（登録）の住宅宿泊管理業者の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def privateLodgingManagerRegFee : Money := 90_000

/-- 百四十二の三(二) 住宅宿泊事業法第四十六条第一項（登録）の住宅宿泊仲介業者の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def privateLodgingBrokerRegFee : Money := 90_000

/-- 百四十三(一) 気象業務法第十七条第一項（予報業務の許可）の予報業務の許可の許可件数一件につきの額（固定 ¥90,000）。
 -/
def weatherForecastBizPermitFee : Money := 90_000

/-- 百四十三(二) 気象業務法第十九条第一項（変更認可）の予報業務の範囲の変更の認可（新たに予報の業務を行うために受けるものに限り、既に許可を受けている者の一部は除く。）の認可件数一件につきの額（固定 ¥90,000）。
    「…に限り、…を除く。」は caller-established。
 -/
def weatherForecastScopeChangeApprovalFee : Money := 90_000

/-- 百四十三(三) 気象業務法第二十六条第一項（無線通信による資料の発表）の気象観測成果の無線通信による発表の業務の許可の許可件数一件につきの額（固定 ¥90,000）。
 -/
def weatherObservationWirelessBroadcastPermitFee : Money := 90_000

/-- 百四十三(四) 気象業務法第三十二条の二第一項（測定能力の認定）の認定測定者の認定の認定件数一件につきの額（固定 ¥90,000）。
 -/
def weatherInstrumentMeasurerCertificationFee : Money := 90_000

/-- 百四十三(五) 気象業務法第九条第一項（登録検定機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def weatherInstrumentInspectionOrgRegFee : Money := 90_000

/-- 百四十四(一)イ 建設業法第三条第一項第一号に掲げる者に係る同項の許可（更新の許可及び他の建設業について既に許可がされている場合における許可を除く。）の許可件数一件につきの額（固定 ¥150,000）。
    「更新の許可以外の除外」「区分ごとの一の許可とみなす」は caller-established。
 -/
def constructionBizPermitClass1Fee : Money := 150_000

/-- 百四十四(一)ロ 建設業法第三条第一項第二号に掲げる者に係る同項の許可（更新の許可及び他の建設業について既に許可がされている場合における許可を除く。）の許可件数一件につきの額（固定 ¥150,000）。
    「更新の許可以外の除外」「区分ごとの一の許可とみなす」は caller-established。
 -/
def constructionBizPermitClass2Fee : Money := 150_000

/-- 百四十四(二) 建設業法第二十六条第五項（講習の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def constructionEngineerTrainingRegFee : Money := 90_000

/-- 百四十四(三) 建設業法第二十七条の二十四第一項（登録経営状況分析機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def constructionBizAnalysisOrgRegFee : Money := 90_000

/-- 百四十五(一) 浄化槽法第十三条第一項（認定）の工場において製造する浄化槽の型式の認定（更新の認定を除く。）の認定件数一件につきの額（固定 ¥90,000）。
    「更新の認定を除く。」および括弧書の軽減額（既に…異なる場合で政令で定めるものについては一万五千円）は caller-established。軽減額の別 def は作らない。
 -/
def domesticSepticTankTypeCertificationFee : Money := 90_000

/-- 百四十五(二) 浄化槽法第十三条第二項の外国の工場において製造する浄化槽の型式の認定（更新の認定を除く。）の認定件数一件につきの額（固定 ¥90,000）。
    「更新の認定を除く。」および括弧書の軽減額（既に…異なる場合で政令で定めるものについては一万五千円）は caller-established。軽減額の別 def は作らない。
 -/
def foreignSepticTankTypeCertificationFee : Money := 90_000

/-- 百四十六(一) 不動産の鑑定評価に関する法律第二十二条第一項（不動産鑑定業者の登録）の国土交通大臣がする登録（更新の登録及び同法第十五条の不動産鑑定士が受ける登録を除く。）又は同法第二十六条第一項第二号（登録換え）の登録換えに係る登録（同法第十五条の不動産鑑定士が受ける登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録…を除く。」等は caller-established。
 -/
def realEstateAppraisalBizRegFee : Money := 90_000

/-- 百四十六(二) 不動産の鑑定評価に関する法律第十四条の二（実務修習機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def realEstateAppraisalTrainingOrgRegFee : Money := 90_000

/-- 百四十七(一) 宅地建物取引業法第三条第一項（免許）の国土交通大臣がする宅地建物取引業の免許（更新の免許を除く。）の免許件数一件につきの額（固定 ¥90,000）。
    「更新の免許を除く。」は caller-established。
 -/
def realEstateTransactionBizLicenseFee : Money := 90_000

/-- 百四十七(二) 宅地建物取引業法第十六条第三項（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def realEstateTransactionTrainingOrgRegFee : Money := 90_000

/-- 百四十八 積立式宅地建物販売業法第三条（積立式宅地建物販売業の許可）の国土交通大臣がする許可の許可件数一件につきの額（固定 ¥150,000）。
 -/
def installmentLandBuildingSalesBizPermitFee : Money := 150_000

/-- 百四十九 公共工事の前払金保証事業に関する法律第三条（登録）の前払金保証事業の登録の登録件数一件につきの額（固定 ¥150,000）。
 -/
def publicWorksAdvancePaymentGuaranteeBizRegFee : Money := 150_000

/-- 百五十(一) 不動産特定共同事業法第三条第一項（不動産特定共同事業の許可）の主務大臣がする不動産特定共同事業の許可の許可件数一件につきの額（固定 ¥150,000）。
 -/
def realEstateSpecificJointBizPermitFee : Money := 150_000

/-- 百五十(二) 不動産特定共同事業法第九条第一項（変更の認可）の変更の認可（同法第五条第一項第六号の不動産特定共同事業の種別の増加に係るものに限る。）の認可件数一件につきの額（固定 ¥30,000）。
    「…に限る。」は caller-established。
 -/
def realEstateSpecificJointBizTypeIncreaseApprovalFee : Money := 30_000

/-- 百五十(三) 不動産特定共同事業法第四十一条第一項（小規模不動産特定共同事業の登録）の主務大臣がする登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥150,000）。
    「更新の登録を除く。」は caller-established。
 -/
def smallRealEstateSpecificJointBizRegFee : Money := 150_000

/-- 百五十(四) 不動産特定共同事業法第四十六条第一項（変更の登録）の変更の登録（同法第四十二条第一項第六号の小規模不動産特定共同事業の種別の増加に係るものに限る。）の登録件数一件につきの額（固定 ¥30,000）。
    「…に限る。」は caller-established。
 -/
def smallRealEstateSpecificJointBizTypeIncreaseRegFee : Money := 30_000

/-- 百五十一(一) マンションの管理の適正化の推進に関する法律第四十四条第一項（登録）のマンション管理業者の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def condominiumManagerRegFee : Money := 90_000

/-- 百五十一(二) マンションの管理の適正化の推進に関する法律第四十一条（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def condominiumManagerTrainingOrgRegFee : Money := 90_000

/-- 百五十一(三) マンションの管理の適正化の推進に関する法律第六十条第二項（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def condominiumManagementStaffTrainingOrgRegFee : Money := 90_000

/-- 百五十一の二 賃貸住宅の管理業務等の適正化に関する法律第三条第一項（登録）の賃貸住宅管理業者の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。
 -/
def rentalHousingManagerRegFee : Money := 90_000


theorem warehouseOperatorRegFee_pos : warehouseOperatorRegFee > 0 := by decide
theorem warehouseNewChangeRegFeePerUnit_pos : warehouseNewChangeRegFeePerUnit > 0 := by decide
theorem trunkRoomCertificationFeePerUnit_pos : trunkRoomCertificationFeePerUnit > 0 := by decide
theorem hotelRegFee_pos : hotelRegFee > 0 := by decide
theorem ryokanRegFee_pos : ryokanRegFee > 0 := by decide
theorem foreignGuestLodgingRegOrgRegFee_pos : foreignGuestLodgingRegOrgRegFee > 0 := by decide
theorem nationalGuideTrainingOrgRegFee_pos : nationalGuideTrainingOrgRegFee > 0 := by decide
theorem travelAgencyRegFee_pos : travelAgencyRegFee > 0 := by decide
theorem travelAgencySubAgentRegFee_pos : travelAgencySubAgentRegFee > 0 := by decide
theorem travelServiceArrangerRegFee_pos : travelServiceArrangerRegFee > 0 := by decide
theorem travelAgencyTrainingOrgRegFee_pos : travelAgencyTrainingOrgRegFee > 0 := by decide
theorem travelAgencyManagerTrainingOrgRegFee_pos : travelAgencyManagerTrainingOrgRegFee > 0 := by decide
theorem tourismZoneGuideOfficePlanCertificationFee_pos : tourismZoneGuideOfficePlanCertificationFee > 0 := by decide
theorem privateLodgingManagerRegFee_pos : privateLodgingManagerRegFee > 0 := by decide
theorem privateLodgingBrokerRegFee_pos : privateLodgingBrokerRegFee > 0 := by decide
theorem weatherForecastBizPermitFee_pos : weatherForecastBizPermitFee > 0 := by decide
theorem weatherForecastScopeChangeApprovalFee_pos : weatherForecastScopeChangeApprovalFee > 0 := by decide
theorem weatherObservationWirelessBroadcastPermitFee_pos : weatherObservationWirelessBroadcastPermitFee > 0 := by decide
theorem weatherInstrumentMeasurerCertificationFee_pos : weatherInstrumentMeasurerCertificationFee > 0 := by decide
theorem weatherInstrumentInspectionOrgRegFee_pos : weatherInstrumentInspectionOrgRegFee > 0 := by decide
theorem constructionBizPermitClass1Fee_pos : constructionBizPermitClass1Fee > 0 := by decide
theorem constructionBizPermitClass2Fee_pos : constructionBizPermitClass2Fee > 0 := by decide
theorem constructionEngineerTrainingRegFee_pos : constructionEngineerTrainingRegFee > 0 := by decide
theorem constructionBizAnalysisOrgRegFee_pos : constructionBizAnalysisOrgRegFee > 0 := by decide
theorem domesticSepticTankTypeCertificationFee_pos : domesticSepticTankTypeCertificationFee > 0 := by decide
theorem foreignSepticTankTypeCertificationFee_pos : foreignSepticTankTypeCertificationFee > 0 := by decide
theorem realEstateAppraisalBizRegFee_pos : realEstateAppraisalBizRegFee > 0 := by decide
theorem realEstateAppraisalTrainingOrgRegFee_pos : realEstateAppraisalTrainingOrgRegFee > 0 := by decide
theorem realEstateTransactionBizLicenseFee_pos : realEstateTransactionBizLicenseFee > 0 := by decide
theorem realEstateTransactionTrainingOrgRegFee_pos : realEstateTransactionTrainingOrgRegFee > 0 := by decide
theorem installmentLandBuildingSalesBizPermitFee_pos : installmentLandBuildingSalesBizPermitFee > 0 := by decide
theorem publicWorksAdvancePaymentGuaranteeBizRegFee_pos : publicWorksAdvancePaymentGuaranteeBizRegFee > 0 := by decide
theorem realEstateSpecificJointBizPermitFee_pos : realEstateSpecificJointBizPermitFee > 0 := by decide
theorem realEstateSpecificJointBizTypeIncreaseApprovalFee_pos : realEstateSpecificJointBizTypeIncreaseApprovalFee > 0 := by decide
theorem smallRealEstateSpecificJointBizRegFee_pos : smallRealEstateSpecificJointBizRegFee > 0 := by decide
theorem smallRealEstateSpecificJointBizTypeIncreaseRegFee_pos : smallRealEstateSpecificJointBizTypeIncreaseRegFee > 0 := by decide
theorem condominiumManagerRegFee_pos : condominiumManagerRegFee > 0 := by decide
theorem condominiumManagerTrainingOrgRegFee_pos : condominiumManagerTrainingOrgRegFee > 0 := by decide
theorem condominiumManagementStaffTrainingOrgRegFee_pos : condominiumManagementStaffTrainingOrgRegFee > 0 := by decide
theorem rentalHousingManagerRegFee_pos : rentalHousingManagerRegFee > 0 := by decide

example : warehouseOperatorRegFee = 90_000 := by decide
example : warehouseNewChangeRegFeePerUnit = 30_000 := by decide
example : trunkRoomCertificationFeePerUnit = 10_000 := by decide
example : hotelRegFee = 150_000 := by decide
example : ryokanRegFee = 90_000 := by decide
example : foreignGuestLodgingRegOrgRegFee = 90_000 := by decide
example : nationalGuideTrainingOrgRegFee = 90_000 := by decide
example : travelAgencyRegFee = 90_000 := by decide
example : travelAgencySubAgentRegFee = 15_000 := by decide
example : travelServiceArrangerRegFee = 90_000 := by decide
example : travelAgencyTrainingOrgRegFee = 90_000 := by decide
example : travelAgencyManagerTrainingOrgRegFee = 90_000 := by decide
example : tourismZoneGuideOfficePlanCertificationFee = 15_000 := by decide
example : privateLodgingManagerRegFee = 90_000 := by decide
example : privateLodgingBrokerRegFee = 90_000 := by decide
example : weatherForecastBizPermitFee = 90_000 := by decide
example : weatherForecastScopeChangeApprovalFee = 90_000 := by decide
example : weatherObservationWirelessBroadcastPermitFee = 90_000 := by decide
example : weatherInstrumentMeasurerCertificationFee = 90_000 := by decide
example : weatherInstrumentInspectionOrgRegFee = 90_000 := by decide
example : constructionBizPermitClass1Fee = 150_000 := by decide
example : constructionBizPermitClass2Fee = 150_000 := by decide
example : constructionEngineerTrainingRegFee = 90_000 := by decide
example : constructionBizAnalysisOrgRegFee = 90_000 := by decide
example : domesticSepticTankTypeCertificationFee = 90_000 := by decide
example : foreignSepticTankTypeCertificationFee = 90_000 := by decide
example : realEstateAppraisalBizRegFee = 90_000 := by decide
example : realEstateAppraisalTrainingOrgRegFee = 90_000 := by decide
example : realEstateTransactionBizLicenseFee = 90_000 := by decide
example : realEstateTransactionTrainingOrgRegFee = 90_000 := by decide
example : installmentLandBuildingSalesBizPermitFee = 150_000 := by decide
example : publicWorksAdvancePaymentGuaranteeBizRegFee = 150_000 := by decide
example : realEstateSpecificJointBizPermitFee = 150_000 := by decide
example : realEstateSpecificJointBizTypeIncreaseApprovalFee = 30_000 := by decide
example : smallRealEstateSpecificJointBizRegFee = 150_000 := by decide
example : smallRealEstateSpecificJointBizTypeIncreaseRegFee = 30_000 := by decide
example : condominiumManagerRegFee = 90_000 := by decide
example : condominiumManagerTrainingOrgRegFee = 90_000 := by decide
example : condominiumManagementStaffTrainingOrgRegFee = 90_000 := by decide
example : rentalHousingManagerRegFee = 90_000 := by decide

end JapanTaxLaw
