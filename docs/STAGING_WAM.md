# STAGING — W-AM（租税特別措置法施行令 第二十六条の二十七「公的年金等控除の最低控除額等の特例」bounded L4 モデル化）受け渡しメモ

> 実装担当 W-AM からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 他ワーカー（W-AK / W-AL）のファイル・既存モジュール・`data/*`・L7 CSV には触れていません。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialOrderPensionMinimum.lean` | 新規 |
| `JapanTaxLaw/SpecialOrderPensionMinimumSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialOrderPensionMinimumTests.lean` | 新規 |
| `docs/STAGING_WAM.md` | 新規（本ファイル） |

pinned source:

- law id `332CO0000000043`
- revision `332CO0000000043_20261101_507CO0000000127`
- amendment enforcement date `2026-11-01`
- raw snapshot: `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\special_order_L6.txt`
  （UTF-8、第二十六条の二十七、264 文字。pinned JSON の該当 Article 本文と逐語一致を確認済み。）

Namespace: `JapanTaxLaw.SpecialOrderPensionMinimum`（専用サブ名前空間。他ワーカー／既存モジュールと衝突なし）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`）。

## 1. 追加した def / theorem 一覧

原文を一字も誤らず読み、日本語金額リテラルを Arabic に変換して確定：

- 「百十八万円」→ `1_180_000`（所得税法施行令 第三百十九条の十二 の基底）
- 「百六十八万円」→ `1_680_000`（年齢65歳以上の読み替え）
- 「九十万円」→ `900_000`（第三百十九条の六第一項各号又は第二項第一号に掲げる公的年金等）
- 原文の数的関係: **九十万円 < 百十八万円 < 百六十八万円**（900,000 < 1,180,000 < 1,680,000）

### 実装（`SpecialOrderPensionMinimum.lean`）

| 名前 | 種別 | 内容 |
| --- | --- | --- |
| `baseMinimumDeduction` | `Money` 定数 | 基底「百十八万円」= 1,180,000 |
| `specialMinimumDeduction` | `Money` 定数 | 読み替え「百六十八万円」= 1,680,000 |
| `adjustedPensionMinimumDeduction` | `Money` 定数 | 括弧書「九十万円」= 900,000 |
| `minimumDeduction (isAge65OrOlder : Bool) (isAdjustedPension : Bool)` | 選択関数 | 65歳未満→1,180,000／65歳以上・調整対象→900,000／65歳以上・その他→1,680,000 |

定理 14 本: `baseMinimumDeduction_pos` / `specialMinimumDeduction_pos` /
`adjustedPensionMinimumDeduction_pos`（各定数の正性）、`adjusted_lt_base` / `adjusted_lt_special` /
`base_lt_special`（原文の数的関係）、`minimumDeduction_false_false` /
`minimumDeduction_false_true` / `minimumDeduction_true_false` / `minimumDeduction_true_true`
（4 通りの分岐・`rfl`）、`minimumDeduction_is_one_of`（選択値は 3 定数のいずれか）、
`minimumDeduction_pos`（選択値は常に正）、`minimumDeduction_le_special`（選択値 ≤ 1,680,000）、
`adjusted_le_minimumDeduction`（900,000 ≤ 選択値）。

`by decide` の smoke 7 件（定数値 3 + 4 通りの Bool 組合せ）。

### 独立定式（`SpecialOrderPensionMinimumSpec.lean`）

| 名前 | 内容 |
| --- | --- |
| `specBaseMinimumDeduction` | `118 * 10000`（原文リテラルから独立に置く） |
| `specSpecialMinimumDeduction` | `168 * 10000` |
| `specAdjustedPensionMinimumDeduction` | `90 * 10000` |
| `specMinimumDeduction` | impl の `if` に対し `match` による独立選択定式 |
| `agreePensionMinimumDeduction : Bool` | 4 通りの Bool 組合せで impl ≡ spec を `==` 比較 |

`example : agreePensionMinimumDeduction = true := by decide` ほか `by decide` 8 件。
Spec 定数は実装定数を参照せず、双方は `agree*` の有限点一致でのみ接続する
（法的意味の等価証明ではない）。

### 退行テスト（`SpecialOrderPensionMinimumTests.lean`）

`by decide` の kernel-decide smoke 18 件（3 定数の値・正性・数的関係、
4 通りの Bool 組合せ、65歳未満では年金種別にかかわらず基底、65歳以上では
調整対象が 900,000・その他が 1,680,000、選択値の範囲）。

### 名前付き宣言・例の数

| ファイル | def | theorem | example (`by decide`) |
| --- | --- | --- | --- |
| `SpecialOrderPensionMinimum.lean` | 4 | 14 | 7 |
| `SpecialOrderPensionMinimumSpec.lean` | 5 | 0 | 8 |
| `SpecialOrderPensionMinimumTests.lean` | 0 | 0 | 18 |

**名前付き宣言 23（4 + 14 + 5）、`by decide` の example 33 件（7 + 8 + 18）。**

### doc-comment に明記した射程

- `isAge65OrOlder`（第1項・第2項の「年齢が六十五歳以上」）と `isAdjustedPension`
  （第三百十九条の六第一項各号又は第二項第一号に掲げる公的年金等であるか）は
  **caller-established Bool**。第2項の判定基準日「その年十二月三十一日」、
  公的年金等の種別の認定、居住者性、公的年金等の支払の有無は本モジュール外の
  法的判断（基準日は doc-comment に記録するのみで計算には用いない）。
- **Bool は金額の算術には入れず**、原文から定めた 3 つの Money 定数の
  **選択にのみ**使う（`ConsumptionTaxRate.rateOf` / `DelinquencyTax.delinquencyRate` と同型）。
