# STAGING — W-AG（地方税法施行令 第五十二条の十の二［NOT MODELLED］／第五十六条の八十九の六［bounded L4］）受け渡しメモ

> 実装担当 W-AG からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxInsuranceEstimate.lean` | 新規 |
| `JapanTaxLaw/LocalTaxInsuranceEstimateSpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxInsuranceEstimateTests.lean` | 新規 |
| `docs/STAGING_WAG.md` | 新規（本ファイル） |

pinned source:

- law id `325CO0000000245`
- revision `325CO0000000245_20261101_508CO0000000083`
- 正規化済み原文: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_K3.txt`（第五十二条の十の二、定義のみ）
  および `...\local_order_K4.txt`（第五十六条の八十九の六、UTF-8、215 文字）
  （本メモの needles はすべてこのファイルから一字も変えず抽出）
- 照合先 JSON: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
  （flatten テキストが K3/K4 ファイルと一致することを確認済み）

名前空間は `JapanTaxLaw.LocalTaxInsuranceEstimate`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

## 1. 追加した def / theorem 一覧

### 実装（`LocalTaxInsuranceEstimate.lean`）— 4 def

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 56 の 89 の 6 | `estimateHundredYenFloor` | 原文「百円未満の端数…切り捨てた金額」= `x / 100 * 100` |
| 56 の 89 の 6 | `insuranceTaxEstimateWithMultiplier` | 一般形: `floor100((前年度税額 / 除数) * 乗数)`。除数・乗数は caller-established |
| 56 の 89 の 6 | `insuranceTaxEstimate` | **pinned 原文忠実形**: `floor100((前年度税額 / 除数) * 12)`（十二で除し十二を乗じる） |
| 56 の 89 の 6 | `standardInsuranceTaxEstimate` | 通常ケース（除数 12）: `insuranceTaxEstimate p 12` |

theorem 14 本（いずれもモデル性質のみ）:

- `estimateHundredYenFloor_zero` / `_le` / `_id` / `_nonneg`
- `insuranceTaxEstimateWithMultiplier_eq`（rfl）/ `_zero_left` / `_zero_multiplier` / `_nonneg`
- `insuranceTaxEstimate_eq`（rfl）/ `_zero` / `_nonneg`
- `standardInsuranceTaxEstimate_eq`（rfl）/ `_zero` / `_nonneg`

kernel-decide の `example` は実装 22 件・Spec 11 件・agree 4 件・Tests 20 件の計 57 件。

### 独立定式（`LocalTaxInsuranceEstimateSpec.lean`）— 8 def

| 名前 | 内容 |
| --- | --- |
| `specEstimateHundredYenFloor` | 百円未満切り捨て（独立整数式） |
| `specInsuranceTaxEstimateWithMultiplier` | 一般形の独立整数式 |
| `specInsuranceTaxEstimate` | 原文忠実形の独立整数式 |
| `specStandardInsuranceTaxEstimate` | 通常ケースの独立整数式 |
| `agreeEstimateHundredYenFloorPoints` | 実装 ≡ spec（10 点、`by decide`） |
| `agreeStandardInsuranceEstimatePoints` | 実装 ≡ spec（12 点、`by decide`） |
| `agreeInsuranceEstimateDivisorPoints` | 除数変更点（8 点、`by decide`） |
| `agreeInsuranceEstimateWithMultiplierPoints` | 一般形（7 点、`by decide`） |

### 退行テスト（`LocalTaxInsuranceEstimateTests.lean`）

`example : ... := by decide` の kernel-decide smoke 20 件。境界: 税額 0、乗数 0
（委譲元要約の「納期数 0」読みに対応）、割り切れない額（100 / 1199 / 199）、
百円未満切り捨て、除数を月数（6 / 7 / 3）に変えた場合、原文形と一般形の一致。

### doc-comment に明記した射程

- 前年度分の国民健康保険税額、除数（十二、または納税義務発生月から前年度三月までの月数）、
  納税義務の発生时期、法第七百十八条の八第二項の「政令で定めるところ」による算定、
  見込額の算定・適用、納期の判断は**すべて caller-established**。法的判断は自動化していない。
