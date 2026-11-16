import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP7L — 登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九 の flat fee モデル (W-L)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_135_139.txt（百三十五〜百三十九、UTF-8）

Models 別表第一（二）第三十二号 の 百三十五〜百三十九 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 33 箇所で、
割合（千分の△）は本範囲に存在しない。全 33 件を一件につきの固定額としてモデル化する。

  百三十五 内航海運業の登録 .................................... 九万円   → ¥90,000
  百三十六(一)〜(八) 船舶職員及び小型船舶操縦者法等による登録 .... 8×九万円 → ¥90,000
  百三十六の二(一)(二) 水先人に係る登録 .......................... 2×九万円 → ¥90,000
  百三十七 船員派遣事業の許可 .................................. 九万円   → ¥90,000
  百三十七の二(一)〜(三) 船員法による登録 ....................... 3×九万円 → ¥90,000
  百三十八(一)イ 空港等の設置の許可 ............................ 十五万円 → ¥150,000
  百三十八(一)ロ 航空保安施設の設置の許可 ...................... 九万円   → ¥90,000
  百三十八(二) 事業場の認定 .................................... 九万円   → ¥90,000
  百三十八(三) 航空運送事業の許可 .............................. 十五万円 → ¥150,000
  百三十八(四) 航空機使用事業の許可 ............................ 九万円   → ¥90,000
  百三十八(五) 外国人国際航空運送事業の許可 .................... 十五万円 → ¥150,000
  百三十八(六) 登録訓練機関の登録 .............................. 九万円   → ¥90,000
  百三十八の二(一)〜(三) 無人航空機検査・操縦者技能証明に係る登録 3×九万円 → ¥90,000
  百三十九(一) 第一種貨物利用運送事業の登録 .................... 九万円   → ¥90,000
  百三十九(二) 変更登録（利用運送の増加等） .................... 一万五千円 → ¥15,000
  百三十九(三) 第二種貨物利用運送事業の許可 .................... 十二万円 → ¥120,000
  百三十九(四) 事業計画の変更の認可 ............................ 二万円   → ¥20,000
  百三十九(五) 国際貨物運送に係る第一種...の登録 ............... 九万円   → ¥90,000
  百三十九(六) 変更登録（利用運送の区間・業務範囲の増加） ...... 一万五千円 → ¥15,000
  百三十九(七) 国際貨物運送に係る第二種...の許可 ............... 十二万円 → ¥120,000
  百三十九(八) 事業計画の変更の認可 ............................ 二万円   → ¥20,000

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可の要件・適用は
  caller-established とし、ここではモデル化しない。
* 「第三十二号に掲げるものを除く」「更新の登録を除く」「更新の許可を除く」
  「財務省令で定めるものに限る／除く」等の適用判定は caller-established とし、金額定数には
  反映しない（Bool を式に入れていない）。軽減額の別 def も作らない。
* 百三十七・百三十九の（注）のみなし規定（各種計画の認定等を許可・登録とみなす）は
  適用判定であり、金額定数には反映しない（caller-established）。
* 百三十九(二)(六) の「一万五千円」は変更登録の主たる fee string であり軽減額ではない。
  デーミング規定・金額なし行は本範囲に存在しない（原文に「既に」は 0 回）。全 33 行を fee def 化。
* 百三十四 以前・百四十 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」
  の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百三十五 内航海運業法第三条第一項（登録）の内航海運業の登録の登録件数一件につきの額
    （固定 ¥90,000）。 -/
def domesticCoastalShippingBizRegFee : Money := 90_000

/-- 百三十六(一) 船舶職員及び小型船舶操縦者法第四条第二項（海技免許講習の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「第三十二号に掲げるものを除く」「更新の登録を除く。」は caller-established。 -/
def maritimeOfficerLicenseTrainingCourseRegFee : Money := 90_000

/-- 百三十六(二) 船舶職員及び小型船舶操縦者法第七条の二第三項第三号（海技免状更新講習の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def maritimeLicenseRenewalTrainingCourseRegFee : Money := 90_000

/-- 百三十六(三) 船舶職員及び小型船舶操縦者法第十三条の二第一項（登録船舶職員養成施設の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredSeafarerTrainingFacilityRegFee : Money := 90_000

/-- 百三十六(四) 船舶職員及び小型船舶操縦者法第二十二条の四（登録漁ろう操船講習機関の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredFishingOperationTrainingOrgRegFee : Money := 90_000

/-- 百三十六(五) 船舶職員及び小型船舶操縦者法第二十三条の十第一項（登録小型船舶教習所の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredSmallVesselTrainingSchoolRegFee : Money := 90_000

