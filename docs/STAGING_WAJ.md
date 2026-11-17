# STAGING — W-AJ（租税特別措置法施行令 第二十四条［譲渡所得の特別控除額の特例・5000万円上限］bounded L4）受け渡しメモ

> 実装担当 W-AJ からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialOrderCapitalGainDeduction.lean` | 新規 |
| `JapanTaxLaw/SpecialOrderCapitalGainDeductionSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialOrderCapitalGainDeductionTests.lean` | 新規 |
| `docs/STAGING_WAJ.md` | 新規（本ファイル） |

pinned source:

- law id `332CO0000000043`（租税特別措置法施行令）
- revision `332CO0000000043_20261101_507CO0000000127`
- 原文: `C:\Users\junny\AppData\Local\Temp\opencode\special_order_L5.txt`（第二十四条、UTF-8、267 文字、全角空白 U+3000 なし）
- 照合先 JSON: `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`
  （`data/INVENTORY.json` の `current_revision` と一致、flatten テキストが原文と一致することを確認済み）

名前空間は `JapanTaxLaw.SpecialOrderCapitalGainDeduction`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

## 1. 追加した def / theorem 一覧

### 実装（`SpecialOrderCapitalGainDeduction.lean`）— 5 def / 15 theorem

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 24 | `capitalGainSpecialDeductionCap` | 控除限度額 `Money := 50_000_000`（五千万円） |
| 24 | `withinCap` | 「五千万円の範囲内」= `min amount capitalGainSpecialDeductionCap` |
| 24 | `deductionPriorityOrder` | 原文の「まず…順次…」の優先順位を表す Nat リスト `[0,1,2,3,4,5,6]`（7 条文分） |
| 24 | `shortfall` | 「満たない部分の金額」= `cap - withinCap used` |
| 24 | `specialDeductionTotal` | 合計控除額 = `withinCap amounts.sum`（caller が優先順位どおりに渡した額の合計をキャップ） |

theorem 15 本（いずれもモデル性質のみ）:

- `capitalGainSpecialDeductionCap_pos`
- `withinCap_nonneg` / `_le_cap` / `_le_self` / `_eq_of_le_cap` / `_eq_cap_of_ge`
- `deductionPriorityOrder_length`
- `shortfall_nonneg` / `_le_cap` / `shortfall_add_withinCap`
- `specialDeductionTotal_nonneg` / `_le_cap` / `_le_sum` / `_eq_sum_of_le_cap` / `_cap_of_first_ge`

各 def に対応する positivity / smoke を付与済み（上限額の正値性、各関数の非負・上限以下、
優先順位リストの長さ 7 と Nodup、合計の上限以下／合計額以下 など）。

### 独立定式（`SpecialOrderCapitalGainDeductionSpec.lean`）— 8 def

| 名前 | 内容 |
| --- | --- |
| `specCap` | 原文リテラルから独立に置いた上限 `50_000_000` |
| `specWithinCap` | `x - (x - specCap)` — `min` も `if` も使わない減算だけの独立定式 |
| `specSumDeductions` | リスト合計の再帰定義（`List.sum` を使わない） |
| `specShortfall` | `specCap - specWithinCap used` |
| `specSpecialDeductionTotal` | `specWithinCap (specSumDeductions amounts)` |
| `agreeWithinCapPoints` | 実装 ≡ spec（8 点、`by decide`） |
| `agreeShortfallPoints` | 実装 ≡ spec（6 点、`by decide`） |
| `agreeSpecialDeductionTotalPoints` | 実装 ≡ spec（11 点、`by decide`） |

### 退行テスト（`SpecialOrderCapitalGainDeductionTests.lean`）

`example : ... := by decide` の kernel-decide smoke 25 件。境界: `0` / `49_999_999` /
`50_000_000` / `50_000_001`、先頭額が上限を超えるケース、優先順位リストどおりの
複数額を順次キャップするケース（30M+19_999_999 / 30M+20M / 30M+20_000_001 など）。

kernel-decide の `example` は実装 21 件・Spec 16 件・Tests 25 件の計 62 件。

### doc-comment に明記した射程

- 各控除額・該当性は **caller-established**。Bool は式に入れていません。Bool による
  適用判定は行わず、該当しない控除は `Money` の `0` として渡す設計。
- 法第三十六条の「政令で定めるところにより計算した金額」そのもの、各参照条文
  （法33条の4/35/34/34条の2/35条の2/34条の3/35条の3）の控除額算定・適用要件、
  「適用がない場合」の判定は NOT MODELLED。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は 60〜130 文字、全角空白 U+3000 を含みません。

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "（譲渡所得の特別控除額の特例）第二十四条法第三十六条に規定する政令で定めるところにより計算した金額は、五千万円の範囲内において、まず法第三十三条の四第一項の規定により控除すべき金額から成るものとし、",
    "五千万円の範囲内において、まず法第三十三条の四第一項の規定により控除すべき金額から成るものとし、同項の規定の適用がない場合又は同項の規定により控除すべき金額が五千万円に満たない場合には、",
    "同項の規定の適用がない場合又は同項の規定により控除すべき金額が五千万円に満たない場合には、五千万円又は当該満たない部分の金額の範囲内において、順次法第三十五条第一項、",
    "五千万円又は当該満たない部分の金額の範囲内において、順次法第三十五条第一項、第三十四条第一項、第三十四条の二第一項、第三十五条の二第一項、第三十四条の三第一項及び第三十五条の三第一項の",
    "第三十四条第一項、第三十四条の二第一項、第三十五条の二第一項、第三十四条の三第一項及び第三十五条の三第一項の規定により控除すべき金額から成るものとして計算した金額とする。"
  ]
}
```

