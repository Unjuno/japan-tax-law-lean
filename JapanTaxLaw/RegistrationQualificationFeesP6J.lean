import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP6J — 登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九 の flat fee モデル (W-J)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_125_129.txt（百二十五〜百二十九、UTF-8）

Models 別表第一（二）第三十二号 の 百二十五〜百二十九 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 19 箇所で、
割合（千分の△）は本範囲に存在しない。全 19 件を一件につきの固定額としてモデル化する。

  百二十五(一)イ 一般乗合／一般貸切旅客自動車運送事業の許可 ...... 九万円   → ¥90,000
  百二十五(一)ロ 一般乗用旅客自動車運送事業の許可 ............... 三万円   → ¥30,000
  百二十五(二)イ 路線・営業区域増加の事業計画変更認可 ............ 一万五千円 → ¥15,000
  百二十五(二)ロ 営業区域増加の事業計画変更認可 ................. 五千円   → ¥5,000
  百二十五(二)ハ 準特定地域の供給輸送力増加の事業計画変更認可 .... 五千円   → ¥5,000
  百二十五(三) 特定旅客自動車運送事業の許可 ................... 三万円   → ¥30,000
  百二十五(四) 一般貨物自動車運送事業の許可 ................... 十二万円 → ¥120,000
  百二十五(五) 特定貨物自動車運送事業の許可 ................... 六万円   → ¥60,000
  百二十五(六) 登録貨物軽自動車安全管理者講習機関の登録 ........ 九万円   → ¥90,000
  百二十五(七) 登録貨物軽自動車安全管理者定期講習機関の登録 .... 九万円   → ¥90,000
  百二十五の二 タクシー運転者に係る登録実施機関の登録 .......... 九万円   → ¥90,000
  百二十五の三(一) 自家用有償旅客運送者の登録 ................. 一万五千円 → ¥15,000
  百二十五の三(二) 自家用有償旅客運送者の変更登録 ............. 三千円   → ¥3,000
  百二十六 自家用自動車の有償貸渡しの許可 ..................... 九万円   → ¥90,000
  百二十七 運河開設の免許 ................................... 十五万円 → ¥150,000
  百二十七の二 港湾の技術基準対象施設に係る登録確認機関の登録 ... 九万円   → ¥90,000
  百二十八(一) 船舶の製造・修繕に係る施設の新設等の許可 ........ 十五万円 → ¥150,000
  百二十八(二) 船舶の製造・修繕に必要な設備の新設等の許可 ...... 三万円   → ¥30,000
  百二十九 小型船造船業者の登録 ............................. 九万円   → ¥90,000

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可・許可・免許の要件・適用は
  caller-established とし、ここではモデル化しない。
* 「政令で定めるものに限る」「政令で定めるものを除く」「更新の登録を除く」「更新の許可を除く」
  等の適用判定は caller-established とし、金額定数には反映しない（Bool を式に入れていない）。
* 百二十五(一)ロ 括弧内の「個人の受ける一般乗用旅客自動車運送事業の許可で政令で定めるものに
  ついては、一万五千円」は軽減額の例外であり「一件につき」の主たる fee string ではないため、
  別 def を作らない（caller-established の軽減例外として扱う）。
* 百二十五・百二十五の三・百二十八の（注）に定めるみなし規定（各種計画の認定等を許可等と
  みなす）は適用判定であり、金額定数には反映しない（caller-established）。
* デーミング規定・金額なし行は本範囲に存在しない（原文に「既に」は 0 回）。全 19 行を fee def 化。
* 百二十四 以前・百三十 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」
  「免許件数」「申請件数」の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百二十五（一）イ 道路運送法第四条第一項（一般旅客自動車運送事業の許可）の許可のうち
    一般乗合旅客自動車運送事業の許可又は一般貸切旅客自動車運送事業の許可（更新の許可を除く。）の
    許可件数一件につきの額（固定 ¥90,000）。「更新の許可を除く。」は caller-established。 -/
def generalRouteCharterPassengerTransportPermitFee : Money := 90_000

/-- 百二十五（一）ロ 道路運送法第四条第一項の一般乗用旅客自動車運送事業の許可の
    許可件数一件につきの額（固定 ¥30,000）。括弧内の「個人の受ける…政令で定めるものについては、
    一万五千円」は軽減例外（caller-established、別 def なし）。 -/
def generalPassengerCarTransportPermitFee : Money := 30_000

/-- 百二十五（二）イ （一）イに掲げる許可を受けている者が路線又は営業区域を増加することに
    係る事業計画の変更の認可で財務省令で定めるものの認可件数一件につきの額（固定 ¥15,000）。
    「財務省令で定めるもの」は caller-established。 -/
