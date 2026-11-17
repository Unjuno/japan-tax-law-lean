# STAGING — W-K（所得税法 第八十六条（基礎控除）の bounded L4 モデル）受け渡しメモ

> 実装担当 W-K からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
>
> 注: 本ファイルを書く時点で `docs/STAGING_WK.md` には別スライス
> （登録免許税法 別表第一（二）第三十二号 百三十〜百三十四 /
> RegistrationQualificationFeesP7K*）の受け渡しメモが入っていました。
> 指示された成果物名が `STAGING_WK.md` であるため、本メモで置き換えています。
> 旧スライスの記録が必要ならメインセッションで復元判断してください（W-K は他ファイルに
> バックアップを作成していません）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeBasicDeduction.lean` | 新規 |
| `JapanTaxLaw/IncomeBasicDeductionSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeBasicDeductionTests.lean` | 新規 |
| `docs/STAGING_WK.md` | 更新（本ファイル） |

pinned source: 所得税法 `law_id 340AC0000000033` /
revision `340AC0000000033_20261001_507AC0000000070`
（amendment enforcement date 2026-10-01、`data/raw/340AC0000000033_20261001_507AC0000000070.law.json`、
current enforced revision per `data/INVENTORY.json`、IndividualIncomeTax /
IncomeMiscDeductions / IncomeDependentDeductions と同一 pin）。

担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_K_income_depreciation.txt`
（第八十六条、UTF-8、1 行 284 文字、正規化済み）。

Namespace: `JapanTaxLaw.IncomeBasicDeduction`（部分名前空間を分離。flat な
`JapanTaxLaw` の `basicDeduction`（地方税法 art. 34／LocalIncomeTax.lean）は額が異なるため
衝突回避）。

金額の日本語数字 → Arabic 変換（原文どおり、全件一致確認済み）:

| 原文 | Arabic | 区分 |
| --- | --- | --- |
| 五十八万円 | 580_000 | 合計所得金額 2,350万円以下 |
| 四十八万円 | 480_000 | 2,350万円超 2,400万円以下 |
| 三十二万円 | 320_000 | 2,400万円超 2,450万円以下 |
| 十六万円 | 160_000 | 2,450万円超 2,500万円以下 |
| （該当なし） | 0 | 2,500万円超 → 第1項の適用外 |

## 1. 追加した def 一覧

`Money := Nat`（`JapanTaxLaw.TaxFinance`）、`namespace JapanTaxLaw.IncomeBasicDeduction`。

### 実装（`IncomeBasicDeduction.lean`）— 6 def

| # | def | 値／式 | 根拠 |
| --- | --- | --- | --- |
| 1 | `basicDeductionLe2350` | `580_000` | art. 86(1) 一「五十八万円」 |
| 2 | `basicDeductionLe2400` | `480_000` | art. 86(1) 二「四十八万円」 |
| 3 | `basicDeductionLe2450` | `320_000` | art. 86(1) 三「三十二万円」 |
| 4 | `basicDeductionLe2500` | `160_000` | art. 86(1) 四「十六万円」 |
| 5 | `basicDeductionAmount(totalIncome)` | `if` 5 分岐（≤23_500_000→580_000 / ≤24_000_000→480_000 / ≤24_500_000→320_000 / ≤25_000_000→160_000 / else→0） | art. 86(1) 各号、境界を正確に |
| 6 | `taxableAfterBasicDeduction(income, deduction)` | `income - deduction`（saturating Nat 減算） | 所得控除の額のみをモデル化（税額計算なし） |

定理 9 本（`basicDeductionLe2350_pos` / `Le2400_pos` / `Le2450_pos` / `Le2500_pos` /
`basicDeduction_strictlyDecreasing` / `basicDeductionAmount_of_le2350` /
`basicDeductionAmount_of_gt2500` / `taxableAfterBasicDeduction_of_lt` /
`taxableAfterBasicDeduction_le_income`）＋ private `natSubEqZeroOfLeFree`（axiom-free の
saturating 補助証明）を付与。

### 独立定式（`IncomeBasicDeductionSpec.lean`）— 7 def

| # | def | 値／式 |
| --- | --- | --- |
| 7 | `specBasicDeductionLe2350` | `580_000`（impl 定数を参照しない） |
| 8 | `specBasicDeductionLe2400` | `480_000` |
| 9 | `specBasicDeductionLe2450` | `320_000` |
| 10 | `specBasicDeductionLe2500` | `160_000` |
| 11 | `specBasicDeductionAmount(totalIncome)` | `< boundary+1` による if の別表現 |
| 12 | `specTaxableAfterBasicDeduction(income, deduction)` | `if deduction ≤ income then income - deduction else 0` |
| 13 | `agreeIncomeBasicDeduction : Bool` | 有限グリッド（16 total × 8 deduction）で impl ≡ spec、`by decide` で true |

**def 合計 13 本**（実装 6 ＋ spec 7）。`IncomeBasicDeductionTests.lean` は新規定理名を
作らず `example ... := by decide` の kernel-decide smoke のみ（全境界値 8 点を収録）。

### doc-comment に明記した射程外（overclaim 防止）

- 適用要件「合計所得金額が 2,500万円以下である**居住者**について」の該当性、および
  合計所得金額自体の算定は **caller-established** とし、区分・金額算出式に Bool を
  混入させていません（合計所得金額は caller-established な入力）。
