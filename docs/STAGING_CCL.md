# STAGING CCL — 法人税法施行令 art.148（通算法人に係る控除限度額の計算）bounded L4 モデル

> 実装ワーカー CCL からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/ConsolidationCreditLimit.lean` | 新規 |
| `JapanTaxLaw/ConsolidationCreditLimitSpec.lean` | 新規 |
| `JapanTaxLaw/ConsolidationCreditLimitTests.lean` | 新規 |
| `docs/STAGING_CCL.md` | 新規（本ファイル） |

pinned source:

- law id `340CO0000000097`（法人税法施行令 / CabinetOrder）
- revision `340CO0000000097_20261001_507CO0000000121`
- Amendment enforcement date: 2026-10-01
- 照合先 JSON: `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`（Article Num `148`）
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C7_148.txt`（UTF-8、本文 3094 文字）

原文の本文 3094 文字は pinned JSON の art.148 leaf-text flatten と**完全一致**（`equal: True`、
いずれも U+3000 を 1 も含まない）を確認済み。名前空間は
`JapanTaxLaw.ConsolidationCreditLimit`（独立名前空間）、`Money := Nat` は
`JapanTaxLaw.TaxFinance` を import して利用。

## 1. def 一覧（名前空間 `JapanTaxLaw.ConsolidationCreditLimit`, Money = Nat）

### 実装（`ConsolidationCreditLimit.lean`）— 2 def + 8 theorem = **10 本**

| 区分 | 名前 | 内容 |
| --- | --- | --- |
| §2 | `preAdjustmentLimit firstAmount secondAmount thirdAmount` | `if secondAmount = 0 then 0 else firstAmount + secondAmount * thirdAmount / secondAmount`。原文「第一号に掲げる金額に第二号に掲げる金額のうちに第三号に掲げる金額の占める割合を乗じて計算した金額」の「割合を乗じて」形を乗算先行で保持。第二号 ≠ 0 なら `firstAmount + thirdAmount`、分母 0 は安全版で 0 |
| §1 | `consolidationCreditLimit preAdjustment adjustment` | `if preAdjustment ≤ adjustment then 0 else preAdjustment - adjustment`（saturating 減算 = `max(preAdjustment − adjustment, 0)`）。原文「調整前控除限度額から…控除限度調整額を控除した金額（当該調整前控除限度額が零を下回る場合には、零）」 |

verified facts / positivity（8 本、モデル性質のみ）:

- `preAdjustmentLimit_zero_denominator`（分母 0 → 0）
- `preAdjustmentLimit_eq_add`（第二号 ≠ 0 なら第一号 + 第三号。
  `Nat.mul_div_cancel` で `s * t / s = t` を証明）
- `preAdjustmentLimit_pos`（第一号 > 0 なら正）
- `preAdjustmentLimit_mono_first`（第一号について単調非減少）
- `consolidationCreditLimit_eq`（調整額 < 調整前額 なら差を返す）
- `consolidationCreditLimit_zero_of_le`（調整額 ≥ 調整前額 → 0）
- `consolidationCreditLimit_le_pre`（控除限度額 ≤ 調整前額）
- `consolidationCreditLimit_pos`（調整額 < 調整前額 なら正）

各 def に positivity 定理と kernel-decide の smoke を付与済み。

### 独立定式（`ConsolidationCreditLimitSpec.lean`）— 3 def

| 名前 | 内容 |
| --- | --- |
| `specPreAdjustmentLimit firstAmount secondAmount thirdAmount` | `if secondAmount = 0 then 0 else firstAmount + thirdAmount`（impl の割合按分を代数単純化した独立整数定式。impl の def を参照しない） |
| `specConsolidationCreditLimit preAdjustment adjustment` | `if adjustment < preAdjustment then preAdjustment - adjustment else 0`（impl の分岐条件 `p ≤ a` を反転表現） |
| `agreeConsolidationCreditLimit` | impl ≡ spec の定数値 `==` 一致確認（§2 9 点・§1 8 点の有限グリッド、`by decide`） |

### 退行テスト（`ConsolidationCreditLimitTests.lean`）

`example : ... := by decide` の kernel-decide smoke **15 件**。境界: 分母 0、
第三号 0、第二号 = 1、控除 ≥ 調整前で 0（equal / greater）、調整前 0、調整額 0、
調整額 = 調整前 − 1、端数（割合が割り切れない第二号 3 / 第三号 1、第二号 7 / 第三号 2）、
第三号 > 第二号（不整合データでクランプなし）。