/-- 百三十六(六) 船舶職員及び小型船舶操縦者法第二十三条の十一（操縦免許証更新講習の登録）に
    おいて準用する同法第七条の二第三項第三号の登録（更新の登録を除く。）の登録件数一件につきの額
    （固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def operationLicenseRenewalTrainingCourseRegFee : Money := 90_000

/-- 百三十六(七) 船舶職員及び小型船舶操縦者法第二十三条の二十五（登録特定操縦免許講習機関の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredSpecificOperationLicenseTrainingOrgRegFee : Money := 90_000

/-- 百三十六(八) 船舶安全法及び船舶職員法の一部を改正する法律附則第三条（電子通信移行講習の登録）の
    登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def electronicCommunicationTransitionTrainingRegFee : Money := 90_000

/-- 百三十六の二(一) 水先法第五条第一項第二号（登録水先人養成施設の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredPilotTrainingFacilityRegFee : Money := 90_000

/-- 百三十六の二(二) 水先法第十条第三項（水先免許更新講習の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def pilotLicenseRenewalTrainingRegFee : Money := 90_000

/-- 百三十七 船員職業安定法第五十五条第一項（船員派遣事業の許可）の船員派遣事業の許可
    （更新の許可を除く。）の許可件数一件につきの額（固定 ¥90,000）。
    （注）のみなし規定（日本船舶・船員確保計画の認定を許可とみなす）および
    「更新の許可を除く。」は caller-established。 -/
def crewDispatchBizPermitFee : Money := 90_000

/-- 百三十七の二(一) 船員法第八十三条の二（登録生存講習機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredSurvivalTrainingOrgRegFee : Money := 90_000

/-- 百三十七の二(二) 船員法第八十三条の十七（登録消火講習機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredFireFightingTrainingOrgRegFee : Money := 90_000

/-- 百三十七の二(三) 船員法第百条の二第一項（登録検査機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredInspectionOrgRegFee : Money := 90_000

/-- 百三十八(一)イ 航空法第三十八条第一項の空港等の設置の許可の許可件数一件につきの額
    （固定 ¥150,000）。 -/
def airportInstallationPermitFee : Money := 150_000

/-- 百三十八(一)ロ 航空法第三十八条第一項の航空保安施設の設置の許可の許可件数一件につきの額
    （固定 ¥90,000）。 -/
def aviationSecurityFacilityInstallationPermitFee : Money := 90_000

/-- 百三十八(二) 航空法第二十条第一項（事業場の認定）の事業場の認定（財務省令で定めるものを
    除く。）の認定件数一件につきの額（固定 ¥90,000）。
    「第三十二号及び次号に掲げるものを除く」「財務省令で定めるものを除く」は caller-established。 -/
def businessFacilityCertificationFee : Money := 90_000

/-- 百三十八(三) 航空法第百条第一項（許可）の航空運送事業の許可の許可件数一件につきの額
    （固定 ¥150,000）。 -/
def airTransportBizPermitFee : Money := 150_000

/-- 百三十八(四) 航空法第百二十三条第一項（航空機使用事業の許可）の航空機使用事業の許可の
    許可件数一件につきの額（固定 ¥90,000）。 -/
def aircraftOperationBizPermitFee : Money := 90_000

/-- 百三十八(五) 航空法第百二十九条第一項（外国人国際航空運送事業）の規定による旅客又は貨物を
    運送する事業の許可の許可件数一件につきの額（固定 ¥150,000）。 -/
def foreignInternationalAirTransportBizPermitFee : Money := 150_000

/-- 百三十八(六) 航空法第九十九条の二（登録訓練機関の登録）の登録訓練機関の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredTrainingOrgRegFee : Money := 90_000

/-- 百三十八の二(一) 航空法第百三十二条の二十四（登録検査機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def uavInspectionOrgRegFee : Money := 90_000

/-- 百三十八の二(二) 航空法第百三十二条の六十九（登録講習機関の登録）の登録講習機関の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def uavOperationTrainingOrgRegFee : Money := 90_000

/-- 百三十八の二(三) 航空法第百三十二条の八十二（登録更新講習機関の登録）の登録更新講習機関の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def uavOperationRenewalTrainingOrgRegFee : Money := 90_000

/-- 百三十九(一) 貨物利用運送事業法第三条第一項（登録）の第一種貨物利用運送事業の登録の
    登録件数一件につきの額（固定 ¥90,000）。 -/
def firstClassFreightForwardingBizRegFee : Money := 90_000

