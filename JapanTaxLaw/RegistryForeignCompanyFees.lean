import JapanTaxLaw.TaxFinance

/-!
# RegistryForeignCompanyFees — 登録免許税法 別表第一（二）二十二〜二十五（外国会社・投資法人等）の手数料モデル (W-Z)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_rem_B.txt
  （二十二 鉱業権の末尾 / 二十三 漁業権又は入漁権の登録 /
    二十四 会社又は外国会社の商業登記 / 二十五 特定目的会社の登記）

原文の各 fee string を読み、定額型は `Money` 定数、割合型（「債権金額…千分のX」等）は
`TaxRate ⟨X, 1000⟩` 定数と税額関数 `base.applyFloor`（= 課税標準 × X / 1000、
切り捨て）としてモデル化する。金額は日本語数字で検証して Arabic に変換した。

  【二十二 鉱業権（末尾のみ）】
    変更の登録 ........................ 試掘区域又は貯留区域の数一個につき千円 ... 1,000
    （十四）登録の抹消 ................ 試掘区域又は貯留区域の数一個につき千円 ... 1,000

  【二十三 漁業権又は入漁権の登録】
    （一）漁業権の移転 イ 相続・合併 1,800 / ロ その他 9,000
    （二）漁業権の持分の移転 イ 1,500 / ロ 3,000
    （三）入漁権の設定 6,000 ／（四）入漁権の保存 1,500
    （五）入漁権の移転 イ 1,500 / ロ 4,500
    （六）入漁権の持分の移転 イ 1,500 / ロ 3,000
    （七）権利の処分の制限の登録 債権金額、極度金額又は工事費用の予算金額千分の四 ... 4/1000
    （八）先取特権又は抵当権の移転 イ 1,500 / ロ 3,000
    （九）抵当権の順位の変更 1,000
    （十）信託の登録 イ 先取特権又は抵当権の信託 債権金額又は極度金額千分の二 ... 2/1000
                   ロ 先取特権及び抵当権以外の権利の信託 4,500
    （十一）付記・仮登録・回復・更正/変更 1,000 ／（十二）登録の抹消 1,000

  【二十四 会社又は外国会社の商業登記】
    （一）のうち既存モジュール未担当のリ〜ナ:
      リ 相互会社の設立 300,000 ／ ヌ 新株予約権の発行による変更 90,000
      ル 支店・従たる事務所の設置（一箇所につき）60,000
      ヲ 本店・支店等の移転（一箇所につき）30,000
      ワ 取締役会等事項の変更 30,000 ／ カ 役員等事項の変更 30,000（資本金一億円以下 10,000）
      ヨ 支配人の選任等 30,000 ／ タ 職務執行の停止等 30,000 ／ レ 解散 30,000
      ソ 継続・回復・設立無効等 30,000 ／ ツ 登記事項の変更・消滅・廃止 30,000
      ネ 登記の更正 20,000 ／ ナ 登記の抹消 20,000
      ※（一）イ〜チ（株式会社等の設立・増加、最低税額 3/6/15 万円）は
        `RegistrationCommercialTax.lean` / `RegistrationCommercialTaxTable.lean` の担当。
    （二）外国会社又は外国相互会社の登記:
      イ 営業所の設置（一箇所につき）90,000
      ロ 営業所を設置していない場合の外国会社の登記／初めて設置する一の営業所 60,000
      ハ イ・ロ・ニ以外の登記 9,000 ／ ニ 登記の更正・抹消 6,000
    （三）清算に係る登記（外国会社の清算を含む。）:
      イ 清算人・代表清算人 9,000 ／ ロ 清算人の職務執行の停止等 6,000
      ハ 清算の結了 2,000 ／ ニ 登記事項の変更等・更正・抹消 6,000

  【二十五 特定目的会社の登記】
    （一）設立の登記 30,000 ／（二）（一）（三）以外の登記 15,000
    （三）登記の抹消は原文が「申請件数一件に」で切れており金額を確定できないため NOT COVERED。

小数点表記の割合（二・五／一・五）は本範囲に現れない。本範囲の割合は整数千分率のみ
（千分の四 → 4/1000、千分の二 → 2/1000）で、分母 1000 を用いる（過去の 10 倍過大バグに
注意）。原文の率文字列は各 doc-comment に一字も変えず保持する。

Scope & honest boundaries:

