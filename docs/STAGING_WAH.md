# STAGING — W-AH（地方税法施行令 第九条の十四・第九条の十八／政令で定める率 百分の九十九）受け渡しメモ

> 実装担当 W-AH からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxOrderRate99A.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOrderRate99ASpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOrderRate99ATests.lean` | 新規 |
| `docs/STAGING_WAH.md` | 新規（本ファイル） |

pinned source:

- law id `325CO0000000245`
- revision `325CO0000000245_20261101_508CO0000000083`
- 正規化済み原文: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_L1.txt`（第九条の十四、56 文字）
  および `...\local_order_L2.txt`（第九条の十八、56 文字）
  （本メモの needles はすべてこのファイルから一字も変えず抽出、**全角空白 U+3000 を含みません**）
- 照合先 JSON: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
  （flatten テキストが L1/L2 ファイルと一致することを確認済み）

名前空間は `JapanTaxLaw.LocalTaxOrderRate99A`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` / `TaxRate` / `applyFloor` は `JapanTaxLaw.TaxFinance` を import して利用。

原文は「政令で定める率は、百分の九十九とする」（整数百分率 99/100）。
小数点率（分母 10000 バグ対象）ではないため分母は **100** のまま（念のため確認済み）。

## 1. 追加した def / theorem 一覧

### 実装（`LocalTaxOrderRate99A.lean`）— 4 def / 9 theorem

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 9 の 14 | `art14Rate` | 原文「百分の九十九」= `TaxRate := ⟨99, 100, by decide⟩` |
| 9 の 18 | `art18Rate` | 同上（第九条の十八）= `⟨99, 100, by decide⟩` |
| 9 の 14 | `art14Tax` | 税額 = 課税標準 × 99/100 = `art14Rate.applyFloor base` |
| 9 の 18 | `art18Tax` | 税額 = 課税標準 × 99/100 = `art18Rate.applyFloor base` |

theorem 9 本（いずれもモデル性質のみ）:

- `art14Rate_numDen` / `art18Rate_numDen`（`= (99, 100)`、`rfl`）
- `ratesEqual`（両条の率は同値、`rfl`）
- `art14Tax_eq` / `art18Tax_eq`（`= base * 99 / 100`、`rfl`）
- `art14Rate_den_pos` / `art18Rate_den_pos`（`0 < den`、型情報）
- `art14Tax_le` / `art18Tax_le`（適用率 ≤ 1 なので税額 ≤ 課税標準）

kernel-decide の `example` は実装 20 件、Spec 13 件（agree 4 件含む）、Tests 18 件の計 51 件。

### 独立定式（`LocalTaxOrderRate99ASpec.lean`）— 6 def

| 名前 | 内容 |
| --- | --- |
| `specRate99` | 原文「百分の九十九」を `TaxRate` なしで保持した `(99, 100)` |
| `specTax99` | 税額 = `base * 99 / 100`（独立整数式・切り捨て） |
| `agreeArt14Rate` | 率の impl ≡ spec（`==`、9 の 14） |
| `agreeArt18Rate` | 率の impl ≡ spec（`==`、9 の 18） |
| `agreeArt14Tax` | 税額の impl ≡ spec（12 点、`by decide`） |
| `agreeArt18Tax` | 税額の impl ≡ spec（12 点、`by decide`） |

### 退行テスト（`LocalTaxOrderRate99ATests.lean`）

`example : ... := by decide` の kernel-decide smoke 18 件。境界: 0、1、2、3、50（49.5→49）、
100（割り切れる）、101（99.99→99）、1000（990）、両条の一致。

### doc-comment に明記した射程

- 課税標準・法第七十一条の二十五第一項／第七十一条の四十七第一項の適用該当性は
  **すべて caller-established**。Bool は算定式に入れていない。
- 原文は率の定義のみであり、課税標準の定義・端数処理の細目・納付手続等は NOT MODELLED。
- 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる（原文に丸め細目の明記なし）。
- `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は 56 文字、全角空白 U+3000 を含みません。

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（法第七十一条の二十五第一項の率）第九条の十四法第七十一条の二十五第一項の政令で定める率は、百分の九十九とする。",
    "（法第七十一条の四十七第一項の率）第九条の十八法第七十一条の四十七第一項の政令で定める率は、百分の九十九とする。"
  ]
}
```

needle 1 = 第九条の十四（L1）、needle 2 = 第九条の十八（L2）。
参考変換例:

```python
yield ("地方税法施行令 9の14/9の18（政令で定める率 百分の九十九）↔ LocalTaxOrderRate99A.lean",
       "325CO0000000245",
       "file", None,
       [ ...上記 needles 2 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **2 needles** なので **+2**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxOrderRate99A JapanTaxLaw.LocalTaxOrderRate99ASpec JapanTaxLaw.LocalTaxOrderRate99ATests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAH_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新規定理・def 13 本（theorem 9 + agree def 4）＋ `by decide` smoke 4 本を検査。
    **`Classical.choice` も `sorryAx` も一切なし**。
  - 15 本は `does not depend on any axioms`。
  - 2 本（`art14Tax_le` / `art18Tax_le`）は `propext` に依存（repo 通常パターン、許容範囲）。
- 原文逐語検証: **2/2 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  L1/L2 ファイルと一致することも確認済み。needle はいずれも U+3000 を含みません。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 条文 | len | 全角空白 | raw@ | norm@ | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 9 の 14（L1 全文） | 56 | なし | 112160 | 112125 | **FOUND** |
| 2 | 9 の 18（L2 全文） | 56 | なし | 115349 | 115314 | **FOUND** |

- **FOUND 2 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxOrderRate99A.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 第9条の14（法71の25(1)）・第9条の18（法71の47(1)）の政令で定める率 百分の九十九（= 99/100、den=100）の L4 計算スライス・独立定式・退行テスト。課税標準・該当性は caller-established
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第9条の14（法71の25(1)）・第9条の18（法71の47(1)）（LocalTaxOrderRate99A.lean：政令で定める率 百分の九十九 = ⟨99,100⟩、税額 = 課税標準 × 99/100 切り捨て。課税標準・該当性は caller-established、小数点率ではないので分母100のまま）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxOrderRate99A
import JapanTaxLaw.LocalTaxOrderRate99ASpec
import JapanTaxLaw.LocalTaxOrderRate99ATests
```

（W-AH は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は第九条の十四・第九条の十八の率リテラル（百分の九十九）と税額算定式中核のみ。
  課税標準の定義、端数処理の細目、法第七十一条の二十五第一項／第七十一条の四十七第一項の
  適用判定、納付手続等は NOT YET COVERED（caller-established）。
- 原文は整数百分率（分母 100）であり、小数点率の分母 10000 バグ対象外であることを確認済み。
- `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+2）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AH は実行していません）。