/-- 百三十九(二) 貨物利用運送事業法第七条第一項（変更登録等）の変更登録（同法第四条第一項第四号の
    利用運送に係る運送機関の種類若しくは区域若しくは区間の増加（財務省令で定めるものに限る。）
    又は業務の範囲の増加に係るものに限る。）の登録件数一件につきの額（固定 ¥15,000）。
    「財務省令で定めるものに限る。」等の該当性は caller-established。
    この一万五千円は軽減額ではなく変更登録の主たる fee string である。 -/
def freightForwardingChangeRegFee : Money := 15_000

/-- 百三十九(三) 貨物利用運送事業法第二十条（許可）の第二種貨物利用運送事業の許可の
    許可件数一件につきの額（固定 ¥120,000）。 -/
def secondClassFreightForwardingBizPermitFee : Money := 120_000

/-- 百三十九(四) 貨物利用運送事業法第二十五条第一項の事業計画の変更の認可（財務省令で定める
    ものに限る。）の認可件数一件につきの額（固定 ¥20,000）。
    「財務省令で定めるものに限る。」は caller-established。 -/
def freightForwardingPlanChangeApprovalFee : Money := 20_000

/-- 百三十九(五) 貨物利用運送事業法第三十五条第一項（登録）の船舶運航事業者又は航空運送事業者の
    行う国際貨物運送に係る第一種貨物利用運送事業の登録の登録件数一件につきの額（固定 ¥90,000）。 -/
def internationalFreightFirstClassRegFee : Money := 90_000

/-- 百三十九(六) 貨物利用運送事業法第三十九条第一項（変更登録等）の変更登録（同法第四条第一項
    第四号の利用運送の区間又は業務の範囲の増加に係るものに限る。）の登録件数一件につきの額
    （固定 ¥15,000）。適用判定は caller-established。この一万五千円は軽減額ではなく主たる
    fee string である。 -/
def internationalFreightChangeRegFee : Money := 15_000

/-- 百三十九(七) 貨物利用運送事業法第四十五条第一項（許可）の船舶運航事業者又は航空運送事業者の
    行う国際貨物運送に係る第二種貨物利用運送事業の許可の許可件数一件につきの額
    （固定 ¥120,000）。 -/
def internationalFreightSecondClassPermitFee : Money := 120_000

/-- 百三十九(八) 貨物利用運送事業法第四十六条第二項（事業計画）の事業計画の変更の認可
    （財務省令で定めるものに限る。）の認可件数一件につきの額（固定 ¥20,000）。
    「財務省令で定めるものに限る。」は caller-established。 -/
def internationalFreightPlanChangeApprovalFee : Money := 20_000

theorem domesticCoastalShippingBizRegFee_pos :
    domesticCoastalShippingBizRegFee > 0 := by decide
theorem maritimeOfficerLicenseTrainingCourseRegFee_pos :
    maritimeOfficerLicenseTrainingCourseRegFee > 0 := by decide
theorem maritimeLicenseRenewalTrainingCourseRegFee_pos :
    maritimeLicenseRenewalTrainingCourseRegFee > 0 := by decide
theorem registeredSeafarerTrainingFacilityRegFee_pos :
    registeredSeafarerTrainingFacilityRegFee > 0 := by decide
theorem registeredFishingOperationTrainingOrgRegFee_pos :
    registeredFishingOperationTrainingOrgRegFee > 0 := by decide
theorem registeredSmallVesselTrainingSchoolRegFee_pos :
    registeredSmallVesselTrainingSchoolRegFee > 0 := by decide
theorem operationLicenseRenewalTrainingCourseRegFee_pos :
    operationLicenseRenewalTrainingCourseRegFee > 0 := by decide
theorem registeredSpecificOperationLicenseTrainingOrgRegFee_pos :
    registeredSpecificOperationLicenseTrainingOrgRegFee > 0 := by decide
theorem electronicCommunicationTransitionTrainingRegFee_pos :
    electronicCommunicationTransitionTrainingRegFee > 0 := by decide
theorem registeredPilotTrainingFacilityRegFee_pos :
    registeredPilotTrainingFacilityRegFee > 0 := by decide
theorem pilotLicenseRenewalTrainingRegFee_pos :
    pilotLicenseRenewalTrainingRegFee > 0 := by decide
theorem crewDispatchBizPermitFee_pos :
    crewDispatchBizPermitFee > 0 := by decide
theorem registeredSurvivalTrainingOrgRegFee_pos :
    registeredSurvivalTrainingOrgRegFee > 0 := by decide
theorem registeredFireFightingTrainingOrgRegFee_pos :
    registeredFireFightingTrainingOrgRegFee > 0 := by decide
theorem registeredInspectionOrgRegFee_pos :
    registeredInspectionOrgRegFee > 0 := by decide
