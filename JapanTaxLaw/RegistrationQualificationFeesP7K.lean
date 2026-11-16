import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP7K — 登録免許税法 別表第一（二）第三十二号 百三十〜百三十四 の flat fee モデル (W-K)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_130_134.txt（百三十〜百三十四、UTF-8、3,894 文字、
  正規化後 3,854 文字）

Models 別表第一（二）第三十二号 の 百三十〜百三十四 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 33 箇所で、
割合（千分の△）は本範囲に存在しない。全 33 件を一件につきの固定額としてモデル化する。

  百三十(一) 船舶安全法第六条ノ二 製造・改造修理工事の事業場の認定 ... 九万円   → ¥90,000
  百三十(二) 船舶安全法第六条ノ三 整備の事業場の認定 ................ 九万円   → ¥90,000
  百三十(三) 船舶安全法第六条ノ四第一項 遠隔支援業務の事業場の認定 .. 九万円   → ¥90,000
  百三十(四) 船舶安全法第六条ノ五第一項 登録検定機関の登録 .......... 九万円   → ¥90,000
  百三十(五) 船舶安全法第六条ノ六 登録検査確認機関の登録 ............ 九万円   → ¥90,000
  百三十(六) 船舶安全法第八条 船級協会の登録 ....................... 九万円   → ¥90,000
  百三十(七) 船舶安全法第二十八条第五項 登録検査機関の登録 .......... 九万円   → ¥90,000
  百三十(八) 船舶安全法第二十九条ノ三第二項 証書発給船級協会の登録 .. 九万円   → ¥90,000
  百三十一(一) 海洋汚染防止法 準用 船舶安全法第六条ノ二 認定 ........ 九万円   → ¥90,000
  百三十一(二) 海洋汚染防止法 準用 船舶安全法第六条ノ三 認定 ........ 九万円   → ¥90,000
  百三十一(三) 海洋汚染防止法第二十条第一項 廃油処理事業の許可 ...... 十五万円 → ¥150,000
  百三十一(四) 海洋汚染防止法第九条の二第四項 登録確認機関の登録 .... 九万円   → ¥90,000
  百三十一(五) 海洋汚染防止法第十九条の十五第一項 船級協会の登録 .... 九万円   → ¥90,000
  百三十一(六) 海洋汚染防止法第十九条の三十第一項 船級協会の登録 .... 九万円   → ¥90,000
  百三十一(七) 海洋汚染防止法第十九条の四十六第一項 船級協会の登録 .. 九万円   → ¥90,000
  百三十一(八) 海洋汚染防止法 準用 船舶安全法第六条ノ五第一項 登録 ... 九万円   → ¥90,000
  百三十一(九) 海洋汚染防止法第四十三条の九第一項 登録検定機関の登録 . 九万円   → ¥90,000
  百三十二 船舶保安規程の審査等に係る船級協会の登録 ................. 九万円   → ¥90,000
  百三十二の二(一) 特定船舶の再資源化解体の許可 ..................... 九万円   → ¥90,000
  百三十二の二(二) 再資源化法第三十条第一項 船級協会の登録 .......... 九万円   → ¥90,000
  百三十二の二(三) 再資源化法第三十一条第一項 船級協会の登録 ........ 九万円   → ¥90,000
  百三十三(一) 一般旅客定期航路事業の許可 .......................... 九万円   → ¥90,000
  百三十三(二) 特定旅客定期航路事業の許可 .......................... 九万円   → ¥90,000
  百三十三(三) 対外旅客定期航路事業の登録 .......................... 九万円   → ¥90,000
  百三十三(四) 貨客定期航路事業の登録 .............................. 一万五千円 → ¥15,000
  百三十三(五) 旅客不定期航路事業の許可 ............................ 九万円   → ¥90,000
  百三十三(六) 一般不定期航路事業の登録 ............................ 一万五千円 → ¥15,000
  百三十三(七) 登録安全統括管理者講習機関の登録 .................... 九万円   → ¥90,000
  百三十三(八) 登録運航管理者講習機関の登録 ........................ 九万円   → ¥90,000
  百三十四(一) 一般港湾運送事業の許可 .............................. 九万円   → ¥90,000
  百三十四(二) 港湾荷役事業の許可 .................................. 六万円   → ¥60,000
  百三十四(三) はしけ／いかだ運送事業の許可 ........................ 三万円   → ¥30,000
  百三十四(四) 検数／鑑定／検量事業の許可 .......................... 三万円   → ¥30,000

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。認定・登録・許可の要件・適用は
  caller-established とし、ここではモデル化しない。
