import JapanTaxLaw.TaxFinance

/-!
# RegistryCorporateSecurityFees — 登録免許税法 別表第一（二）六〜六の二・七〜九の物権系手数料モデル (W-X)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_prop_C.txt
  （六 企業担保権の登記 / 六の二 企業価値担保権の登記 /
    七 鉄道財団、軌道財団又は運河財団の登録 /
    八 動産の抵当権に関する登記又は登録 /
    九 動産の譲渡又は債権の譲渡若しくは質権の設定の登記）

原文の各 fee string を読み、定額型は `Money` 定数、割合型（「債権金額千分のX」等）は
`TaxRate ⟨X, 1000⟩` 定数と税額関数 `base.applyFloor`（= 課税標準 × X / 1000、
切り捨て）としてモデル化する。金額は日本語数字で検証して Arabic に変換。

  【六 企業担保権の登記】
  （一）設定 ........................ 債権金額千分の二・五 ..... 25/100000
  （二）移転 ........................ 債権金額千分の一・五 ..... 15/100000
  （三）順位の変更 .................. 企業担保権の件数一件につき六千円 .. 6,000
  （四）信託の登記 .................. 債権金額千分の一・五 ..... 15/100000
  （五）付記・仮登記・回復・更正/変更 .. 申請件数一件につき六千円 .... 6,000
  （六）登記の抹消 .................. 申請件数一件につき六千円 .... 6,000

  【六の二 企業価値担保権の登記】
  （一）設定 ........................ 企業価値担保権の件数一件につき三万円 30,000
  （二）移転 ........................ ...................六千円 ... 6,000
  （三）順位の変更 .................. ...................六千円 ... 6,000
  （四）信託の登記 .................. ...................六千円 ... 6,000
  （五）付記・回復・更正/変更 ........ 申請件数一件につき六千円 .... 6,000
  （六）登記の抹消 .................. 申請件数一件につき六千円 .... 6,000

  【七 鉄道財団、軌道財団又は運河財団の登録】
  （一）抵当権設定/強制競売・管理 ..... 債権金額又は極度金額千分の二・五 25/1000
  （二）抵当権の移転 ................ 債権金額又は極度金額千分の一・五 15/1000
  （三）根抵当権の一部譲渡/法人分割 ... 計算した金額千分の一・五 ..... 15/100000
  （四）抵当権の順位の変更 .......... 抵当権の件数一件につき六千円 ... 6,000
  （五）信託の登録 .................. 債権金額又は極度金額千分の一・五 15/1000
  （六）付記登録/更正・変更 .......... 財団の数一個につき六千円 ..... 6,000
  （七）登録の抹消 .................. 財団の数一個につき六千円 ..... 6,000

  【八 動産の抵当権に関する登記又は登録】
  （一）農業用動産: イ 設定 3/1000 / ロ 移転 15/1000 / ハ 一部譲渡 15/1000 /
      ニ 順位変更 1,000 / ホ 信託 15/1000 / ヘ 付記等 1,000 / ト 抹消 1,000
  （二）建設機械:   イ 設定 3/1000 / ロ 移転 15/1000 / ハ 一部譲渡 15/1000 /
      ニ 順位変更 1,000 / ホ 信託 15/1000 / ヘ 付記等 1,000 / ト 抹消 1,000
  （三）自動車:     イ 設定 3/1000 / ロ 移転 15/1000 / ハ 一部譲渡 15/1000 /
      ニ 信託 15/1000 / ホ 回復・更正/変更 1,000 / ヘ 登録の抹消 1,000

  【九 動産の譲渡又は債権の譲渡若しくは質権の設定の登記】
  （一）動産の譲渡 .................. 申請件数一件につき一万五千円 ... 15,000
  （二）債権の譲渡/質権の設定 ........ 申請件数一件につき一万五千円 ... 15,000
  （三）存続期間を延長する登記 ........ 申請件数一件につき七千五百円 ... 7,500
  （四）登記の抹消 .................. 申請件数一件につき千円 ....... 1,000

小数点表記「二・五」「一・五」は pinned のモデリング規約に従い分子 25 / 15
（分母 1000）として符号化する。原文の率文字列は各 doc-comment に一字も変えず保持する。

