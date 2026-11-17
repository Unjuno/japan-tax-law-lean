import JapanTaxLaw.TaxFinance

/-!
# RegistryCopyrightFees — 登録免許税法 別表第一（二）の著作権・出版権・著作隣接権の登録手数料モデル (W-S)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_ip_A.txt
  （十 著作権の登録 / 十一 出版権の登録 / 十二 著作隣接権の登録）

原文の各 fee string「著作権の件数一件につき△△円」等を読み、定額型は
`Money` 定数、割合型（「債権金額千分のX」）は `TaxRate` 定数と税額関数
`base.applyFloor`（= 課税標準 × X / 1000、切り捨て）としてモデル化する。
金額は日本語数字で検証して Arabic に変換:

  【十 著作権の登録】
  （一）イ 相続・法人合併による移転 ........ 著作権一件につき三千円 ... 3,000
  （一）ロ その他の原因による移転 .......... 著作権一件につき一万八千円 18,000
  （二）質権設定・処分制限 ............... 債権金額千分の四 ......... 4/1000
  （三）イ 質権移転・相続/合併 ........... 著作権一件につき千五百円 .. 1,500
  （三）ロ 質権移転・その他 ............. 著作権一件につき三千円 .... 3,000
  （四）無名/変名著作物の実名登録 ........ 著作物一個につき九千円 .... 9,000
  （五）イ 質権の信託 ................... 債権金額千分の二 ......... 2/1000
  （五）ロ 質権以外の権利の信託 ......... 著作権一件につき三千円 .... 3,000
  （六）第一発行/公表年月日・創作年月日 ... 著作権一件/著作物一個につき三千円 3,000
  （七）回復・更正/変更 ................. 著作権一件/著作物一個につき千円 . 1,000
  （八）登録の抹消 ..................... 著作権一件/著作物一個につき千円 . 1,000

  【十一 出版権の登録】
  （一）設定 .......................... 出版権一件につき三万円 ...... 30,000
  （二）イ 相続・法人合併による移転 ...... 出版権一件につき三千円 .... 3,000
  （二）ロ その他の原因による移転 ........ 出版権一件につき一万八千円 . 18,000
  （三）質権設定・処分制限 ............. 債権金額千分の四 .......... 4/1000
  （四）イ 質権移転・相続/合併 ......... 出版権一件につき千五百円 ... 1,500
  （四）ロ 質権移転・その他 ........... 出版権一件につき三千円 ..... 3,000
  （五）イ 質権の信託 ................. 債権金額千分の二 .......... 2/1000
  （五）ロ 質権以外の権利の信託 ....... 出版権一件につき三千円 ..... 3,000
  （六）回復・更正/変更 ............... 出版権一件につき千円 ....... 1,000
  （七）登録の抹消 ................... 出版権一件につき千円 ....... 1,000

  【十二 著作隣接権の登録】
  （一）イ 相続・法人合併による移転 .... 著作隣接権一件につき三千円 ... 3,000
  （一）ロ その他の原因による移転 ...... 著作隣接権一件につき九千円 ... 9,000
  （二）質権設定・処分制限 ........... 債権金額千分の四 ........... 4/1000
  （三）イ 質権移転・相続/合併 ....... 著作隣接権一件につき千五百円 .. 1,500
  （三）ロ 質権移転・その他 ......... 著作隣接権一件につき三千円 .... 3,000
  （四）イ 質権の信託 ............... 債権金額千分の二 ........... 2/1000
  （四）ロ 質権以外の権利の信託 ..... 著作隣接権一件につき三千円 .... 3,000
  （五）回復・更正/変更 ............. 著作隣接権一件につき千円 ...... 1,000
  （六）登録の抹消 ................. 著作隣接権一件につき千円 ...... 1,000

Scope & honest boundaries:

* 課税標準（「債権金額」）は **caller-established** とする。割合型は与えられた
  `base` に税率を乗じる算術のみを扱い、債権金額の算定・評価は一切行わない。