* 「財務省令で定めるものを除く」「政令で定める許可を除く」「更新の登録／許可を除く」
  「既に…認定を受けている者については一万五千円」等の適用判定・軽減額は
  caller-established とし、金額定数には反映しない（Bool を式に入れず、軽減額の別 def も作らない）。
* 百三十(一)(二)(三) 及び 百三十一(一)(二) の括弧内「既に…については、一万五千円」は
  軽減額の例外であり「一件につき」の主たる fee string ではないため別 def を作らない。
* 百三十（注）のみなし規定（特定船舶導入計画等の認定を事業場の認定とみなす）及び
  百三十三（注）のみなし規定（総合効率化計画等の認定を許可／登録とみなす）は
  適用判定であり、金額定数には反映しない（caller-established）。
* （注）のみなし規定は 百三十・百三十三 に存在するが、適用判定として caller-established とし
  fee def を作らない。金額なし行は存在しない。全 33 行の fee string を fee def 化。
* 百二十九 以前・百三十五 以降は NOT YET COVERED。「申請件数」「登録件数」「許可件数」
  の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百三十（一）船舶安全法（昭和八年法律第十一号）第六条ノ二（事業場の認定）の製造工事又は
    改造修理工事に係る事業場の認定（財務省令で定めるものを除く。）の申請件数一件につきの額
    （固定 ¥90,000）。「財務省令で定めるものを除く。」及び括弧内の「既に（一）に掲げる認定を
    受けている者については、一万五千円」（軽減額）は caller-established（別 def なし）。 -/
def shipSafetyMfgConversionWorkSiteCertFee : Money := 90_000

/-- 百三十（二）船舶安全法第六条ノ三（事業場の認定）の整備に係る事業場の認定（財務省令で
    定めるものを除く。）の申請件数一件につきの額（固定 ¥90,000）。「財務省令で定めるものを
    除く。」及び「既に（二）…一万五千円」の軽減額は caller-established（別 def なし）。 -/
def shipSafetyMaintenanceWorkSiteCertFee : Money := 90_000

/-- 百三十（三）船舶安全法第六条ノ四第一項（事業場の認定）の遠隔支援業務に係る事業場の認定
    （財務省令で定めるものを除く。）の申請件数一件につきの額（固定 ¥90,000）。
    「財務省令で定めるものを除く。」及び「既に（三）…一万五千円」の軽減額は
    caller-established（別 def なし）。 -/
def shipSafetyRemoteSupportWorkSiteCertFee : Money := 90_000

/-- 百三十（四）船舶安全法第六条ノ五第一項（登録検定機関の登録）の登録（更新の登録を除く。）
    の登録件数一件につきの額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def shipSafetyVerificationOrgRegFee : Money := 90_000

/-- 百三十（五）船舶安全法第六条ノ六（登録検査確認機関の登録）の登録（更新の登録を除く。）
    の登録件数一件につきの額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def shipSafetyInspectionConfirmationOrgRegFee : Money := 90_000

/-- 百三十（六）船舶安全法第八条（船級協会の登録）の登録（更新の登録を除く。）の登録件数一件に
    つきの額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def shipSafetyClassificationSocietyRegFee : Money := 90_000

/-- 百三十（七）船舶安全法第二十八条第五項（登録検査機関の登録）の登録（更新の登録を除く。）
    の登録件数一件につきの額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def shipSafetyInspectionOrgRegFee : Money := 90_000

/-- 百三十（八）船舶安全法第二十九条ノ三第二項（証書の発給を行う船級協会の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def shipSafetyCertIssuingClassSocietyRegFee : Money := 90_000

/-- 百三十一（一）海洋汚染等及び海上災害の防止に関する法律（昭和四十五年法律第百三十六号）
    第十九条の四十九第一項（船舶安全法の準用）において準用する船舶安全法第六条ノ二
    （事業場の認定）の認定（財務省令で定めるものを除く。）の申請件数一件につきの額
    （固定 ¥90,000）。除外・「既に（一）…一万五千円」の軽減額は caller-established。 -/
def marinePollutionMfgWorkSiteCertFee : Money := 90_000

/-- 百三十一（二）海洋汚染等及び海上災害の防止に関する法律第十九条の四十九第一項において
    準用する船舶安全法第六条ノ三（事業場の認定）の認定（財務省令で定めるものを除く。）の
    申請件数一件につきの額（固定 ¥90,000）。除外・「既に（二）…一万五千円」の軽減額は
    caller-established。 -/
def marinePollutionMaintenanceWorkSiteCertFee : Money := 90_000