Scope & honest boundaries:

* 課税標準（「債権金額」「債権金額又は極度金額」「一部譲渡又は分割後の共有者の数で
  極度金額を除して計算した金額」）は **caller-established** とする。本モデルは与えられた
  `base` に税率を乗じる算術（および定額）のみを扱い、価額・債権金額の算定・評価は一切行わない。
* 各区分への該当性（設定／移転／順位の変更／信託／付記・仮登記・回復・更正・変更・抹消、
  強制競売若しくは強制管理の申立て、根抵当権の一部譲渡／法人の分割、財団・動産・
  建設機械・自動車の種別、信託の登録を含むか、存続期間の延長 等）は **caller-established**
  とし、Bool を金額式に入れない。
* 定額は「一件につき／一個につき／一両につき」の 1 件・1 個・1 両あたり単価のみを与え、
  件数・個数・両数を掛ける Nat 掛け算は行わない（これらは caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし当該区分に
  端数規定を持たないため、丸め規則は per-law business data として floor を採用した
  ことをここで明示する。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
  代わりに各税率定数の `den_pos`（well-definedness）と各税額関数の smoke を付与する。
* 別表第一の他の号・他の条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryCorporateSecurityFees

open JapanTaxLaw.TaxFinance

/-! === 割合型: 税率定数（分母 1000）+ 税額関数（applyFloor） === -/
/-- 六（一） 企業担保権の設定の登記 — 債権金額千分の二・五（pinned モデル num=25, den=1000）. -/
def corporateSecurityEstablishmentRate : TaxRate := ⟨25, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def corporateSecurityEstablishmentFee (base : Money) : Money := corporateSecurityEstablishmentRate.applyFloor base
/-- 六（二） 企業担保権の移転の登記 — 債権金額千分の一・五（pinned モデル num=15, den=1000）. -/
def corporateSecurityTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def corporateSecurityTransferFee (base : Money) : Money := corporateSecurityTransferRate.applyFloor base
/-- 六（四） 信託の登記 — 債権金額千分の一・五（pinned モデル num=15, den=1000）. -/
def corporateSecurityTrustRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def corporateSecurityTrustFee (base : Money) : Money := corporateSecurityTrustRate.applyFloor base
/-- 七（一） 抵当権の設定又は強制競売若しくは強制管理の申立ての登録 — 債権金額又は極度金額千分の二・五（num=25, den=1000）. -/
def railwayFoundationMortgageEstablishmentRate : TaxRate := ⟨25, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def railwayFoundationMortgageEstablishmentFee (base : Money) : Money := railwayFoundationMortgageEstablishmentRate.applyFloor base
/-- 七（二） 抵当権の移転の登録 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def railwayFoundationMortgageTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def railwayFoundationMortgageTransferFee (base : Money) : Money := railwayFoundationMortgageTransferRate.applyFloor base
/-- 七（三） 根抵当権の一部譲渡又は法人の分割による移転の登録 — 一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の一・五（num=15, den=1000）. -/
def railwayFoundationRootMortgagePartialTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def railwayFoundationRootMortgagePartialTransferFee (base : Money) : Money := railwayFoundationRootMortgagePartialTransferRate.applyFloor base
/-- 七（五） 信託の登録 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def railwayFoundationTrustRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def railwayFoundationTrustFee (base : Money) : Money := railwayFoundationTrustRate.applyFloor base
/-- 八（一）イ 農業用動産の抵当権の設定の登記 — 債権金額又は極度金額千分の三（num=3, den=1000）. -/
def agriculturalMovableMortgageEstablishmentRate : TaxRate := ⟨3, 1000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def agriculturalMovableMortgageEstablishmentFee (base : Money) : Money := agriculturalMovableMortgageEstablishmentRate.applyFloor base
/-- 八（一）ロ 農業用動産の抵当権の移転の登記 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def agriculturalMovableMortgageTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def agriculturalMovableMortgageTransferFee (base : Money) : Money := agriculturalMovableMortgageTransferRate.applyFloor base
/-- 八（一）ハ 農業用動産の根抵当権の一部譲渡又は法人の分割による移転の登記 — 計算した金額千分の一・五（num=15, den=1000）. -/
def agriculturalMovableRootMortgagePartialTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def agriculturalMovableRootMortgagePartialTransferFee (base : Money) : Money := agriculturalMovableRootMortgagePartialTransferRate.applyFloor base
/-- 八（一）ホ 農業用動産の抵当権の信託の登記 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def agriculturalMovableMortgageTrustRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def agriculturalMovableMortgageTrustFee (base : Money) : Money := agriculturalMovableMortgageTrustRate.applyFloor base
/-- 八（二）イ 建設機械の抵当権の設定の登記 — 債権金額又は極度金額千分の三（num=3, den=1000）. -/
def constructionMachineryMortgageEstablishmentRate : TaxRate := ⟨3, 1000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def constructionMachineryMortgageEstablishmentFee (base : Money) : Money := constructionMachineryMortgageEstablishmentRate.applyFloor base
/-- 八（二）ロ 建設機械の抵当権の移転の登記 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def constructionMachineryMortgageTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def constructionMachineryMortgageTransferFee (base : Money) : Money := constructionMachineryMortgageTransferRate.applyFloor base
/-- 八（二）ハ 建設機械の根抵当権の一部譲渡又は法人の分割による移転の登記 — 計算した金額千分の一・五（num=15, den=1000）. -/
def constructionMachineryRootMortgagePartialTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def constructionMachineryRootMortgagePartialTransferFee (base : Money) : Money := constructionMachineryRootMortgagePartialTransferRate.applyFloor base
/-- 八（二）ホ 建設機械の抵当権の信託の登記 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def constructionMachineryMortgageTrustRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def constructionMachineryMortgageTrustFee (base : Money) : Money := constructionMachineryMortgageTrustRate.applyFloor base
/-- 八（三）イ 自動車の抵当権の設定の登録 — 債権金額又は極度金額千分の三（num=3, den=1000）. -/
def automobileMortgageEstablishmentRate : TaxRate := ⟨3, 1000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def automobileMortgageEstablishmentFee (base : Money) : Money := automobileMortgageEstablishmentRate.applyFloor base
/-- 八（三）ロ 自動車の抵当権の移転の登録 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def automobileMortgageTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def automobileMortgageTransferFee (base : Money) : Money := automobileMortgageTransferRate.applyFloor base
/-- 八（三）ハ 自動車の根抵当権の一部譲渡又は法人の分割による移転の登録 — 計算した金額千分の一・五（num=15, den=1000）. -/
def automobileRootMortgagePartialTransferRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def automobileRootMortgagePartialTransferFee (base : Money) : Money := automobileRootMortgagePartialTransferRate.applyFloor base
/-- 八（三）ニ 自動車の抵当権の信託の登録 — 債権金額又は極度金額千分の一・五（num=15, den=1000）. -/
def automobileMortgageTrustRate : TaxRate := ⟨15, 10000, by decide⟩
/-- 上記税率を caller-established な課税標準 `base` に適用（切り捨て）。 -/
def automobileMortgageTrustFee (base : Money) : Money := automobileMortgageTrustRate.applyFloor base