* 各区分への該当性（相続／法人の合併／その他の原因、質権の設定／処分の制限／
  質権の移転、質権の信託／質権以外の権利の信託、信託の登録を含むか、
  無名／変名著作物、第一発行年月日／第一公表年月日／創作年月日、回復／更正／
  変更／抹消 等）は **caller-established** とし、Bool を金額式に入れない。
* 定額は「一件につき／一個につき」の 1 件・1 個あたり単価のみを与え、
  件数・個数を掛ける Nat 掛け算は行わない（件数・個数は caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし
  当該区分に端数規定を持たないため、丸め規則は per-law business data として
  floor を採用したことをここで明示する。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は
  成り立たない。代わりに各税率定数の `den_pos`（well-definedness）と各税額
  関数の smoke を付与する。
* 別表第一の他の号・他の条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/


namespace JapanTaxLaw.RegistryCopyrightFees

open JapanTaxLaw.TaxFinance

/-! === 割合型: 税率定数（分母 1000）+ 税額関数（applyFloor） === -/

/-- 十（二） 著作権を目的とする質権の設定又は著作権若しくは当該質権の処分の制限の登録 —
    債権金額千分の四 (4/1000). -/
def copyrightPledgeEstablishmentRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十（二） 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def copyrightPledgeEstablishmentFee (base : Money) : Money :=
  copyrightPledgeEstablishmentRate.applyFloor base

/-- 十（五）イ 著作権の信託の登録 — 質権の信託の登録 債権金額千分の二 (2/1000). -/
def copyrightPledgeTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 十（五）イ 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def copyrightPledgeTrustFee (base : Money) : Money :=
  copyrightPledgeTrustRate.applyFloor base

/-- 十一（三） 出版権を目的とする質権の設定又は出版権若しくは当該質権の処分の制限の登録 —
    債権金額千分の四 (4/1000). -/
def publishingRightPledgeEstablishmentRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十一（三） 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def publishingRightPledgeEstablishmentFee (base : Money) : Money :=
  publishingRightPledgeEstablishmentRate.applyFloor base

/-- 十一（五）イ 出版権の信託の登録 — 質権の信託の登録 債権金額千分の二 (2/1000). -/
def publishingRightPledgeTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 十一（五）イ 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def publishingRightPledgeTrustFee (base : Money) : Money :=
  publishingRightPledgeTrustRate.applyFloor base

/-- 十二（二） 著作隣接権を目的とする質権の設定又は著作隣接権若しくは当該質権の処分の制限の登録 —
    債権金額千分の四 (4/1000). -/
def relatedRightPledgeEstablishmentRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十二（二） 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def relatedRightPledgeEstablishmentFee (base : Money) : Money :=
  relatedRightPledgeEstablishmentRate.applyFloor base

/-- 十二（四）イ 著作隣接権の信託の登録 — 質権の信託の登録 債権金額千分の二 (2/1000). -/
def relatedRightPledgeTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 十二（四）イ 上記税率を caller-established な債権金額に適用（切り捨て）。 -/
def relatedRightPledgeTrustFee (base : Money) : Money :=
  relatedRightPledgeTrustRate.applyFloor base


/-! === 定額型: 一件／一個あたりの Money 定数 === -/

-- 【十 著作権の登録】

/-- 十（一）イ 相続又は法人の合併による移転の登録 — 著作権一件につき三千円 (¥3,000)。 -/
def copyrightTransferInheritanceOrMergerFee : Money := 3_000

/-- 十（一）ロ その他の原因による移転の登録 — 著作権一件につき一万八千円 (¥18,000)。 -/
def copyrightTransferOtherFee : Money := 18_000

/-- 十（三）イ 質権の移転・相続又は法人の合併 — 著作権一件につき千五百円 (¥1,500)。 -/
def copyrightPledgeTransferInheritanceOrMergerFee : Money := 1_500

/-- 十（三）ロ 質権の移転・その他の原因 — 著作権一件につき三千円 (¥3,000)。 -/
def copyrightPledgeTransferOtherFee : Money := 3_000

/-- 十（四） 無名著作物又は変名著作物の著作者の実名登録 — 著作物一個につき九千円 (¥9,000)。 -/
def copyrightRealNameRegistrationFee : Money := 9_000