/-- 百三十一（三）海洋汚染等及び海上災害の防止に関する法律第二十条第一項（事業の許可及び届出）
    の廃油処理事業の許可の許可件数一件につきの額（固定 ¥150,000）。 -/
def wasteOilDisposalBizPermitFee : Money := 150_000

/-- 百三十一（四）海洋汚染等及び海上災害の防止に関する法律第九条の二第四項（登録確認機関の
    登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def marinePollutionRegConfirmationOrgRegFee : Money := 90_000

/-- 百三十一（五）海洋汚染等及び海上災害の防止に関する法律第十九条の十五第一項（船級協会の
    登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def marinePollutionClassSocietyRegArt19No15Fee : Money := 90_000

/-- 百三十一（六）海洋汚染等及び海上災害の防止に関する法律第十九条の三十第一項（船級協会の
    登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def marinePollutionClassSocietyRegArt19No30Fee : Money := 90_000

/-- 百三十一（七）海洋汚染等及び海上災害の防止に関する法律第十九条の四十六第一項（船級協会の
    登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def marinePollutionClassSocietyRegArt19No46Fee : Money := 90_000

/-- 百三十一（八）海洋汚染等及び海上災害の防止に関する法律第十九条の四十九第一項において
    準用する船舶安全法第六条ノ五第一項（登録検定機関の登録）の登録（更新の登録を除く。）の
    登録件数一件につきの額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def marinePollutionVerificationOrgRegViaSafetyActFee : Money := 90_000

/-- 百三十一（九）海洋汚染等及び海上災害の防止に関する法律第四十三条の九第一項（登録検定機関
    の登録）の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def marinePollutionVerificationOrgRegArt43No9Fee : Money := 90_000

/-- 百三十二 国際航海船舶及び国際港湾施設の保安の確保等に関する法律（平成十六年法律第三十一号）
    第二十条第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につき
    の額（固定 ¥90,000）。「更新の登録を除く。」は caller-established。 -/
def shipSecurityClassSocietyRegFee : Money := 90_000

/-- 百三十二の二（一）船舶の再資源化解体の適正な実施に関する法律（平成三十年法律第六十一号）
    第十条第一項（再資源化解体の許可）の特定船舶の再資源化解体の許可（更新の許可を除く。）の
    許可件数一件につきの額（固定 ¥90,000）。「更新の許可を除く。」は caller-established。 -/
def shipRecyclingBizPermitFee : Money := 90_000

/-- 百三十二の二（二）船舶の再資源化解体の適正な実施に関する法律第三十条第一項（船級協会の
    登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def shipRecyclingClassSocietyRegArt30Fee : Money := 90_000

/-- 百三十二の二（三）船舶の再資源化解体の適正な実施に関する法律第三十一条第一項（船級協会の
    登録）の船級協会の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def shipRecyclingClassSocietyRegArt31Fee : Money := 90_000

/-- 百三十三（一）海上運送法第三条第一項（一般旅客定期航路事業の許可）の一般旅客定期航路事業の
    許可（離島航路整備法（昭和二十七年法律第二百二十六号）第二条第二項（定義）に規定する離島航路
    事業に係る許可その他政令で定める許可を除く。）の許可件数一件につきの額（固定 ¥90,000）。
    適用除外は caller-established。 -/
def generalPassengerRegularRouteBizPermitFee : Money := 90_000

/-- 百三十三（二）海上运送法第十九条の六第一項（特定旅客定期航路事業の許可）の特定旅客定期航路
    事業の許可（（一）の離島航路事業に係る許可その他政令で定める許可を除く。）の許可件数一件に
    つきの額（固定 ¥90,000）。適用除外は caller-established。 -/
def specifiedPassengerRegularRouteBizPermitFee : Money := 90_000

/-- 百三十三（三）海上运送法第十九条の七第一項（対外旅客定期航路事業の登録）の対外旅客定期航路
    事業の登録の登録件数一件につきの額（固定 ¥90,000）。 -/
def externalPassengerRegularRouteBizRegFee : Money := 90_000

/-- 百三十三（四）海上运送法第二十条第一項（貨客定期航路事業）の貨客定期航路事業の登録の
    登録件数一件につきの額（固定 ¥15,000）。 -/
def passengerFreightRegularRouteBizRegFee : Money := 15_000

/-- 百三十三（五）海上运送法第二十一条第一項（旅客不定期航路事業の許可）の旅客不定期航路事業の
    許可（更新の許可を除く。）の許可件数一件につきの額（固定 ¥90,000）。
    「更新の許可を除く。」は caller-established。 -/
def passengerIrregularRouteBizPermitFee : Money := 90_000