参考変換例:

```python
yield ("租税特別措置法施行令 第二十四条（譲渡所得の特別控除額の特例・5000万円上限）↔ SpecialOrderCapitalGainDeduction.lean",
       "332CO0000000043",
       "file", None,
       [ ...上記 needles 5 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **5 needles** なので **+5**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.SpecialOrderCapitalGainDeduction JapanTaxLaw.SpecialOrderCapitalGainDeductionSpec JapanTaxLaw.SpecialOrderCapitalGainDeductionTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAJ_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新规定数 18 本（theorem 15 + agree def 3）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 11 本は `does not depend on any axioms`。
  - 7 本（`withinCap_le_cap` / `_le_self` / `_eq_cap_of_ge`、`shortfall_add_withinCap`、
    `specialDeductionTotal_le_cap` / `_le_sum` / `_cap_of_first_ge`）は `propext` に依存
    （repo 通常パターン、許容範囲）。
- 原文逐語検証: **5/5 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  L5 ファイルと一致することも確認済み（原文 267 文字、raw@=284278 / norm@=284169）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 範囲 | len | 全角空白 | raw@ | norm@ | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 見出し・まず 33条の4 | 99 | なし | 284278 | 284169 | **FOUND** |
| 2 | 満たない場合の導入 | 93 | なし | 284329 | 284220 | **FOUND** |
| 3 | 満たない部分・順次 35条 | 83 | なし | 284377 | 284268 | **FOUND** |
| 4 | 順次の条文列挙 | 92 | なし | 284422 | 284313 | **FOUND** |
| 5 | 末尾・計算した金額とする | 85 | なし | 284460 | 284351 | **FOUND** |

- **FOUND 5 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/SpecialOrderCapitalGainDeduction.lean / -Spec.lean / -Tests.lean  # 租税特別措置法施行令 第24条（譲渡所得の特別控除額の特例・合計控除額を五千万円以下にキャップ）の bounded L4 計算スライス・独立定式・退行テスト。優先順位の適用ロジック・各参照条文の控除額算定は NOT MODELLED
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法施行令 第24条（SpecialOrderCapitalGainDeduction.lean：合計特別控除額 = withinCap(優先順位どおりの控除額の合計)、withinCap = min(amount, 50_000_000)、各控除額・該当性は caller-established、Bool は式に入れず、優先順位の適用ロジックは NOT MODELLED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.SpecialOrderCapitalGainDeduction
import JapanTaxLaw.SpecialOrderCapitalGainDeductionSpec
import JapanTaxLaw.SpecialOrderCapitalGainDeductionTests
```

（W-AJ は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. NOT MODELLED の理由（優先順位の適用ロジック）

本スライスは上限（五千万円キャップ）のみを金額計算としてモデル化しました。原文の
「まず法第三十三条の四第一項の規定により控除すべき金額から成るものとし …
五千万円又は当該満たない部分の金額の範囲内において、順次 …」について:

- 優先順位そのものは `deductionPriorityOrder : List Nat` として保持しましたが、
  **「まず／順次」の適用ロジック（どの条文が何額を控除するか、残り余裕をどう配るか）は
  NOT MODELLED** です。各控除額と該当性は caller-established であり、
  モデルは渡された額の合計をキャップするだけです。
- 根拠: (1) 各参照条文（法33条の4・35条・34条・34条の2・35条の2・34条の3・35条の3）の
  控除額算定・適用要件は本スライスの射程外で、原文もそれらの内容を定義していない;
  (2) 「適用がない場合」の判定は Bool による適用判定となり、委譲方針の
  「Bool は式に入れない」に反する; (3) 各額が非負 (Nat) である以上、
  「順次キャップ」と「合計してからキャップ」は同じ値になるため、
  上限モデルで十分に bounded L4 の計算核を表現できる。
- 法第三十六条の「政令で定めるところにより計算した金額」そのもの、および各条文の
  適用判定・端数・手続も NOT MODELLED です。

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は第二十四条の「合計控除額を五千万円以下にキャップする」計算核のみ。
  優先順位の適用ロジック・各参照条文の控除額算定は NOT MODELLED（§8）。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+5）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AJ は実行していません）。
