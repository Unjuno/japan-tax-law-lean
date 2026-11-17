# STAGING — W-S（登録免許税法 別表第一（二）著作権・出版権・著作隣接権の登録手数料 L4 モデル）受け渡しメモ

> 実装担当 W-S からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryCopyrightFees.lean` | 新規 |
| `JapanTaxLaw/RegistryCopyrightFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryCopyrightFeesTests.lean` | 新規 |
| `docs/STAGING_WS.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / RegistrationQualificationFees /
RegistryRealEstateFeesP1* 各モジュールと同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_ip_A.txt`
（十 著作権の登録 / 十一 出版権の登録 / 十二 著作隣接権の登録、UTF-8、
raw 1,247 文字 / 正規化後 1,199 文字）。

Namespace: `JapanTaxLaw.RegistryCopyrightFees`（専用サブ名前空間。
`JapanTaxLaw` 直下の `realEstateMilleRate`（RegistrationTax.lean）等や
`RegistryRealEstateFeesP1*` と衝突しません）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`、`TaxRate`、`applyFloor`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額・率を確定（日本語数字 → Arabic）:

- **定額型 `Money` 定数 24 件**（一件／一個あたり単価、件数・個数の乗算は行わない）:
  - 十 著作権（9 件）: 三千円 3,000 / 一万八千円 18,000 / 千五百円 1,500 /
    三千円 3,000 / 九千円 9,000 / 三千円 3,000 / 三千円 3,000 /
    千円 1,000 / 千円 1,000
  - 十一 出版権（8 件）: 三万円 30,000 / 三千円 3,000 / 一万八千円 18,000 /
    千五百円 1,500 / 三千円 3,000 / 三千円 3,000 / 千円 1,000 / 千円 1,000
  - 十二 著作隣接権（7 件）: 三千円 3,000 / 九千円 9,000 / 千五百円 1,500 /
    三千円 3,000 / 三千円 3,000 / 千円 1,000 / 千円 1,000
- **割合型 6 件**（税率定数 `TaxRate` + 税額関数 `base.applyFloor` =
  課税標準 × X / 1000、切り捨て。分母はすべて 1000）:
  - 質権設定又は処分の制限（債権金額千分の四 = 4/1000）:
    十（二）・十一（三）・十二（二）
  - 質権の信託（債権金額千分の二 = 2/1000）:
    十（五）イ・十一（五）イ・十二（四）イ

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryCopyrightFees.lean` | 36（税率 6 + 税額関数 6 + 定額 24） | 31（税率分母正性 6 + 定額正性 24 + 単調性 1） | 60 |
| `RegistryCopyrightFeesSpec.lean` | 31（独立整数定式 6 + 定額 24 + `agree` 1） | 0 | 31 |
| `RegistryCopyrightFeesTests.lean` | 0 | 0 | 106 |

**名前付き宣言総数 98（67 + 31）、`by decide` の example は 197 件（60 + 31 + 106）。**

### 実装 def 一覧（`.lean`）

税率定数（`TaxRate`, 分母 1000）:
`copyrightPledgeEstablishmentRate`(4), `copyrightPledgeTrustRate`(2),
`publishingRightPledgeEstablishmentRate`(4), `publishingRightPledgeTrustRate`(2),
`relatedRightPledgeEstablishmentRate`(4), `relatedRightPledgeTrustRate`(2)。

税額関数（`Money → Money` = `Rate.applyFloor base`）:
`copyrightPledgeEstablishmentFee`, `copyrightPledgeTrustFee`,
`publishingRightPledgeEstablishmentFee`, `publishingRightPledgeTrustFee`,
`relatedRightPledgeEstablishmentFee`, `relatedRightPledgeTrustFee`。

定額定数（`Money`）:
`copyrightTransferInheritanceOrMergerFee`(3,000), `copyrightTransferOtherFee`(18,000),
`copyrightPledgeTransferInheritanceOrMergerFee`(1,500),
`copyrightPledgeTransferOtherFee`(3,000), `copyrightRealNameRegistrationFee`(9,000),
`copyrightTrustOtherRightFee`(3,000),
`copyrightFirstPublicationDateRegistrationFee`(3,000),
`copyrightRestorationOrCorrectionFee`(1,000), `copyrightCancellationFee`(1,000),
`publishingRightEstablishmentFee`(30,000),
`publishingRightTransferInheritanceOrMergerFee`(3,000),
`publishingRightTransferOtherFee`(18,000),
`publishingRightPledgeTransferInheritanceOrMergerFee`(1,500),
`publishingRightPledgeTransferOtherFee`(3,000),
`publishingRightTrustOtherRightFee`(3,000),
`publishingRightRestorationOrCorrectionFee`(1,000),
`publishingRightCancellationFee`(1,000),
`relatedRightTransferInheritanceOrMergerFee`(3,000),
`relatedRightTransferOtherFee`(9,000),
`relatedRightPledgeTransferInheritanceOrMergerFee`(1,500),
`relatedRightPledgeTransferOtherFee`(3,000),
`relatedRightTrustOtherRightFee`(3,000),
`relatedRightRestorationOrCorrectionFee`(1,000),
`relatedRightCancellationFee`(1,000)。

Spec: 上記税額関数に対応する `spec*Fee`（`(base * X) / 1000` の独立整数定式）6 本、
定額 `spec*` 24 本、一致確認 `agreeRegistryCopyrightFees : Bool`
（基底 `[0,1,99,100,249,250,999,1000,1001,12345,100000,1000000]` で impl ≡ spec を
`==` 比較）1 本。

Tests: 新規定理名なし、各税率定数の分子・分母・正性、各定額の金額・正性、
各割合型の端数境界（4/1000: 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49 /
2/1000: 499→0, 500→1, 999→1, 1000→2, 1001→2, 12345→24）の smoke（全て `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 課税標準（「債権金額」）、登録件数・著作物個数は **caller-established** と明記。
  本モジュールは与えられた値に税率・単価を適用する算術のみを扱い、値の算定手続は扱わない。