/-- 百三十三（六）海上运送法第二十二条第一項（一般不定期航路事業）の一般不定期航路事業の登録の
    登録件数一件につきの額（固定 ¥15,000）。 -/
def generalIrregularRouteBizRegFee : Money := 15_000

/-- 百三十三（七）海上运送法第三十二条の二十六（登録安全統括管理者講習機関の登録）の登録安全統括
    管理者講習機関の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredSafetyControlManagerTrainingOrgRegFee : Money := 90_000

/-- 百三十三（八）海上运送法第三十二条の四十第一項（登録運航管理者講習機関の登録）の登録運航
    管理者講習機関の登録（更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」は caller-established。 -/
def registeredOperationManagerTrainingOrgRegFee : Money := 90_000

/-- 百三十四（一）港湾運送事業法（昭和二十六年法律第百六十一号）第四条（許可）の規定による
    港湾運送事業の許可のうち一般港湾运送事業の許可の許可件数一件につきの額（固定 ¥90,000）。 -/
def generalPortTransportBizPermitFee : Money := 90_000

/-- 百三十四（二）港湾運送事業法第四条の港湾荷役事業の許可の許可件数一件につきの額
    （固定 ¥60,000）。 -/
def portStevedoringBizPermitFee : Money := 60_000

/-- 百三十四（三）港湾運送事業法第四条のはしけ运送事業の許可又はいかだ运送事業の許可の
    許可件数一件につきの額（固定 ¥30,000）。 -/
def lighterOrRaftTransportBizPermitFee : Money := 30_000

/-- 百三十四（四）港湾運送事業法第四条の検数事業の許可、鑑定事業の許可又は検量事業の許可の
    許可件数一件につきの額（固定 ¥30,000）。 -/
def tallySurveyOrMeasurementBizPermitFee : Money := 30_000

theorem shipSafetyMfgConversionWorkSiteCertFee_pos :
    shipSafetyMfgConversionWorkSiteCertFee > 0 := by decide
theorem shipSafetyMaintenanceWorkSiteCertFee_pos :
    shipSafetyMaintenanceWorkSiteCertFee > 0 := by decide
theorem shipSafetyRemoteSupportWorkSiteCertFee_pos :
    shipSafetyRemoteSupportWorkSiteCertFee > 0 := by decide
theorem shipSafetyVerificationOrgRegFee_pos :
    shipSafetyVerificationOrgRegFee > 0 := by decide
theorem shipSafetyInspectionConfirmationOrgRegFee_pos :
    shipSafetyInspectionConfirmationOrgRegFee > 0 := by decide
theorem shipSafetyClassificationSocietyRegFee_pos :
    shipSafetyClassificationSocietyRegFee > 0 := by decide
theorem shipSafetyInspectionOrgRegFee_pos :
    shipSafetyInspectionOrgRegFee > 0 := by decide
theorem shipSafetyCertIssuingClassSocietyRegFee_pos :
    shipSafetyCertIssuingClassSocietyRegFee > 0 := by decide
theorem marinePollutionMfgWorkSiteCertFee_pos :
    marinePollutionMfgWorkSiteCertFee > 0 := by decide
theorem marinePollutionMaintenanceWorkSiteCertFee_pos :
    marinePollutionMaintenanceWorkSiteCertFee > 0 := by decide
theorem wasteOilDisposalBizPermitFee_pos :
    wasteOilDisposalBizPermitFee > 0 := by decide
theorem marinePollutionRegConfirmationOrgRegFee_pos :
    marinePollutionRegConfirmationOrgRegFee > 0 := by decide
theorem marinePollutionClassSocietyRegArt19No15Fee_pos :
    marinePollutionClassSocietyRegArt19No15Fee > 0 := by decide
theorem marinePollutionClassSocietyRegArt19No30Fee_pos :
    marinePollutionClassSocietyRegArt19No30Fee > 0 := by decide
theorem marinePollutionClassSocietyRegArt19No46Fee_pos :
    marinePollutionClassSocietyRegArt19No46Fee > 0 := by decide
theorem marinePollutionVerificationOrgRegViaSafetyActFee_pos :
    marinePollutionVerificationOrgRegViaSafetyActFee > 0 := by decide
theorem marinePollutionVerificationOrgRegArt43No9Fee_pos :
    marinePollutionVerificationOrgRegArt43No9Fee > 0 := by decide
theorem shipSecurityClassSocietyRegFee_pos :
    shipSecurityClassSocietyRegFee > 0 := by decide
theorem shipRecyclingBizPermitFee_pos :
    shipRecyclingBizPermitFee > 0 := by decide