theorem airportInstallationPermitFee_pos :
    airportInstallationPermitFee > 0 := by decide
theorem aviationSecurityFacilityInstallationPermitFee_pos :
    aviationSecurityFacilityInstallationPermitFee > 0 := by decide
theorem businessFacilityCertificationFee_pos :
    businessFacilityCertificationFee > 0 := by decide
theorem airTransportBizPermitFee_pos :
    airTransportBizPermitFee > 0 := by decide
theorem aircraftOperationBizPermitFee_pos :
    aircraftOperationBizPermitFee > 0 := by decide
theorem foreignInternationalAirTransportBizPermitFee_pos :
    foreignInternationalAirTransportBizPermitFee > 0 := by decide
theorem registeredTrainingOrgRegFee_pos :
    registeredTrainingOrgRegFee > 0 := by decide
theorem uavInspectionOrgRegFee_pos :
    uavInspectionOrgRegFee > 0 := by decide
theorem uavOperationTrainingOrgRegFee_pos :
    uavOperationTrainingOrgRegFee > 0 := by decide
theorem uavOperationRenewalTrainingOrgRegFee_pos :
    uavOperationRenewalTrainingOrgRegFee > 0 := by decide
theorem firstClassFreightForwardingBizRegFee_pos :
    firstClassFreightForwardingBizRegFee > 0 := by decide
theorem freightForwardingChangeRegFee_pos :
    freightForwardingChangeRegFee > 0 := by decide
theorem secondClassFreightForwardingBizPermitFee_pos :
    secondClassFreightForwardingBizPermitFee > 0 := by decide
theorem freightForwardingPlanChangeApprovalFee_pos :
    freightForwardingPlanChangeApprovalFee > 0 := by decide
theorem internationalFreightFirstClassRegFee_pos :
    internationalFreightFirstClassRegFee > 0 := by decide
theorem internationalFreightChangeRegFee_pos :
    internationalFreightChangeRegFee > 0 := by decide
theorem internationalFreightSecondClassPermitFee_pos :
    internationalFreightSecondClassPermitFee > 0 := by decide
theorem internationalFreightPlanChangeApprovalFee_pos :
    internationalFreightPlanChangeApprovalFee > 0 := by decide

example : domesticCoastalShippingBizRegFee = 90_000 := by decide
example : maritimeOfficerLicenseTrainingCourseRegFee = 90_000 := by decide
example : maritimeLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
example : registeredSeafarerTrainingFacilityRegFee = 90_000 := by decide
example : registeredFishingOperationTrainingOrgRegFee = 90_000 := by decide
example : registeredSmallVesselTrainingSchoolRegFee = 90_000 := by decide
example : operationLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
example : registeredSpecificOperationLicenseTrainingOrgRegFee = 90_000 := by decide
example : electronicCommunicationTransitionTrainingRegFee = 90_000 := by decide
example : registeredPilotTrainingFacilityRegFee = 90_000 := by decide
example : pilotLicenseRenewalTrainingRegFee = 90_000 := by decide
example : crewDispatchBizPermitFee = 90_000 := by decide
example : registeredSurvivalTrainingOrgRegFee = 90_000 := by decide
example : registeredFireFightingTrainingOrgRegFee = 90_000 := by decide
example : registeredInspectionOrgRegFee = 90_000 := by decide
example : airportInstallationPermitFee = 150_000 := by decide
example : aviationSecurityFacilityInstallationPermitFee = 90_000 := by decide
example : businessFacilityCertificationFee = 90_000 := by decide
example : airTransportBizPermitFee = 150_000 := by decide
example : aircraftOperationBizPermitFee = 90_000 := by decide
example : foreignInternationalAirTransportBizPermitFee = 150_000 := by decide
example : registeredTrainingOrgRegFee = 90_000 := by decide
example : uavInspectionOrgRegFee = 90_000 := by decide
example : uavOperationTrainingOrgRegFee = 90_000 := by decide
example : uavOperationRenewalTrainingOrgRegFee = 90_000 := by decide
example : firstClassFreightForwardingBizRegFee = 90_000 := by decide
example : freightForwardingChangeRegFee = 15_000 := by decide
example : secondClassFreightForwardingBizPermitFee = 120_000 := by decide
example : freightForwardingPlanChangeApprovalFee = 20_000 := by decide
example : internationalFreightFirstClassRegFee = 90_000 := by decide
example : internationalFreightChangeRegFee = 15_000 := by decide
example : internationalFreightSecondClassPermitFee = 120_000 := by decide
example : internationalFreightPlanChangeApprovalFee = 20_000 := by decide

end JapanTaxLaw