- 各区分への該当性（相続／法人の合併／その他の原因、質権の設定／処分の制限／質権の移転、
  質権の信託／質権以外の権利の信託、信託の登録を含むか、無名／変名著作物、
  第一発行年月日／第一公表年月日／創作年月日、回復／更正／変更／抹消 等）は
  **caller-established** とし、**Bool を金額式に入れていない**。
- 定額は「一件につき／一個につき」の **1 件・1 個あたり単価** のみを定義し、
  件数・個数を掛ける Nat 掛け算は行わない（呼び出し側が判断）。
- 割合型の丸めは `TaxRate.applyFloor`（切り捨て）を採用（per-law business data として
  明示）。割合型は `base` が小さいと 0 になり得るため strict positivity は主張せず、
  税率定数の `den_pos` と各税額関数の smoke を付与した。
- 十〜十二の号・区分以外、他の別表・条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 100〜120 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "十著作権の登録（著作権の信託の登録を含む。）（一）著作権の移転の登録イ相続又は法人の合併による移転の登録著作権の件数一件につき三千円ロその他の原因による移転の登録著作権の件数一件につき一万八千円（二）著作権を目的とする質権の設定又は著作権若",
    "（二）著作権を目的とする質権の設定又は著作権若しくは当該質権の処分の制限の登録債権金額千分の四（三）著作権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録著作権の件数一件につき千五百円ロその他の原因による",
    "（三）著作権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録著作権の件数一件につき千五百円ロその他の原因による移転の登録著作権の件数一件につき三千円（四）無名著作物又は変名著作物の著作者の実名登録著作物の数一個につき九千円（",
    "（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録著作権の件数一件につき三千円（六）第一発行年月日若しくは第一公表年月日又は創作年月日の登録著作権の件数又は著作物の数一件又",
    "（七）抹消した登録の回復の登録又は登録の更正若しくは変更の登録著作権の件数又は著作物の数一件又は一個につき千円（八）登録の抹消著作権の件数又は著作物の数一件又は一個につき千円十一出版権の登録（出版権の",
    "十一出版権の登録（出版権の信託の登録を含む。）（一）出版権の設定の登録出版権の件数一件につき三万円（二）出版権の移転の登録イ相続又は法人の合併による移転の登録出版権の件数一件につき三千円ロその他の原因による移転の登録出版権の件数一件につき一",
    "（二）出版権の移転の登録イ相続又は法人の合併による移転の登録出版権の件数一件につき三千円ロその他の原因による移転の登録出版権の件数一件につき一万八千円（三）出版権を目的とする質権の設定又は出版権若しくは当該質権の処分の制",
    "（四）出版権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録出版権の件数一件につき千五百円ロその他の原因による移転の登録出版権の件数一件につき三千円（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登",
    "（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録出版権の件数一件につき三千円（六）抹消した登録の回復の登録又は登録の更正若しくは変更の登録出版権の件数一件につき千円（七）登録の抹消出版権の件数一件につき千円十二",
    "十二著作隣接権の登録（著作隣接権の信託の登録を含む。）（一）著作隣接権の移転の登録イ相続又は法人の合併による移転の登録著作隣接権の件数一件につき三千円ロその他の原因による移転の登録著作隣接権の件数一件につき九千円（二）著作隣接権を目的とする",
    "（二）著作隣接権を目的とする質権の設定又は著作隣接権若しくは当該質権の処分の制限の登録債権金額千分の四（三）著作隣接権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録著作隣接権の件数一件につき千五百円ロそ",
    "（三）著作隣接権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録著作隣接権の件数一件につき千五百円ロその他の原因による移転の登録著作隣接権の件数一件につき三千円（四）信託の登録イ質権の信託の登録債権金額千",
    "（四）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録著作隣接権の件数一件につき三千円（五）抹消した登録の回復の登録又は登録の更正若しくは変更の登録著作隣接権の件数一件につき千円（六）登録の抹消著作隣接権の件数一件に"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 13 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）（著作権・出版権・著作隣接権の登録）↔ RegistryCopyrightFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 13 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryCopyrightFees JapanTaxLaw.RegistryCopyrightFeesSpec JapanTaxLaw.RegistryCopyrightFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WS_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **98 件**（実装 def 36 + theorem 31 + Spec def 31）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - 97 件が `does not depend on any axioms`。残り 1 件 `rateFee_mono` のみ
    `[propext]` に依存（**propext は許可**）。`Classical.choice` / `sorryAx` 不使用。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()`）:
  - 担当範囲原文 `reg_ip_A.txt`（正規化後 1,199 文字）:
    **13/13 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **13/13 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 127326 から
    そのまま一致（1,199 文字すべて逐語一致）。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み（担当範囲原文 `reg_ip_A.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 十（一）3,000/18,000 | 120 | 0/1 | 127326/1 | FOUND |