theorem shipRecyclingClassSocietyRegArt30Fee_pos :
    shipRecyclingClassSocietyRegArt30Fee > 0 := by decide
theorem shipRecyclingClassSocietyRegArt31Fee_pos :
    shipRecyclingClassSocietyRegArt31Fee > 0 := by decide
theorem generalPassengerRegularRouteBizPermitFee_pos :
    generalPassengerRegularRouteBizPermitFee > 0 := by decide
theorem specifiedPassengerRegularRouteBizPermitFee_pos :
    specifiedPassengerRegularRouteBizPermitFee > 0 := by decide
theorem externalPassengerRegularRouteBizRegFee_pos :
    externalPassengerRegularRouteBizRegFee > 0 := by decide
theorem passengerFreightRegularRouteBizRegFee_pos :
    passengerFreightRegularRouteBizRegFee > 0 := by decide
theorem passengerIrregularRouteBizPermitFee_pos :
    passengerIrregularRouteBizPermitFee > 0 := by decide
theorem generalIrregularRouteBizRegFee_pos :
    generalIrregularRouteBizRegFee > 0 := by decide
theorem registeredSafetyControlManagerTrainingOrgRegFee_pos :
    registeredSafetyControlManagerTrainingOrgRegFee > 0 := by decide
theorem registeredOperationManagerTrainingOrgRegFee_pos :
    registeredOperationManagerTrainingOrgRegFee > 0 := by decide
theorem generalPortTransportBizPermitFee_pos :
    generalPortTransportBizPermitFee > 0 := by decide
theorem portStevedoringBizPermitFee_pos :
    portStevedoringBizPermitFee > 0 := by decide
theorem lighterOrRaftTransportBizPermitFee_pos :
    lighterOrRaftTransportBizPermitFee > 0 := by decide
theorem tallySurveyOrMeasurementBizPermitFee_pos :
    tallySurveyOrMeasurementBizPermitFee > 0 := by decide

example : shipSafetyMfgConversionWorkSiteCertFee = 90_000 := by decide
example : shipSafetyMaintenanceWorkSiteCertFee = 90_000 := by decide
example : shipSafetyRemoteSupportWorkSiteCertFee = 90_000 := by decide
example : shipSafetyVerificationOrgRegFee = 90_000 := by decide
example : shipSafetyInspectionConfirmationOrgRegFee = 90_000 := by decide
example : shipSafetyClassificationSocietyRegFee = 90_000 := by decide
example : shipSafetyInspectionOrgRegFee = 90_000 := by decide
example : shipSafetyCertIssuingClassSocietyRegFee = 90_000 := by decide
example : marinePollutionMfgWorkSiteCertFee = 90_000 := by decide
example : marinePollutionMaintenanceWorkSiteCertFee = 90_000 := by decide
example : wasteOilDisposalBizPermitFee = 150_000 := by decide
example : marinePollutionRegConfirmationOrgRegFee = 90_000 := by decide
example : marinePollutionClassSocietyRegArt19No15Fee = 90_000 := by decide
example : marinePollutionClassSocietyRegArt19No30Fee = 90_000 := by decide
example : marinePollutionClassSocietyRegArt19No46Fee = 90_000 := by decide
example : marinePollutionVerificationOrgRegViaSafetyActFee = 90_000 := by decide
example : marinePollutionVerificationOrgRegArt43No9Fee = 90_000 := by decide
example : shipSecurityClassSocietyRegFee = 90_000 := by decide
example : shipRecyclingBizPermitFee = 90_000 := by decide
example : shipRecyclingClassSocietyRegArt30Fee = 90_000 := by decide
example : shipRecyclingClassSocietyRegArt31Fee = 90_000 := by decide
example : generalPassengerRegularRouteBizPermitFee = 90_000 := by decide
example : specifiedPassengerRegularRouteBizPermitFee = 90_000 := by decide
example : externalPassengerRegularRouteBizRegFee = 90_000 := by decide
example : passengerFreightRegularRouteBizRegFee = 15_000 := by decide
example : passengerIrregularRouteBizPermitFee = 90_000 := by decide
example : generalIrregularRouteBizRegFee = 15_000 := by decide
example : registeredSafetyControlManagerTrainingOrgRegFee = 90_000 := by decide
example : registeredOperationManagerTrainingOrgRegFee = 90_000 := by decide
example : generalPortTransportBizPermitFee = 90_000 := by decide
example : portStevedoringBizPermitFee = 60_000 := by decide
example : lighterOrRaftTransportBizPermitFee = 30_000 := by decide
example : tallySurveyOrMeasurementBizPermitFee = 30_000 := by decide

end JapanTaxLaw
