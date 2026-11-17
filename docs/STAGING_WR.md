# STAGING — W-R（登録免許税法 別表第一（一）区分（十一）〜（十五）の手数料 bounded L4 モデル）受け渡しメモ

> 実装担当 W-R からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryRealEstateFeesP1C.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1CSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1CTests.lean` | 新規 |
| `docs/STAGING_WR.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / RegistrationQualificationFees 各モジュールと同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\registry_app1_1_C.txt`
（区分（十一）〜（十五）、正規化済み・UTF-8、1,252 文字 / 正規化後 1,209 文字）。

Namespace: `JapanTaxLaw.RegistryRealEstateFeesP1C`（専用サブ名前空間。
`JapanTaxLaw` 直下の `realEstateMilleRate`（RegistrationTax.lean）等と衝突しません）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`、`TaxRate`、`applyFloor`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額・率を確定（日本語数字 → Arabic）:

- 割合型（税率定数 `TaxRate` + 税額関数 `課税標準 × X / 1000` floor）:
  （十一）イ 4/1000・ロ 2/1000 ／（十二）イ 2/1000・ロ(1) 2/1000・ロ(2) 2/1000・
  ロ(3) 10/1000・ハ(1) 5/1000・ハ(2) 1/1000・ハ(3) 1/1000・ハ(4) 5/1000・
  ニ 1/1000・ホ(1) 2/1000・**ホ(2) 1/1000（基準は「債権金額又は極度金額」＝債権金額基準）**・
  ホ(3) 1/1000・ヘ(1) 2/1000・ヘ(2) 1/1000 — 計 16 区分。
- 定額型 `Money` 定数:
  （十二）ト ¥1,000/個・（十三）イ ¥1,000/個・（十三）ロ ¥1,000/個・
  （十四）¥1,000/個・（十五）¥1,000/個・（十五）ただし書 二十個超 ¥20,000/件 — 計 6 定数。

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryRealEstateFeesP1C.lean` | 38（税率 16 + 税額関数 16 + 定額 6） | 22（税率分母正性 16 + 定額正性 6） | 39 |
| `RegistryRealEstateFeesP1CSpec.lean` | 23（独立整数定式 16 + 定額 6 + `agree` 1） | 0 | 23 |
| `RegistryRealEstateFeesP1CTests.lean` | 0 | 0 | 56 |

**名前付き宣言総数 83（38 + 22 + 23）、`by decide` の example は 118 件。**

### 実装 def 一覧（`.lean`）

税率定数（`TaxRate`, 分母 1000）:
`inheritanceSeparationOwnershipRate`(4), `inheritanceSeparationOtherRate`(2),
`provisionalOwnershipPreservationRate`(2), `provisionalTransferInheritanceMergerRate`(2),
`provisionalTransferCoOwnershipDivisionRate`(2), `provisionalTransferOtherRate`(10),
`provisionalSettingLeaseRate`(5), `provisionalInheritanceMergerTransferRate`(1),
`provisionalCoOwnershipDivisionTransferRate`(1), `provisionalOtherTransferRate`(5),
`provisionalSpouseResidenceRightRate`(1), `provisionalTrustOwnershipRate`(2),
`provisionalTrustLienRate`(1, 債権金額基準), `provisionalTrustOtherRightRate`(1),
`provisionalSeparationOwnershipRate`(2), `provisionalSeparationOtherRate`(1)。

税額関数（`Money → Money` = `Rate.applyFloor base`）:
`inheritanceSeparationOwnershipFee`, `inheritanceSeparationOtherFee`,
`provisionalOwnershipPreservationFee`, `provisionalTransferInheritanceMergerFee`,
`provisionalTransferCoOwnershipDivisionFee`, `provisionalTransferOtherFee`,
`provisionalSettingLeaseFee`, `provisionalInheritanceMergerTransferFee`,
`provisionalCoOwnershipDivisionTransferFee`, `provisionalOtherTransferFee`,
`provisionalSpouseResidenceRightFee`, `provisionalTrustOwnershipFee`,
`provisionalTrustLienFee`, `provisionalTrustOtherRightFee`,
`provisionalSeparationOwnershipFee`, `provisionalSeparationOtherFee`。

定額定数（`Money`）:
`provisionalOtherPerItemFee`, `displayChangeParcelPerItemFee`,
`displayChangeMergerPerItemFee`, `additionalRegistrationPerItemFee`,
`cancellationPerItemFee`（各 1,000）, `cancellationOver20PerCaseFee`（20,000）。

Spec: 上記税額関数に対応する `spec*Fee`（`(base * X) / 1000` の独立整数定式）16 本、
`spec*PerItemFee` / `specCancellationOver20PerCaseFee` 6 本、
一致確認 `agreeRegistryRealEstateFeesP1C : Bool`（基底
`[0,1,999,1000,1001,12345,100_000,1_000_000]` で impl ≡ spec を `==` 比較）1 本。

Tests: 新規定理名なし、各税額関数に基底 999/1000/100_000 の端数境界 smoke、
定額定数に一致・大小 smoke（全て `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 課税標準（不動産の価額／（十二）ホ(2) のみ債権金額又は極度金額）・不動産の個数・
  申請件数は **caller-established** と明記。本モジュールは与えられた値に税率・単価を
  適用する算術のみを扱い、値の算定手続は扱わない。