* 課税標準（「債権金額」「極度金額」「工事費用の予算金額」）、申請件数、漁業権・入漁権の
  件数、営業所・支店・事務所の箇所数、試掘区域・貯留区域の数は **caller-established** とする。
  本モデルは与えられた値に税率・単価を適用する算術（および定額）のみを扱い、価額・件数等の
  算定・評価は一切行わない。
* 各区分への該当性（設定／移転／持分の移転／信託／付記・仮登録・回復・更正・変更・抹消、
  相続若しくは法人の合併によるかその他か、外国会社若しくは外国相互会社か、清算の結了か、
  資本金が一億円以下か 等）は **caller-established** とし、Bool を金額式に入れない。
* 定額は「一件につき／一箇所につき／一個につき」の 1 件・1 箇所・1 個あたり単価のみを与え、
  件数・箇所数・個数を掛ける Nat 掛け算は行わない（これらは caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる（割合型の区分に端数規定の明示はないため、
  per-law business data として floor を採用）。割合型の税額は `base` が小さいと 0 になり得るため
  strict positivity は成り立たず、代わりに各税率定数の `den_pos` と税額関数の smoke を付与する。
* 二十四（一）イ〜チ、二十五（三）、別表第一の他の号・他の条文、登録免許税の納付手続・
  端数処理の通則法的詳細は **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryForeignCompanyFees

open JapanTaxLaw.TaxFinance

/-! === 割合型: 税率定数（分母 1000）+ 税額関数（applyFloor） === -/
/-- 二十三（七） 先取特権の保存、抵当権の設定、強制競売、競売、強制管理若しくは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録 — 債権金額、極度金額又は工事費用の予算金額千分の四（num=4, den=1000）。 -/
def fishingRightLienPreservationRate : TaxRate := ⟨4, 1000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def fishingRightLienPreservationFee (base : Money) : Money := fishingRightLienPreservationRate.applyFloor base
/-- 二十三（十）イ 先取特権又は抵当権の信託の登録 — 債権金額又は極度金額千分の二（num=2, den=1000）。 -/
def fishingRightLienTrustRate : TaxRate := ⟨2, 1000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def fishingRightLienTrustFee (base : Money) : Money := fishingRightLienTrustRate.applyFloor base

/-! === 定額型: 一件／一箇所／一個あたりの Money 定数 === -/
/-- 二十二（末尾） 変更の登録 — 試掘区域又は貯留区域の数一個につき千円（¥1,000）。 -/
def miningAreaChangeRegistrationFeePerArea : Money := 1000
/-- 二十二（十四） 登録の抹消 — 試掘区域又は貯留区域の数一個につき千円（¥1,000）。 -/
def miningAreaCancellationFeePerArea : Money := 1000

/-- 二十三（一）イ 漁業権の移転の登録（相続又は法人の合併による移転）— 漁業権の件数一件につき千八百円（¥1,800）。 -/
def fishingRightTransferByInheritanceOrMergerFeePerCase : Money := 1800
/-- 二十三（一）ロ 漁業権の移転の登録（その他の原因による移転）— 漁業権の件数一件につき九千円（¥9,000）。 -/
def fishingRightTransferOtherFeePerCase : Money := 9000
/-- 二十三（二）イ 漁業権の持分の移転の登録（相続又は法人の合併）— 漁業権の件数一件につき千五百円（¥1,500）。 -/
def fishingRightShareTransferByInheritanceOrMergerFeePerCase : Money := 1500
/-- 二十三（二）ロ 漁業権の持分の移転の登録（その他）— 漁業権の件数一件につき三千円（¥3,000）。 -/
def fishingRightShareTransferOtherFeePerCase : Money := 3000
/-- 二十三（三） 入漁権の設定の登録 — 入漁権の件数一件につき六千円（¥6,000）。 -/
def anglingRightEstablishmentFeePerCase : Money := 6000
/-- 二十三（四） 入漁権の保存の登録 — 入漁権の件数一件につき千五百円（¥1,500）。 -/
def anglingRightPreservationFeePerCase : Money := 1500
/-- 二十三（五）イ 入漁権の移転の登録（相続又は法人の合併）— 入漁権の件数一件につき千五百円（¥1,500）。 -/
def anglingRightTransferByInheritanceOrMergerFeePerCase : Money := 1500
/-- 二十三（五）ロ 入漁権の移転の登録（その他）— 入漁権の件数一件につき四千五百円（¥4,500）。 -/
def anglingRightTransferOtherFeePerCase : Money := 4500
/-- 二十三（六）イ 入漁権の持分の移転の登録（相続又は法人の合併）— 入漁権の件数一件につき千五百円（¥1,500）。 -/
def anglingRightShareTransferByInheritanceOrMergerFeePerCase : Money := 1500
/-- 二十三（六）ロ 入漁権の持分の移転の登録（その他）— 入漁権の件数一件につき三千円（¥3,000）。 -/
def anglingRightShareTransferOtherFeePerCase : Money := 3000
/-- 二十三（八）イ 先取特権又は抵当権の移転の登録（相続又は法人の合併）— 漁業権の件数一件につき千五百円（¥1,500）。 -/
def lienOrMortgageTransferByInheritanceOrMergerFeePerCase : Money := 1500
/-- 二十三（八）ロ 先取特権又は抵当権の移転の登録（その他）— 漁業権の件数一件につき三千円（¥3,000）。 -/
def lienOrMortgageTransferOtherFeePerCase : Money := 3000
/-- 二十三（九） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1,000）。 -/
def mortgageRankChangeFeePerCase : Money := 1000
/-- 二十三（十）ロ 先取特権及び抵当権以外の権利の信託の登録 — 漁業権又は入漁権の件数一件につき四千五百円（¥4,500）。 -/
def nonLienOrMortgageRightTrustFeePerCase : Money := 4500
/-- 二十三（十一） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録 — 漁業権又は入漁権の件数一件につき千円（¥1,000）。 -/
def fishingIncidentalOrRestorationOrCorrectionFeePerCase : Money := 1000
/-- 二十三（十二） 登録の抹消 — 漁業権又は入漁権の件数一件につき千円（¥1,000）。 -/
def fishingRightCancellationFeePerCase : Money := 1000