/-- 十（五）ロ 質権以外の権利の信託の登録 — 著作権一件につき三千円 (¥3,000)。 -/
def copyrightTrustOtherRightFee : Money := 3_000

/-- 十（六） 第一発行年月日若しくは第一公表年月日又は創作年月日の登録 —
    著作権一件又は著作物一個につき三千円 (¥3,000)。 -/
def copyrightFirstPublicationDateRegistrationFee : Money := 3_000

/-- 十（七） 抹消した登録の回復の登録又は登録の更正若しくは変更の登録 —
    著作権一件又は著作物一個につき千円 (¥1,000)。 -/
def copyrightRestorationOrCorrectionFee : Money := 1_000

/-- 十（八） 登録の抹消 — 著作権一件又は著作物一個につき千円 (¥1,000)。 -/
def copyrightCancellationFee : Money := 1_000

-- 【十一 出版権の登録】

/-- 十一（一） 出版権の設定の登録 — 出版権一件につき三万円 (¥30,000)。 -/
def publishingRightEstablishmentFee : Money := 30_000

/-- 十一（二）イ 相続又は法人の合併による移転の登録 — 出版権一件につき三千円 (¥3,000)。 -/
def publishingRightTransferInheritanceOrMergerFee : Money := 3_000

/-- 十一（二）ロ その他の原因による移転の登録 — 出版権一件につき一万八千円 (¥18,000)。 -/
def publishingRightTransferOtherFee : Money := 18_000

/-- 十一（四）イ 質権の移転・相続又は法人の合併 — 出版権一件につき千五百円 (¥1,500)。 -/
def publishingRightPledgeTransferInheritanceOrMergerFee : Money := 1_500

/-- 十一（四）ロ 質権の移転・その他の原因 — 出版権一件につき三千円 (¥3,000)。 -/
def publishingRightPledgeTransferOtherFee : Money := 3_000

/-- 十一（五）ロ 質権以外の権利の信託の登録 — 出版権一件につき三千円 (¥3,000)。 -/
def publishingRightTrustOtherRightFee : Money := 3_000

/-- 十一（六） 抹消した登録の回復の登録又は登録の更正若しくは変更の登録 —
    出版権一件につき千円 (¥1,000)。 -/
def publishingRightRestorationOrCorrectionFee : Money := 1_000

/-- 十一（七） 登録の抹消 — 出版権一件につき千円 (¥1,000)。 -/
def publishingRightCancellationFee : Money := 1_000

-- 【十二 著作隣接権の登録】

/-- 十二（一）イ 相続又は法人の合併による移転の登録 — 著作隣接権一件につき三千円 (¥3,000)。 -/
def relatedRightTransferInheritanceOrMergerFee : Money := 3_000

/-- 十二（一）ロ その他の原因による移転の登録 — 著作隣接権一件につき九千円 (¥9,000)。 -/
def relatedRightTransferOtherFee : Money := 9_000

/-- 十二（三）イ 質権の移転・相続又は法人の合併 — 著作隣接権一件につき千五百円 (¥1,500)。 -/
def relatedRightPledgeTransferInheritanceOrMergerFee : Money := 1_500

/-- 十二（三）ロ 質権の移転・その他の原因 — 著作隣接権一件につき三千円 (¥3,000)。 -/
def relatedRightPledgeTransferOtherFee : Money := 3_000

/-- 十二（四）ロ 質権以外の権利の信託の登録 — 著作隣接権一件につき三千円 (¥3,000)。 -/
def relatedRightTrustOtherRightFee : Money := 3_000

/-- 十二（五） 抹消した登録の回復の登録又は登録の更正若しくは変更の登録 —
    著作隣接権一件につき千円 (¥1,000)。 -/
def relatedRightRestorationOrCorrectionFee : Money := 1_000

/-- 十二（六） 登録の抹消 — 著作隣接権一件につき千円 (¥1,000)。 -/
def relatedRightCancellationFee : Money := 1_000


/-! === well-definedness（positivity） === -/