/-! === 定額型: 一件／一個／一両あたりの Money 定数 === -/
/-- 六（三） 企業担保権の順位の変更の登記 — 企業担保権の件数一件につき六千円（¥6,000）。 -/
def corporateSecurityRankChangeFeePerCase : Money := 6000
/-- 六（五） 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき六千円（¥6,000）。 -/
def corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication : Money := 6000
/-- 六（六） 登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def corporateSecurityCancellationFeePerApplication : Money := 6000
/-- 六の二（一） 企業価値担保権の設定の登記 — 企業価値担保権の件数一件につき三万円（¥30,000）。 -/
def enterpriseValueSecurityEstablishmentFeePerCase : Money := 30000
/-- 六の二（二） 企業価値担保権の移転の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def enterpriseValueSecurityTransferFeePerCase : Money := 6000
/-- 六の二（三） 企業価値担保権の順位の変更の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def enterpriseValueSecurityRankChangeFeePerCase : Money := 6000
/-- 六の二（四） 信託の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def enterpriseValueSecurityTrustFeePerCase : Money := 6000
/-- 六の二（五） 付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき六千円（¥6,000）。 -/
def enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication : Money := 6000
/-- 六の二（六） 登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def enterpriseValueSecurityCancellationFeePerApplication : Money := 6000
/-- 七（四） 抵当権の順位の変更の登録 — 抵当権の件数一件につき六千円（¥6,000）。 -/
def railwayFoundationMortgageRankChangeFeePerCase : Money := 6000
/-- 七（六） 付記登録又は登録の更正若しくは変更の登録 — 財団の数一個につき六千円（¥6,000）。 -/
def railwayFoundationIncidentalOrCorrectionFeePerFoundation : Money := 6000
/-- 七（七） 登録の抹消 — 財団の数一個につき六千円（¥6,000）。 -/
def railwayFoundationCancellationFeePerFoundation : Money := 6000
/-- 八（一）ニ 農業用動産の抵当権の順位の変更の登記 — 抵当権の件数一件につき千円（¥1,000）。 -/
def agriculturalMovableMortgageRankChangeFeePerCase : Money := 1000
/-- 八（一）ヘ 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき千円（¥1,000）。 -/
def agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication : Money := 1000
/-- 八（一）ト 登記の抹消 — 申請件数一件につき千円（¥1,000）。 -/
def agriculturalMovableCancellationFeePerApplication : Money := 1000
/-- 八（二）ニ 建設機械の抵当権の順位の変更の登記 — 抵当権の件数一件につき千円（¥1,000）。 -/
def constructionMachineryMortgageRankChangeFeePerCase : Money := 1000
/-- 八（二）ヘ 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 建設機械の数一個につき千円（¥1,000）。 -/
def constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit : Money := 1000
/-- 八（二）ト 登記の抹消 — 建設機械の数一個につき千円（¥1,000）。 -/
def constructionMachineryCancellationFeePerUnit : Money := 1000
/-- 八（三）ホ 抹消した登録の回復の登録又は登録の更正若しくは変更の登録 — 自動車の数一両につき千円（¥1,000）。 -/
def automobileRestorationOrCorrectionFeePerVehicle : Money := 1000
/-- 八（三）ヘ 登録の抹消 — 自動車の数一両につき千円（¥1,000）。 -/
def automobileCancellationFeePerVehicle : Money := 1000
/-- 九（一） 動産の譲渡の登記 — 申請件数一件につき一万五千円（¥15,000）。 -/
def movableTransferFeePerApplication : Money := 15000
/-- 九（二） 債権の譲渡又は質権の設定の登記 — 申請件数一件につき一万五千円（¥15,000）。 -/
def claimTransferOrPledgeEstablishmentFeePerApplication : Money := 15000
/-- 九（三） （一）又は（二）に掲げる登記の存続期間を延長する登記 — 申請件数一件につき七千五百円（¥7,500）。 -/
def termExtensionFeePerApplication : Money := 7500
/-- 九（四） 登記の抹消 — 申請件数一件につき千円（¥1,000）。 -/
def movableOrClaimRegistrationCancellationFeePerApplication : Money := 1000

/-! === well-definedness（positivity） === -/
theorem corporateSecurityEstablishmentRate_den_pos : 0 < corporateSecurityEstablishmentRate.den := by decide
theorem corporateSecurityTransferRate_den_pos : 0 < corporateSecurityTransferRate.den := by decide
theorem corporateSecurityTrustRate_den_pos : 0 < corporateSecurityTrustRate.den := by decide
theorem railwayFoundationMortgageEstablishmentRate_den_pos : 0 < railwayFoundationMortgageEstablishmentRate.den := by decide
theorem railwayFoundationMortgageTransferRate_den_pos : 0 < railwayFoundationMortgageTransferRate.den := by decide
theorem railwayFoundationRootMortgagePartialTransferRate_den_pos : 0 < railwayFoundationRootMortgagePartialTransferRate.den := by decide
theorem railwayFoundationTrustRate_den_pos : 0 < railwayFoundationTrustRate.den := by decide
theorem agriculturalMovableMortgageEstablishmentRate_den_pos : 0 < agriculturalMovableMortgageEstablishmentRate.den := by decide
theorem agriculturalMovableMortgageTransferRate_den_pos : 0 < agriculturalMovableMortgageTransferRate.den := by decide
theorem agriculturalMovableRootMortgagePartialTransferRate_den_pos : 0 < agriculturalMovableRootMortgagePartialTransferRate.den := by decide
theorem agriculturalMovableMortgageTrustRate_den_pos : 0 < agriculturalMovableMortgageTrustRate.den := by decide
theorem constructionMachineryMortgageEstablishmentRate_den_pos : 0 < constructionMachineryMortgageEstablishmentRate.den := by decide
theorem constructionMachineryMortgageTransferRate_den_pos : 0 < constructionMachineryMortgageTransferRate.den := by decide
theorem constructionMachineryRootMortgagePartialTransferRate_den_pos : 0 < constructionMachineryRootMortgagePartialTransferRate.den := by decide
theorem constructionMachineryMortgageTrustRate_den_pos : 0 < constructionMachineryMortgageTrustRate.den := by decide
theorem automobileMortgageEstablishmentRate_den_pos : 0 < automobileMortgageEstablishmentRate.den := by decide
theorem automobileMortgageTransferRate_den_pos : 0 < automobileMortgageTransferRate.den := by decide
theorem automobileRootMortgagePartialTransferRate_den_pos : 0 < automobileRootMortgagePartialTransferRate.den := by decide
theorem automobileMortgageTrustRate_den_pos : 0 < automobileMortgageTrustRate.den := by decide
theorem corporateSecurityRankChangeFeePerCase_pos : corporateSecurityRankChangeFeePerCase > 0 := by decide
theorem corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication_pos : corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
theorem corporateSecurityCancellationFeePerApplication_pos : corporateSecurityCancellationFeePerApplication > 0 := by decide
theorem enterpriseValueSecurityEstablishmentFeePerCase_pos : enterpriseValueSecurityEstablishmentFeePerCase > 0 := by decide
theorem enterpriseValueSecurityTransferFeePerCase_pos : enterpriseValueSecurityTransferFeePerCase > 0 := by decide
theorem enterpriseValueSecurityRankChangeFeePerCase_pos : enterpriseValueSecurityRankChangeFeePerCase > 0 := by decide
theorem enterpriseValueSecurityTrustFeePerCase_pos : enterpriseValueSecurityTrustFeePerCase > 0 := by decide
theorem enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication_pos : enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
theorem enterpriseValueSecurityCancellationFeePerApplication_pos : enterpriseValueSecurityCancellationFeePerApplication > 0 := by decide
theorem railwayFoundationMortgageRankChangeFeePerCase_pos : railwayFoundationMortgageRankChangeFeePerCase > 0 := by decide
theorem railwayFoundationIncidentalOrCorrectionFeePerFoundation_pos : railwayFoundationIncidentalOrCorrectionFeePerFoundation > 0 := by decide
theorem railwayFoundationCancellationFeePerFoundation_pos : railwayFoundationCancellationFeePerFoundation > 0 := by decide
theorem agriculturalMovableMortgageRankChangeFeePerCase_pos : agriculturalMovableMortgageRankChangeFeePerCase > 0 := by decide
theorem agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication_pos : agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
theorem agriculturalMovableCancellationFeePerApplication_pos : agriculturalMovableCancellationFeePerApplication > 0 := by decide
theorem constructionMachineryMortgageRankChangeFeePerCase_pos : constructionMachineryMortgageRankChangeFeePerCase > 0 := by decide
theorem constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit_pos : constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit > 0 := by decide
theorem constructionMachineryCancellationFeePerUnit_pos : constructionMachineryCancellationFeePerUnit > 0 := by decide
theorem automobileRestorationOrCorrectionFeePerVehicle_pos : automobileRestorationOrCorrectionFeePerVehicle > 0 := by decide
theorem automobileCancellationFeePerVehicle_pos : automobileCancellationFeePerVehicle > 0 := by decide
theorem movableTransferFeePerApplication_pos : movableTransferFeePerApplication > 0 := by decide
theorem claimTransferOrPledgeEstablishmentFeePerApplication_pos : claimTransferOrPledgeEstablishmentFeePerApplication > 0 := by decide
theorem termExtensionFeePerApplication_pos : termExtensionFeePerApplication > 0 := by decide
theorem movableOrClaimRegistrationCancellationFeePerApplication_pos : movableOrClaimRegistrationCancellationFeePerApplication > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem corporateSecurityRateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  change a * rate.num / rate.den ≤ b * rate.num / rate.den
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! === smoke（すべて kernel-decide） === -/

-- 税率定数: 分子・分母が原文どおり
example : corporateSecurityEstablishmentRate.num = 25 := by decide
example : corporateSecurityEstablishmentRate.den = 10000 := by decide
example : corporateSecurityTransferRate.num = 15 := by decide
example : corporateSecurityTransferRate.den = 10000 := by decide
example : corporateSecurityTrustRate.num = 15 := by decide
example : corporateSecurityTrustRate.den = 10000 := by decide
example : railwayFoundationMortgageEstablishmentRate.num = 25 := by decide
example : railwayFoundationMortgageEstablishmentRate.den = 10000 := by decide
example : railwayFoundationMortgageTransferRate.num = 15 := by decide
example : railwayFoundationMortgageTransferRate.den = 10000 := by decide
example : railwayFoundationRootMortgagePartialTransferRate.num = 15 := by decide
example : railwayFoundationRootMortgagePartialTransferRate.den = 10000 := by decide
example : railwayFoundationTrustRate.num = 15 := by decide
example : railwayFoundationTrustRate.den = 10000 := by decide
example : agriculturalMovableMortgageEstablishmentRate.num = 3 := by decide
example : agriculturalMovableMortgageEstablishmentRate.den = 1000 := by decide
example : agriculturalMovableMortgageTransferRate.num = 15 := by decide
example : agriculturalMovableMortgageTransferRate.den = 10000 := by decide
example : agriculturalMovableRootMortgagePartialTransferRate.num = 15 := by decide
example : agriculturalMovableRootMortgagePartialTransferRate.den = 10000 := by decide
example : agriculturalMovableMortgageTrustRate.num = 15 := by decide
example : agriculturalMovableMortgageTrustRate.den = 10000 := by decide
example : constructionMachineryMortgageEstablishmentRate.num = 3 := by decide
example : constructionMachineryMortgageEstablishmentRate.den = 1000 := by decide
example : constructionMachineryMortgageTransferRate.num = 15 := by decide
example : constructionMachineryMortgageTransferRate.den = 10000 := by decide
example : constructionMachineryRootMortgagePartialTransferRate.num = 15 := by decide
example : constructionMachineryRootMortgagePartialTransferRate.den = 10000 := by decide
example : constructionMachineryMortgageTrustRate.num = 15 := by decide
example : constructionMachineryMortgageTrustRate.den = 10000 := by decide
example : automobileMortgageEstablishmentRate.num = 3 := by decide
example : automobileMortgageEstablishmentRate.den = 1000 := by decide
example : automobileMortgageTransferRate.num = 15 := by decide
example : automobileMortgageTransferRate.den = 10000 := by decide
example : automobileRootMortgagePartialTransferRate.num = 15 := by decide
example : automobileRootMortgagePartialTransferRate.den = 10000 := by decide
example : automobileMortgageTrustRate.num = 15 := by decide
example : automobileMortgageTrustRate.den = 10000 := by decide

-- 定額: 原文どおりの金額
example : corporateSecurityRankChangeFeePerCase = 6000 := by decide
example : corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : corporateSecurityCancellationFeePerApplication = 6000 := by decide
example : enterpriseValueSecurityEstablishmentFeePerCase = 30000 := by decide
example : enterpriseValueSecurityTransferFeePerCase = 6000 := by decide
example : enterpriseValueSecurityRankChangeFeePerCase = 6000 := by decide
example : enterpriseValueSecurityTrustFeePerCase = 6000 := by decide
example : enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : enterpriseValueSecurityCancellationFeePerApplication = 6000 := by decide
example : railwayFoundationMortgageRankChangeFeePerCase = 6000 := by decide
example : railwayFoundationIncidentalOrCorrectionFeePerFoundation = 6000 := by decide
example : railwayFoundationCancellationFeePerFoundation = 6000 := by decide
example : agriculturalMovableMortgageRankChangeFeePerCase = 1000 := by decide
example : agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication = 1000 := by decide
example : agriculturalMovableCancellationFeePerApplication = 1000 := by decide
example : constructionMachineryMortgageRankChangeFeePerCase = 1000 := by decide
example : constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit = 1000 := by decide
example : constructionMachineryCancellationFeePerUnit = 1000 := by decide
example : automobileRestorationOrCorrectionFeePerVehicle = 1000 := by decide
example : automobileCancellationFeePerVehicle = 1000 := by decide
example : movableTransferFeePerApplication = 15000 := by decide
example : claimTransferOrPledgeEstablishmentFeePerApplication = 15000 := by decide
example : termExtensionFeePerApplication = 7500 := by decide
example : movableOrClaimRegistrationCancellationFeePerApplication = 1000 := by decide

-- 割合型: 0 → 0, base=1000 → 分子の値
example : corporateSecurityEstablishmentFee 0 = 0 := by decide
example : corporateSecurityEstablishmentFee 1000 = 2 := by decide
example : corporateSecurityTransferFee 0 = 0 := by decide
example : corporateSecurityTransferFee 1000 = 1 := by decide
example : corporateSecurityTrustFee 0 = 0 := by decide
example : corporateSecurityTrustFee 1000 = 1 := by decide
example : railwayFoundationMortgageEstablishmentFee 0 = 0 := by decide
example : railwayFoundationMortgageEstablishmentFee 1000 = 2 := by decide
example : railwayFoundationMortgageTransferFee 0 = 0 := by decide
example : railwayFoundationMortgageTransferFee 1000 = 1 := by decide
example : railwayFoundationRootMortgagePartialTransferFee 0 = 0 := by decide
example : railwayFoundationRootMortgagePartialTransferFee 1000 = 1 := by decide
example : railwayFoundationTrustFee 0 = 0 := by decide
example : railwayFoundationTrustFee 1000 = 1 := by decide
example : agriculturalMovableMortgageEstablishmentFee 0 = 0 := by decide
example : agriculturalMovableMortgageEstablishmentFee 1000 = 3 := by decide
example : agriculturalMovableMortgageTransferFee 0 = 0 := by decide
example : agriculturalMovableMortgageTransferFee 1000 = 1 := by decide
example : agriculturalMovableRootMortgagePartialTransferFee 0 = 0 := by decide
example : agriculturalMovableRootMortgagePartialTransferFee 1000 = 1 := by decide
example : agriculturalMovableMortgageTrustFee 0 = 0 := by decide
example : agriculturalMovableMortgageTrustFee 1000 = 1 := by decide
example : constructionMachineryMortgageEstablishmentFee 0 = 0 := by decide
example : constructionMachineryMortgageEstablishmentFee 1000 = 3 := by decide
example : constructionMachineryMortgageTransferFee 0 = 0 := by decide
example : constructionMachineryMortgageTransferFee 1000 = 1 := by decide
example : constructionMachineryRootMortgagePartialTransferFee 0 = 0 := by decide
example : constructionMachineryRootMortgagePartialTransferFee 1000 = 1 := by decide
example : constructionMachineryMortgageTrustFee 0 = 0 := by decide
example : constructionMachineryMortgageTrustFee 1000 = 1 := by decide
example : automobileMortgageEstablishmentFee 0 = 0 := by decide
example : automobileMortgageEstablishmentFee 1000 = 3 := by decide
example : automobileMortgageTransferFee 0 = 0 := by decide
example : automobileMortgageTransferFee 1000 = 1 := by decide
example : automobileRootMortgagePartialTransferFee 0 = 0 := by decide
example : automobileRootMortgagePartialTransferFee 1000 = 1 := by decide
example : automobileMortgageTrustFee 0 = 0 := by decide
example : automobileMortgageTrustFee 1000 = 1 := by decide

end JapanTaxLaw.RegistryCorporateSecurityFees