/-- 二十四（一）リ 相互会社の設立（新設合併又は組織変更による設立を含む。）の登記 — 申請件数一件につき三十万円（¥300,000）。 -/
def mutualCompanyEstablishmentFeePerApplication : Money := 300000
/-- 二十四（一）ヌ 新株予約権の発行による変更の登記 — 申請件数一件につき九万円（¥90,000）。 -/
def newShareOptionIssuanceChangeFeePerApplication : Money := 90000
/-- 二十四（一）ル 支店又は従たる事務所の設置の登記 — 支店又は従たる事務所の数一箇所につき六万円（¥60,000）。 -/
def branchOrSubsidiaryOfficeEstablishmentFeePerOffice : Money := 60000
/-- 二十四（一）ヲ 本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記 — 一箇所につき三万円（¥30,000）。 -/
def headOrBranchOfficeRelocationFeePerOffice : Money := 30000
/-- 二十四（一）ワ 取締役会、監査役会、監査等委員会若しくは指名委員会等又は理事会に関する事項の変更の登記 — 申請件数一件につき三万円（¥30,000）。 -/
def boardAndCommitteeMatterChangeFeePerApplication : Money := 30000
/-- 二十四（一）カ 取締役、会計参与、監査役等の変更の登記（原則）— 申請件数一件につき三万円（¥30,000）。 -/
def directorAndOfficerMatterChangeFeePerApplication : Money := 30000
/-- 二十四（一）カ 括弧書 資本金の額が一億円以下の会社又は一般社団法人等については一万円（¥10,000）。 -/
def directorAndOfficerMatterChangeSmallCapitalFeePerApplication : Money := 10000
/-- 二十四（一）ヨ 支配人の選任の登記又はその代理権の消滅の登記 — 申請件数一件につき三万円（¥30,000）。 -/
def managerAppointmentOrAgencyRevocationFeePerApplication : Money := 30000
/-- 二十四（一）タ 役員等の職務執行の停止若しくは職務代行者の選任等の登記 — 申請件数一件につき三万円（¥30,000）。 -/
def directorDutySuspensionOrSubstituteAppointmentFeePerApplication : Money := 30000
/-- 二十四（一）レ 会社又は相互会社若しくは一般社団法人等の解散の登記 — 申請件数一件につき三万円（¥30,000）。 -/
def companyDissolutionFeePerApplication : Money := 30000
/-- 二十四（一）ソ 継続の登記、合併無効判決確定による回復の登記又は設立の無効・取消しの登記 — 申請件数一件につき三万円（¥30,000）。 -/
def companyContinuationOrRestorationFeePerApplication : Money := 30000
/-- 二十四（一）ツ 登記事項の変更、消滅又は廃止の登記（イからソまでを除く。）— 申請件数一件につき三万円（¥30,000）。 -/
def companyMiscRegistrationChangeFeePerApplication : Money := 30000
/-- 二十四（一）ネ 登記の更正の登記 — 申請件数一件につき二万円（¥20,000）。 -/
def companyCorrectionFeePerApplication : Money := 20000
/-- 二十四（一）ナ 登記の抹消 — 申請件数一件につき二万円（¥20,000）。 -/
def companyCancellationFeePerApplication : Money := 20000