**名前付き宣言合計 13 本**（impl 2 def + 8 theorem, spec 3 def）。
無名 `example` は無名宣言のため数に含めない（impl 9 / spec 10 / agree 1 / tests 15 =
kernel-decide smoke 計 35 件）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "340CO0000000097",
  "kind": "file",
  "title": null,
  "needles": [
    "調整前控除限度額から当該通算事業年度の控除限度調整額を控除した金額（当該調整前控除限度額が零を下回る場合には、零）とする。",
    "前項に規定する調整前控除限度額とは、第一号に掲げる金額に第二号に掲げる金額のうちに第三号に掲げる金額の占める割合を乗じて計算した金額",
    "第一項に規定する控除限度調整額とは、第一号に掲げる金額に第二号に掲げる金額のうちに同号イに掲げる金額の占める割合を乗じて計算した金額"
  ]
}
```

参考変換例:

```python
yield ("法人税法施行令 art.148（通算法人に係る控除限度額の計算）↔ ConsolidationCreditLimit.lean",
       "340CO0000000097",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

1. **build**:
   `lake build JapanTaxLaw.ConsolidationCreditLimit JapanTaxLaw.ConsolidationCreditLimitSpec JapanTaxLaw.ConsolidationCreditLimitTests`
   → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   （新規 3 ファイルは未追跡のため走査対象外ですが、人手でも `sorry` / `admit` はありません。）
3. **axiom probe**: 一時ファイル `CCL_AxiomProbe.lean` を approved temp dir に作成し
   `lake env lean`（exit code 0）で 13 本の名前付き宣言すべてに `#print axioms` を実行、
   **削除済み**。結果:
   - `Classical.choice` / `sorryAx` / `Quot.sound` は **0 件**。
   - axiom-free **9 本**、`propext` のみ **4 本**（repo 許容範囲、propext 可）。
   - propext 依存: `preAdjustmentLimit_zero_denominator`,
     `preAdjustmentLimit_eq_add`, `preAdjustmentLimit_pos`, `consolidationCreditLimit_pos`
     （いずれも `if` / `Nat` 除算の核心定理経由）。
4. **逐語（needle）**: 3 needle すべてについて pinned JSON の art.148 leaf-text flatten
   （3094 文字、U+3000 不包含、原文ファイル本文と完全一致）をhaystack として Python
   `.find()` を実行 → **FOUND 3 / MISS 0**。`norm@` / `raw@` は同一（正規化テキスト＝原文）。

## 4. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | 原文箇所 | len | 全角空白 | pos | count | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | §1 本文（saturating） | 61 | なし | 113 | 1 | **FOUND** |
| 2 | §2 調整前控除限度額（割合を乗じて） | 66 | なし | 175 | 1 | **FOUND** |
| 3 | §7 控除限度調整額（割合を乗じて） | 66 | なし | 2569 | 1 | **FOUND** |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 全 needle は 61〜66 文字の範囲内（指定 60〜130 文字を満たす）、U+3000 不包含。

## 5. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/ConsolidationCreditLimit.lean / -Spec.lean / -Tests.lean  # 法人税法施行令 art.148（通算法人に係る控除限度額の計算）の L4 計算スライス。調整前控除限度額 = first + second*third/second（second≠0 なら first+third、分母0は0）、控除限度額 = if 調整前≤調整額 then 0 else 調整前−調整額（saturating）。各号の具体的算定・第3項以降 NOT MODELLED、caller-established 額、Bool は金額式に入れない
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  法人税法施行令 art.148（ConsolidationCreditLimit.lean：通算法人に係る控除限度額。調整前控除限度額 = first + second×third/second（second≠0 なら first+third、分母0は0）、控除限度額 = saturating 減算 if p≤a then 0 else p−a。各金額・該当性は caller-established、Bool は金額式に入れない、第2項各号の具体的算定・第3項以降 NOT MODELLED）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.ConsolidationCreditLimit
import JapanTaxLaw.ConsolidationCreditLimitSpec
import JapanTaxLaw.ConsolidationCreditLimitTests
```

（CCL は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さな計算スライス**です。**完成・網羅を主張しません**。
- 対象は art.148 のうち、§1（控除限度額の saturating 計算）と §2（調整前控除限度額の
  「割合を乗じて」形）のみです。
- **NOT MODELLED（明示）**:
  - **第2項各号の具体的算定** — 第一号（法人税額: 法 67–70、租税特別措置法 42の4/
    42の14/62/63/66の7/66の9の3 等の「税額関係規定」を適用しない計算）、
    第二号（所得金額 − 欠損金額）、第三号（調整国外所得金額）の算定は他条文を多数参照し、
    本モジュールの外にある。各号は caller-established な完成済み金額として受け取るだけ。
  - **第3項以降** — §3（所得金額・欠損金額の対象規定）、§4（調整前国外所得金額）、
    §5（加算調整額）、§6（調整金額）、§7（控除限度調整額そのものの算定）、
    §8（第142条の準用）、§9（法人税額等の通知）は一切モデル化していない。
    `adjustment`（控除限度調整額）は caller-established として引数で受け取る。
  - 通算法人・通算事業年度・通算完全支配関係の該当性、割合の厳密な有理数表現と
    丸め規則、端数処理（通則法）、経過措置・附則。
- 原文は「割合」を有理数で述べるが、本モデルは整数の乗除（乗算先行・切り捨て）で近似する。
  乗算先行のため本スライスでは端数は生じず `first + third` に等しい（directive どおり
  「割合を乗じて」形を保持）。厳密な有理数割合・丸めの法的詳細は主張しない。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+3）、`JapanTaxLaw.lean` への
  import 追加（§6）、README / PROGRESS の 1 行追記（§5）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（CCL は実行していません）。
- commit / push / merge / ブランチ切替は行っていません。