- **Bool / if は計算式に入れていない**。Nat 除算の切り捨て・百円未満切り捨ては原文忠実。
- 原文の乗数は「十二を乗じて得た額」であり、委譲元要約の「残りの納期の数を乗じて」ではない。
  一字も誤らぬ原文を優先し `insuranceTaxEstimate`（乗数 12）を標準形とした。
  要約の読みにも対応できるよう `insuranceTaxEstimateWithMultiplier`（乗数を caller-established
  で受け取る）を併設した。どちらが適用されるかの判断は呼び出し側の責任。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は 60〜130 文字、全角空白 U+3000 を含みません。

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（支払回数割保険税額の見込額の算定方法）第五十六条の八十九の六法第七百十八条の八第二項に規定する政令で定めるところにより算定した額は、",
    "十二（当該国民健康保険税の納税義務が当該前年度の初日後に発生したものである場合にあつては、その発生した日の属する月から当該前年度の三月までの月数）で除して得た額に十二を乗じて得た額",
    "の三月までの月数）で除して得た額に十二を乗じて得た額（当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額）とする。",
    "当該年度の前年度分の国民健康保険税額を十二（当該国民健康保険税の納税義務が当該前年度の初日後に発生したものである場合にあつては、",
    "独立行政法人水資源機構が所有するダムの用に供する家屋及び償却資産のうち、当該固定資産の価格に当該ダムの新築又は改築に要する費用の額"
  ]
}
```

needle 1〜4 は第五十六条の八十九の六（モデル化対象）、needle 5 は第五十二条の十の二
（NOT MODELLED、原文保持の証拠として残す）。参考変換例:

```python
yield ("地方税法施行令 56の89の6（支払回数割保険税額の見込額）↔ LocalTaxInsuranceEstimate.lean",
       "325CO0000000245",
       "file", None,
       [ ...上記 needles 5 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **5 needles** なので **+5**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxInsuranceEstimate JapanTaxLaw.LocalTaxInsuranceEstimateSpec JapanTaxLaw.LocalTaxInsuranceEstimateTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAG_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新规定数 18 本（theorem 14 + agree def 4）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 13 本は `does not depend on any axioms`。
  - 5 本（`estimateHundredYenFloor_le` / `_id`、`insuranceTaxEstimateWithMultiplier_zero_left`
    / `_zero_multiplier`、`insuranceTaxEstimate_zero`）は `propext` に依存（repo 通常パターン、
    許容範囲）。
- 原文逐語検証: **5/5 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  K3/K4 ファイルと一致することも確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 条文 | len | 全角空白 | raw@ | norm@ | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 56 の 89 の 6（見出し・導入） | 67 | なし | 437154 | 437046 | **FOUND** |
| 2 | 56 の 89 の 6（除数・乗数） | 90 | なし | 437240 | 437132 | **FOUND** |
| 3 | 56 の 89 の 6（百円未満切り捨て） | 65 | なし | 437304 | 437196 | **FOUND** |
| 4 | 56 の 89 の 6（前年度税額・除数） | 64 | なし | 437221 | 437113 | **FOUND** |
| 5 | 52 の 10 の 2（NOT MODELLED 証拠） | 65 | なし | 334649 | 334564 | **FOUND** |

- **FOUND 5 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxInsuranceEstimate.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 第56条の89の6（支払回数割保険税額の見込額 = 百円未満切り捨て((前年度国保税額÷除数)×十二)）の L4 計算スライス・独立定式・退行テスト。第52条の10の2（Def のみ）は NOT MODELLED
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第56条の89の6（LocalTaxInsuranceEstimate.lean：見込額 = 百円未満切り捨て((前年度国民健康保険税額÷除数)×十二)、除数・税額・納税義務発生时期は caller-established、Nat 除算は切り捨て。第52条の10の2 は定義のみで NOT MODELLED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxInsuranceEstimate
import JapanTaxLaw.LocalTaxInsuranceEstimateSpec
import JapanTaxLaw.LocalTaxInsuranceEstimateTests
```

（W-AG は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. NOT MODELLED の理由（第五十二条の十の二）

原文（一字も変更せず、needle 5 として保持）:

> （法第三百四十九条の三第十七項の家屋及び償却資産の部分）第五十二条の十の二法第三百四十九条の三第十七項に規定する水道又は工業用水道の用に供するものとして政令で定める部分は、独立行政法人水資源機構が所有するダムの用に供する家屋及び償却資産のうち、当該固定資産の価格に当該ダムの新築又は改築に要する費用の額につき当該ダムを水道又は工業用水道の用に供する者が負担する額の当該費用の額に対する割合を乗じて得た価格に相当する部分とする。

- これは固定資産税の**課税客体（家屋・償却資産のどの部分が水道・工業用水道用とみなされるか）を定義する規定**であり、
  「価格に割合を乗じて得た価格に相当する部分」は定義上の价格画定であって、
  **納付すべき税額の算定（金額算術）ではない**。
- 当該割合・固定資産の価格・費用の額・負担額はすべて caller-established であり、
  モデル化すべき「見込額」のような算定出力が条文に存在しない。
- したがって本スライスでは **NOT MODELLED** とし、fee/tax の def は作っていない。
  needle は原文保持の証拠として転記監査に残す（needle 5）。

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は第五十六条の八十九の六の算定式中核のみ。法第七百十八条の八第二項の
  「政令で定めるところ」の具体内容、納期・納付手続、適用判定は NOT YET COVERED。
- 第五十二条の十の二は NOT MODELLED（§8）。
- 委譲元要約との乗数の相違（十二 vs 残りの納期の数）は §1 に明記した通り。
  原文を優先しつつ、要約読み用の一般形も併設した。適用判断は呼び出し側の責任。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+5）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AG は実行していません）。