/-- 二十四（二）イ 営業所の設置の登記（ロに掲げる登記を除く。）— 営業所の数一箇所につき九万円（¥90,000）。 -/
def foreignCompanyBusinessOfficeEstablishmentFeePerOffice : Money := 90000
/-- 二十四（二）ロ 営業所を設置していない場合の外国会社の登記又は初めて設置する一の営業所の設置の登記 — 申請件数一件につき六万円（¥60,000）。 -/
def foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication : Money := 60000
/-- 二十四（二）ハ イ、ロ及びニに掲げる登記以外の登記 — 申請件数一件につき九千円（¥9,000）。 -/
def foreignCompanyOtherRegistrationFeePerApplication : Money := 9000
/-- 二十四（二）ニ 登記の更正の登記又は登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def foreignCompanyCorrectionOrCancellationFeePerApplication : Money := 6000

/-- 二十四（三）イ 清算人又は代表清算人の登記 — 申請件数一件につき九千円（¥9,000）。 -/
def foreignCompanyLiquidatorAppointmentFeePerApplication : Money := 9000
/-- 二十四（三）ロ 清算人又は代表清算人の職務執行の停止・取消し・変更又は職務代行者の選任・解任・変更の登記 — 申請件数一件につき六千円（¥6,000）。 -/
def foreignCompanyLiquidatorDutySuspensionFeePerApplication : Money := 6000
/-- 二十四（三）ハ 清算の結了の登記 — 申請件数一件につき二千円（¥2,000）。 -/
def foreignCompanyLiquidationCompletionFeePerApplication : Money := 2000
/-- 二十四（三）ニ 登記事項の変更・消滅・廃止（ロを除く。）、登記の更正又は登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def foreignCompanyLiquidationMiscFeePerApplication : Money := 6000

/-- 二十五（一） 資産の流動化に関する法律第二条第三項に規定する特定目的会社の設立の登記 — 申請件数一件につき三万円（¥30,000）。 -/
def specialPurposeCompanyEstablishmentFeePerApplication : Money := 30000
/-- 二十五（二） （一）及び（三）に掲げる登記以外の登記 — 申請件数一件につき一万五千円（¥15,000）。 -/
def specialPurposeCompanyOtherRegistrationFeePerApplication : Money := 15000