def routeAreaIncreasePlanChangeApprovalFee : Money := 15_000

/-- 百二十五（二）ロ （一）ロに掲げる許可（政令で定めるものを除く。）を受けている者が営業区域を
    増加することに係る事業計画の変更の認可で財務省令で定めるものの認可件数一件につきの額
    （固定 ¥5,000）。政令で定めるものの除外・財務省令で定めるものは caller-established。 -/
def businessAreaIncreasePlanChangeApprovalFee : Money := 5_000

/-- 百二十五（二）ハ （一）ロに掲げる許可を受けている者が準特定地域における一般乗用旅客自動車
    運送事業の供給輸送力を増加させる事業計画の変更の認可で財務省令で定めるものの認可件数一件に
    つきの額（固定 ¥5,000）。「財務省令で定めるもの」は caller-established。 -/
def semiSpecificAreaCapacityIncreasePlanChangeApprovalFee : Money := 5_000

/-- 百二十五（三） 道路運送法第四十三条第一項（特定旅客自動車運送事業）の特定旅客自動車
    運送事業の許可の許可件数一件につきの額（固定 ¥30,000）。 -/
def specifiedPassengerTransportBizPermitFee : Money := 30_000

/-- 百二十五（四） 貨物自動車運送事業法第三条（一般貨物自動車運送事業の許可）の一般貨物自動車
    運送事業の許可の許可件数一件につきの額（固定 ¥120,000）。 -/
def generalFreightTransportBizPermitFee : Money := 120_000

/-- 百二十五（五） 貨物自動車運送事業法第三十五条第一項（特定貨物自動車運送事業）の特定貨物
    自動車運送事業の許可の許可件数一件につきの額（固定 ¥60,000）。 -/
def specifiedFreightTransportBizPermitFee : Money := 60_000

/-- 百二十五（六） 貨物自動車運送事業法第五十八条の二（登録貨物軽自動車安全管理者講習機関の
    登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredLightFreightSafetyInstructorTrainingOrgRegFee : Money := 90_000

/-- 百二十五（七） 貨物自動車運送事業法第五十八条の十六第一項（登録貨物軽自動車安全管理者定期
    講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee : Money := 90_000

/-- 百二十五の二 タクシー業務適正化特別措置法第十九条第一項（登録実施機関の登録）のタクシーの
    運転者に係る登録実施機関の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def taxiDriverRegistrationOrgRegFee : Money := 90_000

/-- 百二十五の三（一） 道路運送法第七十九条（登録）の自家用有償旅客運送者の登録（政令で定める
    ものに限り、更新の登録を除く。）の登録件数一件につきの額（固定 ¥15,000）。
    「政令で定めるものに限り」「更新の登録を除く。」は caller-established。 -/
def privatePaidPassengerTransportRegFee : Money := 15_000

/-- 百二十五の三（二） 道路運送法第七十九条の七第一項（変更登録等）の変更登録（政令で定めるものに
    限る。）の登録件数一件につきの額（固定 ¥3,000）。「政令で定めるものに限る。」は
    caller-established。 -/
def privatePaidPassengerTransportChangeRegFee : Money := 3_000

/-- 百二十六 道路運送法第八十条第一項（有償貸渡し）の自家用自動車の貸渡しの事業の許可（政令で
    定めるものを除く。）の許可件数一件につきの額（固定 ¥90,000）。
    「政令で定めるものを除く。」は caller-established。 -/
def privateCarPaidLoanPermitFee : Money := 90_000

/-- 百二十七 運河法第一条（免許）の規定による運河の開設の免許の免許件数一件につきの額
    （固定 ¥150,000）。 -/
def canalConstructionLicenseFee : Money := 150_000

/-- 百二十七の二 港湾法第五十六条の二の二第三項（登録確認機関の登録）の港湾の技術基準対象施設に
    係る登録確認機関の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def portTechnicalStandardVerificationOrgRegFee : Money := 90_000

/-- 百二十八（一） 造船法第二条第一項（施設の新設等の許可等）の船舶の製造又は修繕に係る施設の
    新設、譲受け又は借受けの許可（一部の例外を除く。）の許可件数一件につきの額（固定 ¥150,000）。
    括弧内の適用除外は caller-established。 -/
def shipMfgRepairFacilityNewPermitFee : Money := 150_000

/-- 百二十八（二） 造船法第三条第一項（設備の新設等の許可等）の船舶の製造又は修繕に必要な設備の
    新設、増設又は拡張の許可（一部の例外を除く。）の許可件数一件につきの額（固定 ¥30,000）。
    括弧内の適用除外は caller-established。 -/