- 各区分への該当性（相続・法人合併、共有物の分割／その他、設定・転貸／移転、
  配偶者居住権、表題部の抹消の除外、二十個超 等）は **caller-established** とし、
  **Bool を金額式に入れていない**。
- （十五）の「同一の申請書により二十個を超える…一件につき二万円」は
  **両方の定数**（`cancellationPerItemFee` = 1,000 と
  `cancellationOver20PerCaseFee` = 20,000）を定義しただけで、
  適用判定（二十個超か否か）は式に入れていません（呼び出し側が判断）。
- 区分（一）〜（十）は W-R の担当外につき NOT YET COVERED。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 74〜130 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "（十一）相続財産の分離の登記イ所有権の分離の登記不動産の価額千分の四ロ所有権以外の権利の分離の登記不動産の価額千分の二（十二）仮登記イ所有権の保存の仮登記又は保",
    "イ所有権の保存の仮登記又は保存の請求権の保全のための仮登記不動産の価額千分の二ロ所有権の移転の仮登記又は移転の請求権の保全のための仮登記（１）相続又は法人の合併による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の二（２）共有物の分割による移",
    "共有物の分割による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の二（３）その他の原因による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の十ハ地上権、永小作権、賃借権若しく",
    "設定若しくは転貸の仮登記又は設定若しくは転貸の請求権の保全のための仮登記不動産の価額千分の五（２）相続又は法人の合併による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価",
    "相続又は法人の合併による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の一（３）共有に係る権利の分割による移転の仮登記又は移転の請求権の保全のための仮登記不動産の",
    "共有に係る権利の分割による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の一（４）その他の原因による移転の仮登記又は移転の請求権の保全のための仮登記不動産の価額千",
    "配偶者居住権の設定の仮登記不動産の価額千分の一ホ信託の仮登記又は信託の設定の請求権の保全のための仮登記（１）所有権の信託の仮登記又は信託の設定の請求権の保全のた",
    "所有権の信託の仮登記又は信託の設定の請求権の保全のための仮登記不動産の価額千分の二（２）先取特権、質権若しくは抵当権の信託の仮登記又は信託の設定の請求権の保全のための仮登記債権金額",
    "先取特権、質権若しくは抵当権の信託の仮登記又は信託の設定の請求権の保全のための仮登記債権金額又は極度金額千分の一（３）その他の権利の信託の仮登記又は信託の設定の請求権の保全のための",
    "その他の権利の信託の仮登記又は信託の設定の請求権の保全のための仮登記不動産の価額千分の一ヘ相続財産の分離の仮登記又は移転の請求権の保全のための仮登記（１）所有権の分離の仮登記又は移",
    "所有権の分離の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の二（２）所有権以外の権利の分離の仮登記又は移転の請求権の保全のための仮登記不動産の価額",
    "所有権以外の権利の分離の仮登記又は移転の請求権の保全のための仮登記不動産の価額千分の一トその他の仮登記不動産の個数一個につき千円（十三）所有権の登記のある不動産",
    "土地の分筆又は建物の分割若しくは区分による登記事項の変更の登記分筆又は分割若しくは区分後の不動産の個数一個につき千円ロ土地の合筆又は建物の合併による登記事項の変",
    "土地の合筆又は建物の合併による登記事項の変更の登記合筆又は合併後の不動産の個数一個につき千円（十四）付記登記、抹消された登記の回復の登記又は登記事項の更正若しく",
    "（十四）付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうち、（一）から（十三）までに掲げるもの及び土地又は建物の表示に関するものを除く。）不動産の個数一個につ",
    "（十五）登記の抹消（土地又は建物の表題部の登記の抹消を除く。）不動産の個数一個につき千円（同一の申請書により二十個を超える不動産について登記の抹消を受ける場合に",
    "の登記の抹消を除く。）不動産の個数一個につき千円（同一の申請書により二十個を超える不動産について登記の抹消を受ける場合には、申請件数一件につき二万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 17 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（一）（十一）〜（十五）↔ RegistryRealEstateFeesP1C.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 17 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryRealEstateFeesP1C JapanTaxLaw.RegistryRealEstateFeesP1CSpec JapanTaxLaw.RegistryRealEstateFeesP1CTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WRAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **83 件**（実装 def 38 + theorem 22 + Spec def 23）を走査。
  - `Classical.choice` / `sorryAx` / `propext` は **いずれも 0 件**、
    **83 件すべてが `does not depend on any axioms`**。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()`）:
  - 担当範囲原文 `registry_app1_1_C.txt`（正規化後 1,209 文字）:
    **17/17 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **17/17 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 120573 から
    そのまま一致（1,209 文字すべて逐語一致）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | （十一）4/1000・2/1000 | 80 | 0/1 | 120573/1 | FOUND |
| 2 | （十二）イ2/1000・ロ(1)2/1000 | 130 | 66/1 | 120639/1 | FOUND |
| 3 | （十二）ロ(2)2/1000・ロ(3)10/1000 | 105 | 186/1 | 120759/1 | FOUND |
| 4 | （十二）ハ(1)5/1000 | 90 | 341/1 | 120914/1 | FOUND |
| 5 | （十二）ハ(2)1/1000 | 90 | 390/1 | 120963/1 | FOUND |
| 6 | （十二）ハ(3)1/1000 | 90 | 439/1 | 121012/1 | FOUND |
| 7 | （十二）ニ1/1000 | 80 | 533/1 | 121106/1 | FOUND |
| 8 | （十二）ホ(1)2/1000 | 90 | 587/1 | 121160/1 | FOUND |
| 9 | （十二）ホ(2) 債権金額1/1000 | 90 | 631/1 | 121204/1 | FOUND |
| 10 | （十二）ホ(3)1/1000 | 90 | 690/1 | 121263/1 | FOUND |
| 11 | （十二）ヘ(1)2/1000・ヘ(2)1/1000 | 80 | 767/1 | 121340/1 | FOUND |
| 12 | （十二）ヘ(2)・ト 一個千円 | 80 | 808/1 | 121381/1 | FOUND |
| 13 | （十三）イ 一個千円 | 80 | 906/1 | 121479/1 | FOUND |
| 14 | （十三）ロ 一個千円 | 80 | 965/1 | 121538/1 | FOUND |
| 15 | （十四）一個千円 | 100 | 1011/1 | 121584/1 | FOUND |
| 16 | （十五）一個千円・二十個超 | 80 | 1114/1 | 121687/1 | FOUND |
| 17 | （十五）一件二万円 | 74 | 1134/1 | 121707/1 | FOUND |

**FOUND 17 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 74〜130 文字。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` /
旧仮名遣い等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistrationQualificationFeesP3C*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryRealEstateFeesP1C.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（一）区分（十一）〜（十五）の手数料（割合型 4/2/10/5/1 千分率 + 定額 一個千円・二十個超一件二万円、課税標準・個数・件数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（一）（十一）〜（十五）（RegistryRealEstateFeesP1C.lean：相続財産分離・仮登記・表示変更・付記登記・登記抹消の手数料を 16 割合型（税率定数 + 価額/債権金額 × X/1000）+ 6 定額型（一個千円・二十個超一件二万円）でモデル化、該当性・個数・二十個超判定は caller-established、（一）〜（十）は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryRealEstateFeesP1C
import JapanTaxLaw.RegistryRealEstateFeesP1CSpec
import JapanTaxLaw.RegistryRealEstateFeesP1CTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-R は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 83 件（実装 def 38 + theorem 22 + Spec def 23）、
  `Classical.choice` / `sorryAx` / `propext` なし、全件 axiom-free（一時ファイルは削除済み）。
- **逐語**: FOUND 17 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 74〜130）。
- **def 数**: 実装 38（税率 16 + 税額関数 16 + 定額 6）+ theorem 22 + Spec 23
  = **名前付き宣言 83**（＋ `by decide` の example 118 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WR.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（一）**区分（十一）〜（十五）のみ**。
  区分（一）〜（十）、他の別表・条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。
- 課税標準・個数・申請件数・各区分への該当性（相続・合併、共有分割、設定・転貸、
  配偶者居住権、表題部抹消の除外、二十個超 等）はすべて caller-established とし、
  法的判断の自動化・Bool の金額式への組込みはしていません。
- （十五）の二十個超は「両方の定数を定義する」方式を採り、適用判定は式に入れていません。
  どの定数を適用するかはメインセッション／呼び出し側の判断に委ねます。
- `agreeRegistryRealEstateFeesP1C` は有限点（8 基底）の `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+17 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-R は実行していません）。