/-! === well-definedness（positivity） === -/
theorem fishingRightLienPreservationRate_den_pos : 0 < fishingRightLienPreservationRate.den := by decide
theorem fishingRightLienTrustRate_den_pos : 0 < fishingRightLienTrustRate.den := by decide
theorem miningAreaChangeRegistrationFeePerArea_pos : miningAreaChangeRegistrationFeePerArea > 0 := by decide
theorem miningAreaCancellationFeePerArea_pos : miningAreaCancellationFeePerArea > 0 := by decide
theorem fishingRightTransferByInheritanceOrMergerFeePerCase_pos : fishingRightTransferByInheritanceOrMergerFeePerCase > 0 := by decide
theorem fishingRightTransferOtherFeePerCase_pos : fishingRightTransferOtherFeePerCase > 0 := by decide
theorem fishingRightShareTransferByInheritanceOrMergerFeePerCase_pos : fishingRightShareTransferByInheritanceOrMergerFeePerCase > 0 := by decide
theorem fishingRightShareTransferOtherFeePerCase_pos : fishingRightShareTransferOtherFeePerCase > 0 := by decide
theorem anglingRightEstablishmentFeePerCase_pos : anglingRightEstablishmentFeePerCase > 0 := by decide
theorem anglingRightPreservationFeePerCase_pos : anglingRightPreservationFeePerCase > 0 := by decide
theorem anglingRightTransferByInheritanceOrMergerFeePerCase_pos : anglingRightTransferByInheritanceOrMergerFeePerCase > 0 := by decide
theorem anglingRightTransferOtherFeePerCase_pos : anglingRightTransferOtherFeePerCase > 0 := by decide
theorem anglingRightShareTransferByInheritanceOrMergerFeePerCase_pos : anglingRightShareTransferByInheritanceOrMergerFeePerCase > 0 := by decide
theorem anglingRightShareTransferOtherFeePerCase_pos : anglingRightShareTransferOtherFeePerCase > 0 := by decide
theorem lienOrMortgageTransferByInheritanceOrMergerFeePerCase_pos : lienOrMortgageTransferByInheritanceOrMergerFeePerCase > 0 := by decide
theorem lienOrMortgageTransferOtherFeePerCase_pos : lienOrMortgageTransferOtherFeePerCase > 0 := by decide
theorem mortgageRankChangeFeePerCase_pos : mortgageRankChangeFeePerCase > 0 := by decide
theorem nonLienOrMortgageRightTrustFeePerCase_pos : nonLienOrMortgageRightTrustFeePerCase > 0 := by decide
theorem fishingIncidentalOrRestorationOrCorrectionFeePerCase_pos : fishingIncidentalOrRestorationOrCorrectionFeePerCase > 0 := by decide
theorem fishingRightCancellationFeePerCase_pos : fishingRightCancellationFeePerCase > 0 := by decide
theorem mutualCompanyEstablishmentFeePerApplication_pos : mutualCompanyEstablishmentFeePerApplication > 0 := by decide
theorem newShareOptionIssuanceChangeFeePerApplication_pos : newShareOptionIssuanceChangeFeePerApplication > 0 := by decide
theorem branchOrSubsidiaryOfficeEstablishmentFeePerOffice_pos : branchOrSubsidiaryOfficeEstablishmentFeePerOffice > 0 := by decide
theorem headOrBranchOfficeRelocationFeePerOffice_pos : headOrBranchOfficeRelocationFeePerOffice > 0 := by decide
theorem boardAndCommitteeMatterChangeFeePerApplication_pos : boardAndCommitteeMatterChangeFeePerApplication > 0 := by decide
theorem directorAndOfficerMatterChangeFeePerApplication_pos : directorAndOfficerMatterChangeFeePerApplication > 0 := by decide
theorem directorAndOfficerMatterChangeSmallCapitalFeePerApplication_pos : directorAndOfficerMatterChangeSmallCapitalFeePerApplication > 0 := by decide
theorem managerAppointmentOrAgencyRevocationFeePerApplication_pos : managerAppointmentOrAgencyRevocationFeePerApplication > 0 := by decide
theorem directorDutySuspensionOrSubstituteAppointmentFeePerApplication_pos : directorDutySuspensionOrSubstituteAppointmentFeePerApplication > 0 := by decide
theorem companyDissolutionFeePerApplication_pos : companyDissolutionFeePerApplication > 0 := by decide
theorem companyContinuationOrRestorationFeePerApplication_pos : companyContinuationOrRestorationFeePerApplication > 0 := by decide
theorem companyMiscRegistrationChangeFeePerApplication_pos : companyMiscRegistrationChangeFeePerApplication > 0 := by decide
theorem companyCorrectionFeePerApplication_pos : companyCorrectionFeePerApplication > 0 := by decide
theorem companyCancellationFeePerApplication_pos : companyCancellationFeePerApplication > 0 := by decide
theorem foreignCompanyBusinessOfficeEstablishmentFeePerOffice_pos : foreignCompanyBusinessOfficeEstablishmentFeePerOffice > 0 := by decide
theorem foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication_pos : foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication > 0 := by decide
theorem foreignCompanyOtherRegistrationFeePerApplication_pos : foreignCompanyOtherRegistrationFeePerApplication > 0 := by decide
theorem foreignCompanyCorrectionOrCancellationFeePerApplication_pos : foreignCompanyCorrectionOrCancellationFeePerApplication > 0 := by decide
theorem foreignCompanyLiquidatorAppointmentFeePerApplication_pos : foreignCompanyLiquidatorAppointmentFeePerApplication > 0 := by decide
theorem foreignCompanyLiquidatorDutySuspensionFeePerApplication_pos : foreignCompanyLiquidatorDutySuspensionFeePerApplication > 0 := by decide
theorem foreignCompanyLiquidationCompletionFeePerApplication_pos : foreignCompanyLiquidationCompletionFeePerApplication > 0 := by decide
theorem foreignCompanyLiquidationMiscFeePerApplication_pos : foreignCompanyLiquidationMiscFeePerApplication > 0 := by decide
theorem specialPurposeCompanyEstablishmentFeePerApplication_pos : specialPurposeCompanyEstablishmentFeePerApplication > 0 := by decide
theorem specialPurposeCompanyOtherRegistrationFeePerApplication_pos : specialPurposeCompanyOtherRegistrationFeePerApplication > 0 := by decide