- 所得税法施行令 第三百十九条の十二 の最低控除額そのものの算定、
  第三百十九条の六 各号の具体的な列挙、公的年金等の金額、控除額の調整等の詳細は
  **NOT MODELLED**（すべて caller-established）。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は
担当範囲原文から一字も変えず抽出したものです。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は全角空白 U+3000 を含まず、長さ 69〜100 文字、正規化原文・pinned JSON
の両方で出現回数 1（一意）です。

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "（公的年金等控除の最低控除額等の特例）第二十六条の二十七年齢が六十五歳以上である居住者が所得税法第二百三条の七に規定する公的年金等の支払を受ける場合における所得税法施行令第三百十九条の十二の規定の適用",
    "については、同条中「百十八万円」とあるのは、「百六十八万円（同条に規定する公的年金等が第三百十九条の六第一項各号又は第二項第一号（公的年金等",
    "金等が第三百十九条の六第一項各号又は第二項第一号（公的年金等の金額から控除する金額の調整等）に掲げるものである場合にあつては、九十万円）」とする。２前",
    "場合にあつては、九十万円）」とする。２前項の居住者の年齢が六十五歳以上であるかどうかの判定は、その年十二月三十一日の年齢によるものとする。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本を一字も変えずに列挙）:

```python
yield ("租税特別措置法施行令 art. 26の27（公的年金等控除の最低控除額等の特例）↔ SpecialOrderPensionMinimum.lean",
       "332CO0000000043",
       "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.SpecialOrderPensionMinimum JapanTaxLaw.SpecialOrderPensionMinimumSpec JapanTaxLaw.SpecialOrderPensionMinimumTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。初回ビルドで
  （i）module doc-comment を `/--!` と記述したことによる `namespace` 構文エラー、
  （ii）数的関係を「百十八万円 < 九十万円」と誤記したことによる `decide` 反証、
  の 2 件が出たため、いずれも修正して再ビルド成功。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAM_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **23 件**（実装 def 4 + theorem 14 + Spec def 5）を走査。
  - **`Classical.choice` も `sorryAx` も 0 件**。
  - 22 件は `does not depend on any axioms`。
  - `minimumDeduction_is_one_of` のみ `propext` に依存（repo 通常パターン、許可範囲）。
- 原文逐語検証: **4/4 FOUND、MISS 0 件**（§5）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`special_order_L6.txt` の本文（264 文字）をそのまま haystack とし、
pinned JSON は `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化。
両者を `re.sub(r"[\s　]+", "", ...)` で正規化し、needle も同じ文字列で
Python `.find()` / `.count()` を実行（needle は U+3000 を含まない）。

| # | 区分 | len | 原文@/count | JSON@/count | U+3000 | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 見出し・年齢65歳以上・339条の12 | 100 | 0/1 | 666182/1 | なし | **FOUND** |
| 2 | 「百十八万円」→「百六十八万円」 | 70 | 100/1 | 666282/1 | なし | **FOUND** |
| 3 | 339条の6 各号・調整等・「九十万円」 | 75 | 140/1 | 666322/1 | なし | **FOUND** |
| 4 | 第2項・基準日「十二月三十一日」 | 69 | 195/1 | 666377/1 | なし | **FOUND** |

- **FOUND 4 / MISS 0**。アンカーの勝手な変更・正規化・文字変換はしていません
  （旧仮名遣い `にあつては` / `する。` / `２前項` 等も保持）。
- 一時検証スクリプト・出力・axiom probe はすべて削除済みです
  （担当範囲原文 `special_order_L6.txt` は残置）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・租税特別措置法施行令 関連行の付近に追加）:
  ```text
  JapanTaxLaw/SpecialOrderPensionMinimum.lean / -Spec.lean / -Tests.lean  # 租税特別措置法施行令 第26条の27（公的年金等控除の最低控除額等の特例: 百十八万円=1,180,000／百六十八万円=1,680,000／九十万円=900,000、年齢65歳以上・年金種別は caller-established Bool で選択、Bool は金額算術に入れない）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法施行令 第26条の27（SpecialOrderPensionMinimum.lean：339条の12 の「百十八万円」を年齢65歳以上で「百六十八万円」、339条の6 掲げる年金は「九十万円」に読み替える定数と選択をモデル化、年齢判定基準日・年金種別・該当性は caller-established、算術は非 Bool）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.SpecialOrderPensionMinimum
import JapanTaxLaw.SpecialOrderPensionMinimumSpec
import JapanTaxLaw.SpecialOrderPensionMinimumTests
```

（W-AM は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルにも触れていません。）

## 8. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 23 件（実装 def 4 + theorem 14 + Spec def 5）、
  `Classical.choice` / `sorryAx` なし。22 件 axiom-free、`minimumDeduction_is_one_of` は
  `propext` 依存（許可範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 4 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、
  長さ 69〜100 文字、U+3000 なし）。
- **def 数**: 名前付き宣言 **23**（実装 4 + 14、Spec 5）＋ `by decide` example 33 件。
  Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WAM.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 第二十六条の二十七 の **3 金額定数とその選択のみ**です。
  所得税法施行令 第三百十九条の十二 の最低控除額そのものの算定、
  第三百十九条の六 各号の具体的な列挙、公的年金等の金額、控除額の調整等の詳細、
  ならびに居住者性・支払の有無の判定は **NOT YET COVERED**。
- `agreePensionMinimumDeduction` は 4 通りの Bool 組合せの `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+4 needles）、
  `JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-AM は実行していません）。