theorem copyrightPledgeEstablishmentRate_den_pos :
    0 < copyrightPledgeEstablishmentRate.den := by decide
theorem copyrightPledgeTrustRate_den_pos :
    0 < copyrightPledgeTrustRate.den := by decide
theorem publishingRightPledgeEstablishmentRate_den_pos :
    0 < publishingRightPledgeEstablishmentRate.den := by decide
theorem publishingRightPledgeTrustRate_den_pos :
    0 < publishingRightPledgeTrustRate.den := by decide
theorem relatedRightPledgeEstablishmentRate_den_pos :
    0 < relatedRightPledgeEstablishmentRate.den := by decide
theorem relatedRightPledgeTrustRate_den_pos :
    0 < relatedRightPledgeTrustRate.den := by decide

theorem copyrightTransferInheritanceOrMergerFee_pos :
    copyrightTransferInheritanceOrMergerFee > 0 := by decide
theorem copyrightTransferOtherFee_pos :
    copyrightTransferOtherFee > 0 := by decide
theorem copyrightPledgeTransferInheritanceOrMergerFee_pos :
    copyrightPledgeTransferInheritanceOrMergerFee > 0 := by decide
theorem copyrightPledgeTransferOtherFee_pos :
    copyrightPledgeTransferOtherFee > 0 := by decide
theorem copyrightRealNameRegistrationFee_pos :
    copyrightRealNameRegistrationFee > 0 := by decide
theorem copyrightTrustOtherRightFee_pos :
    copyrightTrustOtherRightFee > 0 := by decide
theorem copyrightFirstPublicationDateRegistrationFee_pos :
    copyrightFirstPublicationDateRegistrationFee > 0 := by decide
theorem copyrightRestorationOrCorrectionFee_pos :
    copyrightRestorationOrCorrectionFee > 0 := by decide
theorem copyrightCancellationFee_pos :
    copyrightCancellationFee > 0 := by decide

theorem publishingRightEstablishmentFee_pos :
    publishingRightEstablishmentFee > 0 := by decide
theorem publishingRightTransferInheritanceOrMergerFee_pos :
    publishingRightTransferInheritanceOrMergerFee > 0 := by decide
theorem publishingRightTransferOtherFee_pos :
    publishingRightTransferOtherFee > 0 := by decide
theorem publishingRightPledgeTransferInheritanceOrMergerFee_pos :
    publishingRightPledgeTransferInheritanceOrMergerFee > 0 := by decide
theorem publishingRightPledgeTransferOtherFee_pos :
    publishingRightPledgeTransferOtherFee > 0 := by decide
theorem publishingRightTrustOtherRightFee_pos :
    publishingRightTrustOtherRightFee > 0 := by decide
theorem publishingRightRestorationOrCorrectionFee_pos :
    publishingRightRestorationOrCorrectionFee > 0 := by decide
theorem publishingRightCancellationFee_pos :
    publishingRightCancellationFee > 0 := by decide

theorem relatedRightTransferInheritanceOrMergerFee_pos :
    relatedRightTransferInheritanceOrMergerFee > 0 := by decide
theorem relatedRightTransferOtherFee_pos :
    relatedRightTransferOtherFee > 0 := by decide
theorem relatedRightPledgeTransferInheritanceOrMergerFee_pos :
    relatedRightPledgeTransferInheritanceOrMergerFee > 0 := by decide
theorem relatedRightPledgeTransferOtherFee_pos :
    relatedRightPledgeTransferOtherFee > 0 := by decide
theorem relatedRightTrustOtherRightFee_pos :
    relatedRightTrustOtherRightFee > 0 := by decide
theorem relatedRightRestorationOrCorrectionFee_pos :
    relatedRightRestorationOrCorrectionFee > 0 := by decide
theorem relatedRightCancellationFee_pos :
    relatedRightCancellationFee > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem rateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  change a * rate.num / rate.den ≤ b * rate.num / rate.den
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)


/-! === smoke（すべて kernel-decide） === -/