def shipMfgRepairEquipmentExpansionPermitFee : Money := 30_000

/-- 百二十九 小型船造船業法第四条（登録）の規定による小型船造船業者の登録の登録件数一件につきの額
    （固定 ¥90,000）。 -/
def smallVesselShipbuilderRegFee : Money := 90_000

theorem generalRouteCharterPassengerTransportPermitFee_pos :
    generalRouteCharterPassengerTransportPermitFee > 0 := by decide
theorem generalPassengerCarTransportPermitFee_pos :
    generalPassengerCarTransportPermitFee > 0 := by decide
theorem routeAreaIncreasePlanChangeApprovalFee_pos :
    routeAreaIncreasePlanChangeApprovalFee > 0 := by decide
theorem businessAreaIncreasePlanChangeApprovalFee_pos :
    businessAreaIncreasePlanChangeApprovalFee > 0 := by decide
theorem semiSpecificAreaCapacityIncreasePlanChangeApprovalFee_pos :
    semiSpecificAreaCapacityIncreasePlanChangeApprovalFee > 0 := by decide
theorem specifiedPassengerTransportBizPermitFee_pos :
    specifiedPassengerTransportBizPermitFee > 0 := by decide
theorem generalFreightTransportBizPermitFee_pos :
    generalFreightTransportBizPermitFee > 0 := by decide
theorem specifiedFreightTransportBizPermitFee_pos :
    specifiedFreightTransportBizPermitFee > 0 := by decide
theorem registeredLightFreightSafetyInstructorTrainingOrgRegFee_pos :
    registeredLightFreightSafetyInstructorTrainingOrgRegFee > 0 := by decide
theorem registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee_pos :
    registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee > 0 := by decide
theorem taxiDriverRegistrationOrgRegFee_pos :
    taxiDriverRegistrationOrgRegFee > 0 := by decide
theorem privatePaidPassengerTransportRegFee_pos :
    privatePaidPassengerTransportRegFee > 0 := by decide
theorem privatePaidPassengerTransportChangeRegFee_pos :
    privatePaidPassengerTransportChangeRegFee > 0 := by decide
theorem privateCarPaidLoanPermitFee_pos :
    privateCarPaidLoanPermitFee > 0 := by decide
theorem canalConstructionLicenseFee_pos :
    canalConstructionLicenseFee > 0 := by decide
theorem portTechnicalStandardVerificationOrgRegFee_pos :
    portTechnicalStandardVerificationOrgRegFee > 0 := by decide
theorem shipMfgRepairFacilityNewPermitFee_pos :
    shipMfgRepairFacilityNewPermitFee > 0 := by decide
theorem shipMfgRepairEquipmentExpansionPermitFee_pos :
    shipMfgRepairEquipmentExpansionPermitFee > 0 := by decide
theorem smallVesselShipbuilderRegFee_pos :
    smallVesselShipbuilderRegFee > 0 := by decide

example : generalRouteCharterPassengerTransportPermitFee = 90_000 := by decide
example : generalPassengerCarTransportPermitFee = 30_000 := by decide
example : routeAreaIncreasePlanChangeApprovalFee = 15_000 := by decide
example : businessAreaIncreasePlanChangeApprovalFee = 5_000 := by decide
example : semiSpecificAreaCapacityIncreasePlanChangeApprovalFee = 5_000 := by decide
example : specifiedPassengerTransportBizPermitFee = 30_000 := by decide
example : generalFreightTransportBizPermitFee = 120_000 := by decide
example : specifiedFreightTransportBizPermitFee = 60_000 := by decide
example : registeredLightFreightSafetyInstructorTrainingOrgRegFee = 90_000 := by decide
example : registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee = 90_000 := by decide
example : taxiDriverRegistrationOrgRegFee = 90_000 := by decide
example : privatePaidPassengerTransportRegFee = 15_000 := by decide
example : privatePaidPassengerTransportChangeRegFee = 3_000 := by decide
example : privateCarPaidLoanPermitFee = 90_000 := by decide
example : canalConstructionLicenseFee = 150_000 := by decide
example : portTechnicalStandardVerificationOrgRegFee = 90_000 := by decide
example : shipMfgRepairFacilityNewPermitFee = 150_000 := by decide
example : shipMfgRepairEquipmentExpansionPermitFee = 30_000 := by decide
example : smallVesselShipbuilderRegFee = 90_000 := by decide

end JapanTaxLaw