- 税額計算（課税所得・税率適用・復興特別所得税・防衛特別所得税）は非モデル化。
  本モデルは**所得控除の額のみ**を扱います。
- 控除の適用顺序、他の所得控除との調整、端数処理（通則法 art. 118 / 119）は非モデル化。
- `agreeIncomeBasicDeduction` は有限点の一致確認であり、法的意味の等価証明ではありません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（law_id / kind / title / needles の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "合計所得金額が二千五百万円以下である居住者については、その者のその年分の総所得金額、退職所得金額又は山林所得金額から次の各号に掲げる場合の区分に応じ当該各号に定める金額を控除する。",
    "一その居住者の合計所得金額が二千三百五十万円以下である場合五十八万円",
    "二その居住者の合計所得金額が二千三百五十万円を超え二千四百万円以下である場合四十八万円",
    "三その居住者の合計所得金額が二千四百万円を超え二千四百五十万円以下である場合三十二万円",
    "四その居住者の合計所得金額が二千四百五十万円を超え二千五百万円以下である場合十六万円",
    "前項の規定による控除は、基礎控除という。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 6 本をそのまま使用）:

```python
yield ("所得税法 art. 86（基礎控除）↔ IncomeBasicDeduction.lean",
       "340AC0000000033",
       "file", None,
       [ ...上記 needles 6 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- W-K 担当分: 新規 check **6 needles** なので **+6**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.IncomeBasicDeduction JapanTaxLaw.IncomeBasicDeductionSpec JapanTaxLaw.IncomeBasicDeductionTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WK_AxiomProbe.lean` を approved temp dir
  `C:\Users\junny\AppData\Local\Temp\opencode\` に作成、`lake env lean` で実行後 **削除済み**）:
  - 命名定理 9 本 ＋ `agreeIncomeBasicDeduction` の計 **10 件**を走査。
  - **8 件は `does not depend on any axioms`**。
  - `basicDeductionAmount_of_le2350` / `basicDeductionAmount_of_gt2500` の **2 件のみ
    `[propext]`**（指示により propext は可）。
  - **`Classical.choice` も `sorryAx` も `quot.sound` も一切なし**（出力 10 行を全文走査、
    いずれも 0 回）。
- 原文逐語検証（正規化テキストに対して Python `.find()`）: **6/6 FOUND、MISS 0 件**（§5）。
  pinned JSON の平坦化テキストに対しても **6/6 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `W_K_income_depreciation.txt` の本文を、転記監査と同じ
`re.sub(r"[\s　]+", "", ...)` で正規化した文字列に対して各 needle を Python の
`.find()` で検索（`art@`）。`json@` は pinned JSON `law_full_text` を
`transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 区分 | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 本文（2,500万円以下の居住者） | FOUND | 11 | 103113 | 1/1 | 90 |
| 2 | 一「五十八万円」 | FOUND | 101 | 103203 | 1/1 | 34 |
| 3 | 二「四十八万円」 | FOUND | 135 | 103237 | 1/1 | 43 |
| 4 | 三「三十二万円」 | FOUND | 178 | 103280 | 1/1 | 43 |
| 5 | 四「十六万円」 | FOUND | 221 | 103323 | 1/1 | 42 |
| 6 | 第2項「基礎控除という」 | FOUND | 264 | 103366 | 1/1 | 20 |

- **FOUND 6 / MISS 0**（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 20〜90）。
  needle の勝手な変更・正規化・文字変換はしていません（原文の文字使いを保持）。
  4 区分の金額文字列（五十八万円 / 四十八万円 / 三十二万円 / 十六万円）を
  対応する needle に含めています。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、
ここでは書きません。

- **README.md**（モジュール一覧・`IncomeDependentDeductions*` 行の直後に追加）:
  ```text
  JapanTaxLaw/IncomeBasicDeduction.lean / -Spec.lean / -Tests.lean  # 所得税法 第86条（基礎控除: 2,350万円以下58万／〜2,400万円48万／〜2,450万円32万／〜2,500万円16万／2,500万円超は控除なし）の bounded L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 第86条（基礎控除、IncomeBasicDeduction.lean：4区分の控除額を Money 定数化・2,500万円超は第1項の適用外、居住者要件・合計所得金額の算定は caller-established）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.IncomeBasicDeduction
import JapanTaxLaw.IncomeBasicDeductionSpec
import JapanTaxLaw.IncomeBasicDeductionTests
```

（W-K は `JapanTaxLaw.lean` を書き換えていません。W-J / W-L の担当ファイルにも
触れていません。）

## 8. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・
  CI・`run_python_gates.py` は未実行です。
- **axiom**: 走査 10 件中 8 件 axiom-free、2 件は `[propext]` のみ。
  `Classical.choice` / `sorryAx` / `quot.sound` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 6 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 20〜90）。
- **def 数**: 13（実装 6 ＋ spec 7）。泉額定数 4 本に加え区分選択・控除後・
  独立定式・一致判定を収録。
- **STAGING**: 本ファイル `docs/STAGING_WK.md` を更新済みです（旧スライス記録は置換、
  §0 注記を参照）。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は **所得税法 第八十六条（基礎控除）のみ**。他の所得控除条・税率条は **NOT YET COVERED**。
- 居住者であること・合計所得金額の算定は caller-established とし、法的判断の
  自動化はしていません。税額計算も含みません。
- `agreeIncomeBasicDeduction` は有限点の `==` 一致確認であり、全称の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+6）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-K は実行していません）。