-- 税率定数: 分子・分母が原文どおり
example : copyrightPledgeEstablishmentRate.num = 4 := by decide
example : copyrightPledgeEstablishmentRate.den = 1000 := by decide
example : copyrightPledgeTrustRate.num = 2 := by decide
example : copyrightPledgeTrustRate.den = 1000 := by decide
example : publishingRightPledgeEstablishmentRate.num = 4 := by decide
example : publishingRightPledgeEstablishmentRate.den = 1000 := by decide
example : publishingRightPledgeTrustRate.num = 2 := by decide
example : publishingRightPledgeTrustRate.den = 1000 := by decide
example : relatedRightPledgeEstablishmentRate.num = 4 := by decide
example : relatedRightPledgeEstablishmentRate.den = 1000 := by decide
example : relatedRightPledgeTrustRate.num = 2 := by decide
example : relatedRightPledgeTrustRate.den = 1000 := by decide

-- 定額: 原文どおりの金額
example : copyrightTransferInheritanceOrMergerFee = 3_000 := by decide
example : copyrightTransferOtherFee = 18_000 := by decide
example : copyrightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : copyrightPledgeTransferOtherFee = 3_000 := by decide
example : copyrightRealNameRegistrationFee = 9_000 := by decide
example : copyrightTrustOtherRightFee = 3_000 := by decide
example : copyrightFirstPublicationDateRegistrationFee = 3_000 := by decide
example : copyrightRestorationOrCorrectionFee = 1_000 := by decide
example : copyrightCancellationFee = 1_000 := by decide
example : publishingRightEstablishmentFee = 30_000 := by decide
example : publishingRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : publishingRightTransferOtherFee = 18_000 := by decide
example : publishingRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : publishingRightPledgeTransferOtherFee = 3_000 := by decide
example : publishingRightTrustOtherRightFee = 3_000 := by decide
example : publishingRightRestorationOrCorrectionFee = 1_000 := by decide
example : publishingRightCancellationFee = 1_000 := by decide
example : relatedRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : relatedRightTransferOtherFee = 9_000 := by decide
example : relatedRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : relatedRightPledgeTransferOtherFee = 3_000 := by decide
example : relatedRightTrustOtherRightFee = 3_000 := by decide
example : relatedRightRestorationOrCorrectionFee = 1_000 := by decide
example : relatedRightCancellationFee = 1_000 := by decide

-- 割合型 4/1000（999→3, 1000→4）
example : copyrightPledgeEstablishmentFee 0 = 0 := by decide
example : copyrightPledgeEstablishmentFee 999 = 3 := by decide
example : copyrightPledgeEstablishmentFee 1000 = 4 := by decide
example : copyrightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide
example : publishingRightPledgeEstablishmentFee 0 = 0 := by decide
example : publishingRightPledgeEstablishmentFee 999 = 3 := by decide
example : publishingRightPledgeEstablishmentFee 1000 = 4 := by decide
example : publishingRightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide
example : relatedRightPledgeEstablishmentFee 0 = 0 := by decide
example : relatedRightPledgeEstablishmentFee 999 = 3 := by decide
example : relatedRightPledgeEstablishmentFee 1000 = 4 := by decide
example : relatedRightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide

-- 割合型 2/1000（999→1, 1000→2）
example : copyrightPledgeTrustFee 0 = 0 := by decide
example : copyrightPledgeTrustFee 999 = 1 := by decide
example : copyrightPledgeTrustFee 1000 = 2 := by decide
example : copyrightPledgeTrustFee 1_000_000 = 2_000 := by decide
example : publishingRightPledgeTrustFee 0 = 0 := by decide
example : publishingRightPledgeTrustFee 999 = 1 := by decide
example : publishingRightPledgeTrustFee 1000 = 2 := by decide
example : publishingRightPledgeTrustFee 1_000_000 = 2_000 := by decide
example : relatedRightPledgeTrustFee 0 = 0 := by decide
example : relatedRightPledgeTrustFee 999 = 1 := by decide
example : relatedRightPledgeTrustFee 1000 = 2 := by decide
example : relatedRightPledgeTrustFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryCopyrightFees
