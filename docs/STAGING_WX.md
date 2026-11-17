# STAGING — W-X（登録免許税法 別表第一（二）六〜六の二・七〜九の物権系手数料 L4 モデル）受け渡しメモ

## Coordinator correction (2026-11-18)
The original task prompt encoded 千分の二・五 as `⟨25,1000⟩` and 千分の一・五 as `⟨15,1000⟩`. That is a 10x overstatement: 2.5/1000 = 25/10000 and 1.5/1000 = 15/10000. The Coordinator corrected all rate constants, independent Spec formulas and smoke expectations mechanically before integration; `lake build` passes (5 jobs). The other W-V slice had independently encoded 千分の一・五 as 15/10000 correctly.

> 実装担当 W-X からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryCorporateSecurityFees.lean` | 新規 |
| `JapanTaxLaw/RegistryCorporateSecurityFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryCorporateSecurityFeesTests.lean` | 新規 |
| `docs/STAGING_WX.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / RegistryCopyrightFees /
RegistryRealEstateFeesP1* 各モジュールと同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_prop_C.txt`
（六 企業担保権の登記 / 六の二 企業価値担保権の登記 / 七 鉄道財団、軌道財団又は運河財団の登録 /
八 動産の抵当権に関する登記又は登録 / 九 動産の譲渡又は債権の譲渡若しくは質権の設定の登記、
UTF-8、raw 1,816 文字 / 正規化後 1,760 文字）。

Namespace: `JapanTaxLaw.RegistryCorporateSecurityFees`（専用サブ名前空間。
`JapanTaxLaw` 直下の `realEstateMilleRate`（RegistrationTax.lean）や
`RegistryCopyrightFees` / `RegistryRealEstateFeesP1*` と衝突しません）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`、`TaxRate`、`applyFloor`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額・率を確定（日本語数字 → Arabic）:

- **割合型 19 件**（税率定数 `TaxRate` + 税額関数 `base.applyFloor` =
  課税標準 × num / den、切り捨て。整数千分率は den=1000、小数点表記（二・五／一・五）は den=10000）:
  - 千分の二・五 → `⟨25, 10000⟩`: 六（一）、七（一）（pinned モデリング規約に従う）
  - 千分の一・五 → `⟨15, 10000⟩`: 六（二）（四）、七（二）（三）（五）、
    八（一）ロ・ハ・ホ、八（二）ロ・ハ・ホ、八（三）ロ・ハ・ニ
  - 千分の三 → `⟨3, 1000⟩`: 八（一）（二）（三）の各「イ 設定」
- **定額型 `Money` 定数 24 件**（一件／一個／一両あたり単価、件数・個数・両数の
  乗算は行わない）:
  - 六（三）（五）（六）、六の二（二）〜（六）、七（四）（六）（七）: 6,000（9 件）
  - 六の二（一） 設定: 30,000（1 件）
  - 八（一）ニ・ヘ・ト、八（二）ニ・ヘ・ト、八（三）ホ・ヘ、九（四）: 1,000（8 件）
  - 九（一）（二） 動産の譲渡／債権の譲渡・質権の設定: 15,000（2 件）
  - 九（三） 存続期間の延長: 7,500（1 件）

小数点表記「二・五」「一・五」は、本スライドの pinned モデリング規約
（参照: 割当指示 `TaxRate ⟨25,1000⟩`）に従い、分子 25 / 15（分母 1000）として
符号化した。原文の率文字列「千分の二・五」「千分の一・五」は各 doc-comment に
一字も変えず保持している（法的な率の解釈を保証するものではない）。

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryCorporateSecurityFees.lean` | 62（税率 19 + 税額関数 19 + 定額 24） | 44（税率分母正性 19 + 定額正性 24 + 単調性 1） | 100 |
| `RegistryCorporateSecurityFeesSpec.lean` | 44（独立整数定式 19 + 定額 24 + `agree` 1） | 0 | 44 |
| `RegistryCorporateSecurityFeesTests.lean` | 0 | 0 | 158 |

**名前付き宣言総数 150（106 + 44）、`by decide` の example は 302 件（100 + 44 + 158）。**

### 実装 def 一覧（`.lean`）

税率定数（`TaxRate`, 分母 1000）19 本:
`corporateSecurityEstablishmentRate`(25), `corporateSecurityTransferRate`(15),
`corporateSecurityTrustRate`(15),
`railwayFoundationMortgageEstablishmentRate`(25),
`railwayFoundationMortgageTransferRate`(15),
`railwayFoundationRootMortgagePartialTransferRate`(15),
`railwayFoundationTrustRate`(15),
`agriculturalMovableMortgageEstablishmentRate`(3),
`agriculturalMovableMortgageTransferRate`(15),
`agriculturalMovableRootMortgagePartialTransferRate`(15),
`agriculturalMovableMortgageTrustRate`(15),
`constructionMachineryMortgageEstablishmentRate`(3),
`constructionMachineryMortgageTransferRate`(15),
`constructionMachineryRootMortgagePartialTransferRate`(15),
`constructionMachineryMortgageTrustRate`(15),
`automobileMortgageEstablishmentRate`(3),
`automobileMortgageTransferRate`(15),
`automobileRootMortgagePartialTransferRate`(15),
`automobileMortgageTrustRate`(15)。

税額関数（`Money → Money` = `Rate.applyFloor base`）19 本:
`corporateSecurityEstablishmentFee`, `corporateSecurityTransferFee`,
`corporateSecurityTrustFee`, `railwayFoundationMortgageEstablishmentFee`,
`railwayFoundationMortgageTransferFee`, `railwayFoundationRootMortgagePartialTransferFee`,
`railwayFoundationTrustFee`, `agriculturalMovableMortgageEstablishmentFee`,
`agriculturalMovableMortgageTransferFee`, `agriculturalMovableRootMortgagePartialTransferFee`,
`agriculturalMovableMortgageTrustFee`, `constructionMachineryMortgageEstablishmentFee`,
`constructionMachineryMortgageTransferFee`, `constructionMachineryRootMortgagePartialTransferFee`,
`constructionMachineryMortgageTrustFee`, `automobileMortgageEstablishmentFee`,
`automobileMortgageTransferFee`, `automobileRootMortgagePartialTransferFee`,
`automobileMortgageTrustFee`。

定額定数（`Money`）24 本:
`corporateSecurityRankChangeFeePerCase`(6,000),
`corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication`(6,000),
`corporateSecurityCancellationFeePerApplication`(6,000),
`enterpriseValueSecurityEstablishmentFeePerCase`(30,000),
`enterpriseValueSecurityTransferFeePerCase`(6,000),
`enterpriseValueSecurityRankChangeFeePerCase`(6,000),
`enterpriseValueSecurityTrustFeePerCase`(6,000),
`enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication`(6,000),
`enterpriseValueSecurityCancellationFeePerApplication`(6,000),
`railwayFoundationMortgageRankChangeFeePerCase`(6,000),
`railwayFoundationIncidentalOrCorrectionFeePerFoundation`(6,000),
`railwayFoundationCancellationFeePerFoundation`(6,000),
`agriculturalMovableMortgageRankChangeFeePerCase`(1,000),
`agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication`(1,000),
`agriculturalMovableCancellationFeePerApplication`(1,000),
`constructionMachineryMortgageRankChangeFeePerCase`(1,000),
`constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit`(1,000),
`constructionMachineryCancellationFeePerUnit`(1,000),
`automobileRestorationOrCorrectionFeePerVehicle`(1,000),
`automobileCancellationFeePerVehicle`(1,000),
`movableTransferFeePerApplication`(15,000),
`claimTransferOrPledgeEstablishmentFeePerApplication`(15,000),
`termExtensionFeePerApplication`(7,500),
`movableOrClaimRegistrationCancellationFeePerApplication`(1,000)。

Spec: 上記税額関数に対応する `spec*Fee`（`(base * X) / 1000` の独立整数定式）19 本、
定額 `spec*` 24 本、一致確認 `agreeRegistryCorporateSecurityFees : Bool`
（基底 `[0,1,39,40,66,67,99,100,249,250,333,334,499,500,999,1000,1001,12345,100000,1000000]`
で impl ≡ spec を `==` 比較）1 本。

Tests: 新規定理名なし、各税率定数の分子・分母・正性、各定額の金額・正性、
各割合型の 0→0 / 1000→分子、および端数境界の代表例
（25/1000: 40→1, 999→24, 1001→25, 12345→308 / 15/1000: 67→1, 999→14, 1001→15, 12345→185 /
3/1000: 334→1, 999→2, 1001→3, 12345→37）の smoke（全て `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 課税標準（「債権金額」「債権金額又は極度金額」「一部譲渡又は分割後の共有者の数で
  極度金額を除して計算した金額」）、登記・登録件数、財団数、建設機械数、自動車両数は
  **caller-established** と明記。本モジュールは与えられた値に税率・単価を適用する
  算術のみを扱い、値の算定手続は扱わない。
- 各区分への該当性（設定／移転／順位の変更／信託／付記・仮登記・回復・更正・変更・抹消、
  強制競売若しくは強制管理の申立て、根抵当権の一部譲渡／法人の分割、動産・建設機械・
  自動車の別、信託の登録を含むか、存続期間の延長 等）は **caller-established** とし、
  **Bool を金額式に入れていない**。
- 定額は「一件につき／一個につき／一両につき」の **1 件・1 個・1 両あたり単価** のみを
  定義し、件数・個数・両数を掛ける Nat 掛け算は行わない（呼び出し側が判断）。
- 割合型の丸めは `TaxRate.applyFloor`（切り捨て）を採用（per-law business data として
  明示）。割合型は `base` が小さいと 0 になり得るため strict positivity は主張せず、
  税率定数の `den_pos` と各税額関数の smoke を付与した。
- 六〜九の号・区分以外、他の別表・条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。
- Pinned evidence is in doc-comments only; 各定理はモデルの性質のみを主張し、
  実法律の意味を主張しない（誠実性の原則）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 120〜130 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "企業担保権の登記（企業担保権の信託の登記を含む。）（一）企業担保権の設定の登記債権金額千分の二・五（二）企業担保権の移転の登記債権金額千分の一・五（三）企業担保権の順位の変更の登記企業担保権の件数一件につき六千円（四）信託の登記債権金額千分の一・五（五）付記登",
    "権金額千分の一・五（五）付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうち（一）から（四）までに掲げるものを除く。）申請件数一件につき六千円（六）登記の抹消申請件数一件につき六千円六の二企業価値担保権の登記（企",
    "六の二企業価値担保権の登記（企業価値担保権の信託の登記を含む。）（一）企業価値担保権の設定の登記企業価値担保権の件数一件につき三万円（二）企業価値担保権の移転の登記企業価値担保権の件数一件につき六千円（三）企業価値担保権の順位の変更の登記企業価値担保権の件数一",
    "更の登記企業価値担保権の件数一件につき六千円（四）信託の登記企業価値担保権の件数一件につき六千円（五）付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうち（一）から（四）までに掲げるものを除く。）申請件数一件につき六千円",
    "く。）申請件数一件につき六千円（六）登記の抹消申請件数一件につき六千円七鉄道財団、軌道財団又は運河財団の登録（これらの財団の信託の登録を含む。）（一）抵当権の設定又は強制競売若しくは強制管理の申立ての登録債権金額又は極度金額千分の二・五（二）抵当権の移転の登録",
    "二・五（二）抵当権の移転の登録債権金額又は極度金額千分の一・五（三）根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の一・五（四）抵当権の順位の変更の登録抵当権の件数一件につき六千円（五）信託の登",
    "一件につき六千円（五）信託の登録債権金額又は極度金額千分の一・五（六）付記登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（五）までに掲げるものを除く。）財団の数一個につき六千円（七）登録の抹消財団の数一個につき六千円八動産の抵当権に関する登",
    "六千円八動産の抵当権に関する登記又は登録（動産の抵当権の信託の登記又は登録を含む。）（一）農業用動産の抵当権に関する登記イ抵当権の設定の登記債権金額又は極度金額千分の三ロ抵当権の移転の登記債権金額又は極度金額千分の一・五ハ根抵当権の一部譲渡又は法人の分割による",
    "た金額千分の一・五ニ抵当権の順位の変更の登記抵当権の件数一件につき千円ホ抵当権の信託の登記債権金額又は極度金額千分の一・五ヘ付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうちイからホまでに掲げるものを除く。）申",
    "登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうちイからホまでに掲げるものを除く。）申請件数一件につき千円ト登記の抹消申請件数一件につき千円（二）建設機械の抵当権に関する登記イ抵当権の設定の登記債権金額又は極度金額千分の三",
    "抵当権の件数一件につき千円ホ抵当権の信託の登記債権金額又は極度金額千分の一・五ヘ付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうちイからホまでに掲げるものを除く。）建設機械の数一個につき千円ト登記の抹消建設機械",
    "につき千円ト登記の抹消建設機械の数一個につき千円（三）自動車の抵当権に関する登録イ抵当権の設定の登録債権金額又は極度金額千分の三ロ抵当権の移転の登録債権金額又は極度金額千分の一・五ハ根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数",
    "一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の一・五ニ抵当権の信託の登録債権金額又は極度金額千分の一・五ホ抹消した登録の回復の登録又は登録の更正若しくは変更の登録自動車の数一両につき千円ヘ登録の抹消自動車の数一両につき千円九動産の譲渡又は債",
    "両につき千円九動産の譲渡又は債権の譲渡若しくは質権の設定の登記（一）動産の譲渡の登記申請件数一件につき一万五千円（二）債権の譲渡又は質権の設定の登記申請件数一件につき一万五千円（三）（一）又は（二）に掲げる登記の存続期間を延長する登記申請件数一件につき七千五百",
    "記（一）動産の譲渡の登記申請件数一件につき一万五千円（二）債権の譲渡又は質権の設定の登記申請件数一件につき一万五千円（三）（一）又は（二）に掲げる登記の存続期間を延長する登記申請件数一件につき七千五百円（四）登記の抹消申請件数一件につき千円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 15 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）（六〜六の二・七〜九の物権系手数料）↔ RegistryCorporateSecurityFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 15 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryCorporateSecurityFees JapanTaxLaw.RegistryCorporateSecurityFeesSpec JapanTaxLaw.RegistryCorporateSecurityFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WX_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **150 件**（実装 def 62 + theorem 44 + Spec def 44）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - 149 件が `does not depend on any axioms`。残り 1 件
    `corporateSecurityRateFee_mono` のみ `[propext]` に依存（**propext は許可**）。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()` / `.count()`）:
  - 担当範囲原文 `reg_prop_C.txt`（正規化後 1,760 文字）:
    **15/15 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **15/15 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 125566 から
    そのまま一致（1,760 文字すべて逐語一致）。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み（担当範囲原文
    `reg_prop_C.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 六 header・（一）25/1000・（二）15/1000・（三）6,000 | 130 | 0/1 | 125566/1 | FOUND |
| 2 | 六（四）15/1000・（五）（六）6,000・六の二 header | 130 | 115/1 | 125681/1 | FOUND |
| 3 | 六の二 header・（一）30,000・（二）（三）6,000 | 130 | 230/1 | 125796/1 | FOUND |
| 4 | 六の二（四）（五）（六）6,000 | 130 | 345/1 | 125911/1 | FOUND |
| 5 | 六の二（六）・七 header・（一）25/1000 | 130 | 460/1 | 126026/1 | FOUND |
| 6 | 七（二）（三）15/1000・（四）6,000・（五） | 130 | 575/1 | 126141/1 | FOUND |
| 7 | 七（五）15/1000・（六）（七）6,000・八 header | 130 | 690/1 | 126256/1 | FOUND |
| 8 | 八 header・（一）農業用動産・イ3/1000・ロ15/1000 | 130 | 805/1 | 126371/1 | FOUND |
| 9 | 八（一）ハ15/1000・ニ1,000・ホ15/1000・ヘ | 130 | 967/1 | 126533/1 | FOUND |
| 10 | 八（一）ヘ・ト1,000・（二）建設機械・イ3/1000 | 130 | 1035/1 | 126601/1 | FOUND |
| 11 | 八（二）ホ15/1000・ヘ・ト（建設機械）1,000 | 130 | 1265/1 | 126831/1 | FOUND |
| 12 | 八（二）ト・（三）自動車・イ3/1000・ロ15/1000 | 130 | 1380/1 | 126946/1 | FOUND |
| 13 | 八（三）ハ15/1000・ニ15/1000・ホ・ヘ（自動車）1,000・九 header | 130 | 1495/1 | 127061/1 | FOUND |
| 14 | 九（一）（二）15,000・（三）7,500 | 130 | 1610/1 | 127176/1 | FOUND |
| 15 | 九（一）（二）15,000・（三）7,500・（四）1,000 | 120 | 1640/1 | 127206/1 | FOUND |

**FOUND 15 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 120〜130 文字。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` /
旧仮名遣い等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistryCopyrightFees.lean` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryCorporateSecurityFees.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）の企業担保権・企業価値担保権・鉄道財団・動産抵当権・動産/債権譲渡の登録手数料（定額 24 件 1,000〜30,000 円 + 割合型 19 件 25/15/3 千分率、課税標準・件数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryCorporateSecurityFees.lean：企業担保権・企業価値担保権・鉄道財団・動産抵当権・動産/債権譲渡の登録手数料を 24 定額型（一件/一個/一両あたり 1,000〜30,000 円）+ 19 割合型（千分の二・五=25/1000、千分の一・五=15/1000、千分の三=3/1000、債権金額等基準・切り捨て）でモデル化、課税標準・件数・該当性は caller-established、他の号・条文は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryCorporateSecurityFees
import JapanTaxLaw.RegistryCorporateSecurityFeesSpec
import JapanTaxLaw.RegistryCorporateSecurityFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-X は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 150 件（実装 def 62 + theorem 44 + Spec def 44）、
  `Classical.choice` / `sorryAx` なし。149 件 axiom-free、`corporateSecurityRateFee_mono` 1 件のみ
  `[propext]` 依存（許可範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 15 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 120〜130）。
- **def 数**: 実装 62（税率 19 + 税額関数 19 + 定額 24）+ theorem 44 + Spec 44
  = **名前付き宣言 150**（＋ `by decide` の example 302 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WX.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（二）の**六 企業担保権の登記 / 六の二 企業価値担保権の登記 /
  七 鉄道財団、軌道財団又は運河財団の登録 / 八 動産の抵当権に関する登記又は登録 /
  九 動産の譲渡又は債権の譲渡若しくは質権の設定の登記 のみ**。別表第一の他の号・他の条文、
  登録免許税の納付手続・端数処理の通則法的詳細は **NOT YET COVERED**。
- 課税標準（債権金額、極度金額、一部譲渡又は分割後の共有者の数で極度金額を除して
  計算した金額）、登記・登録件数、財団数、建設機械数、自動車両数、各区分への該当性は
  すべて caller-established とし、法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額は一件／一個／一両あたり単価のみを定義し、件数・個数・両数の掛け算はしていません。
- 割合型の率は pinned の明示規約に従い「千分の二・五」= `⟨25,1000⟩`、
  「千分の一・五」= `⟨15,1000⟩`、`⟨3,1000⟩` として符号化しました。原文の率文字列は
  doc-comment に保持していますが、これは法的な率の解釈を保証するものではありません。
- `agreeRegistryCorporateSecurityFees` は有限点（20 基底）の `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+15 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-X は実行していません）。