| 2 | 十（二）4/1000・（三）イ1,500 | 110 | 97/1 | 127423/1 | FOUND |
| 3 | 十（三）ロ3,000・（四）9,000・（五） | 120 | 144/1 | 127470/1 | FOUND |
| 4 | 十（五）ロ3,000・（六）3,000 | 100 | 263/1 | 127589/1 | FOUND |
| 5 | 十（七）1,000・（八）1,000 | 100 | 372/1 | 127698/1 | FOUND |
| 6 | 十一 header・（一）30,000・（二）イ3,000 | 120 | 459/1 | 127785/1 | FOUND |
| 7 | 十一（二）ロ18,000・（三）4/1000 | 110 | 508/1 | 127834/1 | FOUND |
| 8 | 十一（四）イ1,500・ロ3,000・（五） | 120 | 630/1 | 127956/1 | FOUND |
| 9 | 十一（五）ロ3,000・（六）1,000・（七）1,000 | 120 | 712/1 | 128038/1 | FOUND |
| 10 | 十二 header・（一）イ3,000・ロ9,000 | 120 | 830/1 | 128156/1 | FOUND |
| 11 | 十二（二）4/1000・（三）イ1,500 | 110 | 936/1 | 128262/1 | FOUND |
| 12 | 十二（三）ロ3,000・（四）イ2/1000 | 110 | 987/1 | 128313/1 | FOUND |
| 13 | 十二（四）ロ3,000・（五）1,000・（六）1,000 | 120 | 1075/1 | 128401/1 | FOUND |

**FOUND 13 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 100〜120 文字。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` /
旧仮名遣い等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistryRealEstateFeesP1C*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryCopyrightFees.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）の著作権・出版権・著作隣接権の登録手数料（定額 24 件 1,000〜30,000 円 + 割合型 6 件 4/2 千分率、債権金額・件数・個数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryCopyrightFees.lean：著作権・出版権・著作隣接権の登録手数料を 24 定額型（一件/一個あたり 1,000〜30,000 円）+ 6 割合型（質権設定・処分制限 4/1000、質権の信託 2/1000、債権金額基準・切り捨て）でモデル化、債権金額・件数・個数・該当性は caller-established、他の号・条文は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryCopyrightFees
import JapanTaxLaw.RegistryCopyrightFeesSpec
import JapanTaxLaw.RegistryCopyrightFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-S は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 98 件（実装 def 36 + theorem 31 + Spec def 31）、
  `Classical.choice` / `sorryAx` なし。97 件 axiom-free、`rateFee_mono` 1 件のみ
  `[propext]` 依存（許可範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 13 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 100〜120）。
- **def 数**: 実装 36（税率 6 + 税額関数 6 + 定額 24）+ theorem 31 + Spec 31
  = **名前付き宣言 98**（＋ `by decide` の example 197 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WS.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（二）の**十 著作権の登録 / 十一 出版権の登録 /
  十二 著作隣接権の登録 のみ**。別表第一の他の号・他の条文、登録免許税の納付手続・
  端数処理の通則法的詳細は **NOT YET COVERED**。
- 課税標準（債権金額）・登録件数・著作物個数・各区分への該当性（相続・合併、
  その他の原因、質権設定／処分制限／質権移転、質権の信託／その他、信託を含むか、
  無名／変名、第一発行／公表／創作年月日、回復／更正／変更／抹消 等）はすべて
  caller-established とし、法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額は一件／一個あたり単価のみを定義し、件数・個数の掛け算はしていません。
- `agreeRegistryCopyrightFees` は有限点（12 基底）の `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+13 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-S は実行していません）。