/-! === smoke（すべて kernel-decide） === -/
-- 税率定数: 分子・分母が原文どおり
example : fishingRightLienPreservationRate.num = 4 := by decide
example : fishingRightLienPreservationRate.den = 1000 := by decide
example : fishingRightLienTrustRate.num = 2 := by decide
example : fishingRightLienTrustRate.den = 1000 := by decide
-- 定額: 原文どおりの金額
example : miningAreaChangeRegistrationFeePerArea = 1000 := by decide
example : miningAreaCancellationFeePerArea = 1000 := by decide
example : fishingRightTransferByInheritanceOrMergerFeePerCase = 1800 := by decide
example : fishingRightTransferOtherFeePerCase = 9000 := by decide
example : fishingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : fishingRightShareTransferOtherFeePerCase = 3000 := by decide
example : anglingRightEstablishmentFeePerCase = 6000 := by decide
example : anglingRightPreservationFeePerCase = 1500 := by decide
example : anglingRightTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : anglingRightTransferOtherFeePerCase = 4500 := by decide
example : anglingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : anglingRightShareTransferOtherFeePerCase = 3000 := by decide
example : lienOrMortgageTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : lienOrMortgageTransferOtherFeePerCase = 3000 := by decide
example : mortgageRankChangeFeePerCase = 1000 := by decide
example : nonLienOrMortgageRightTrustFeePerCase = 4500 := by decide
example : fishingIncidentalOrRestorationOrCorrectionFeePerCase = 1000 := by decide
example : fishingRightCancellationFeePerCase = 1000 := by decide
example : mutualCompanyEstablishmentFeePerApplication = 300000 := by decide
example : newShareOptionIssuanceChangeFeePerApplication = 90000 := by decide
example : branchOrSubsidiaryOfficeEstablishmentFeePerOffice = 60000 := by decide
example : headOrBranchOfficeRelocationFeePerOffice = 30000 := by decide
example : boardAndCommitteeMatterChangeFeePerApplication = 30000 := by decide
example : directorAndOfficerMatterChangeFeePerApplication = 30000 := by decide
example : directorAndOfficerMatterChangeSmallCapitalFeePerApplication = 10000 := by decide
example : managerAppointmentOrAgencyRevocationFeePerApplication = 30000 := by decide
example : directorDutySuspensionOrSubstituteAppointmentFeePerApplication = 30000 := by decide
example : companyDissolutionFeePerApplication = 30000 := by decide
example : companyContinuationOrRestorationFeePerApplication = 30000 := by decide
example : companyMiscRegistrationChangeFeePerApplication = 30000 := by decide
example : companyCorrectionFeePerApplication = 20000 := by decide
example : companyCancellationFeePerApplication = 20000 := by decide
example : foreignCompanyBusinessOfficeEstablishmentFeePerOffice = 90000 := by decide
example : foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication = 60000 := by decide
example : foreignCompanyOtherRegistrationFeePerApplication = 9000 := by decide
example : foreignCompanyCorrectionOrCancellationFeePerApplication = 6000 := by decide
example : foreignCompanyLiquidatorAppointmentFeePerApplication = 9000 := by decide
example : foreignCompanyLiquidatorDutySuspensionFeePerApplication = 6000 := by decide
example : foreignCompanyLiquidationCompletionFeePerApplication = 2000 := by decide
example : foreignCompanyLiquidationMiscFeePerApplication = 6000 := by decide
example : specialPurposeCompanyEstablishmentFeePerApplication = 30000 := by decide
example : specialPurposeCompanyOtherRegistrationFeePerApplication = 15000 := by decide
-- 割合型: 0 → 0, base=1000 → 分子の値
example : fishingRightLienPreservationFee 0 = 0 := by decide
example : fishingRightLienPreservationFee 1000 = 4 := by decide
example : fishingRightLienTrustFee 0 = 0 := by decide
example : fishingRightLienTrustFee 1000 = 2 := by decide

end JapanTaxLaw.RegistryForeignCompanyFees
