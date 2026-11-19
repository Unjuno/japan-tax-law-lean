# STAGING — IA205 (所得税法 art. 205 徴収税額: 源泉徴収 10%／20%) 受け渡しメモ

> 実装担当 IA205 からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> **完成・網羅を主張しません。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のままです。**

## 0. 対象ファイル（新規作成 4 ファイルのみ）

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeArt205Withholding.lean` | 新規 |
| `JapanTaxLaw/IncomeArt205WithholdingSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeArt205WithholdingTests.lean` | 新規 |
| `docs/STAGING_IA205.md` | 新規（本ファイル） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070` / enforcement 2026-10-01
（IncomeArt213Withholding.lean / IncomeWithholdingRates.lean / IndividualIncomeTax.lean と同一ピン）。

担当原文: `C:\Users\junny\AppData\Local\Temp\opencode\C6_art205.txt`（UTF-8、439 文字、本文全文が pinned JSON 正規化テキストの部分文字列であることを確認済み）。

namespace: `JapanTaxLaw.IncomeArt205Withholding`（他モジュールと衝突なし）。

## 1. def 一覧

### 1.1 `IncomeArt205Withholding.lean`（実装、公開 def 5 本）

税率定数・閾値:

- `def art205BasicRate : TaxRate := ⟨10, 100, by decide⟩` — 一号の百分の十。
- `def art205ExcessRate : TaxRate := ⟨20, 100, by decide⟩` — 一号の超過部分（百万円超）の百分の二十。
- `def art205Threshold : Money := 1_000_000` — 百万円の閾値。

一号・二号の金額式:

- `def art205Tax (amount : Money) : Money := art205BasicRate.applyFloor (min amount art205Threshold) + art205ExcessRate.applyFloor (amount - art205Threshold)` — saturating。閾値以下は 10% のみ、閾値超えは 100,000 + 20% × 超過部分。
- `def art205TaxAfterDeduction (amount deduction : Money) : Money := art205BasicRate.applyFloor (amount - deduction)` — 二号。政令で定める控除額 `deduction` は caller-established、saturating。

定理（公開 13 本）: 率・閾値 positivity 5、一号 characterization 2（`art205Tax_of_le` / `_of_gt`）、境界 3（`art205Tax_zero` / `_at_threshold` / `_one_above_threshold`）、二号 saturating 2 分岐 2 と zero 1。
（private 補題 `natSubEqZeroOfLeFree` は `sorry` 無しの帰納法。Bool は金額式に入れず、一号/二号の選択は呼び出し側が def を選ぶことで表現する。）

### 1.2 `IncomeArt205WithholdingSpec.lean`（独立整数定式、def 7 本）

`TaxRate.applyFloor` も `min` も使わず、率を直接 `* 10 / 100` / `* 20 / 100`、キャップ・控除を明示的な saturating `if` で書き下す:

- `specCappedBase (amount) := if amount ≤ 1_000_000 then amount else 1_000_000`
- `specExcessBase (amount) := if 1_000_000 ≤ amount then amount - 1_000_000 else 0`
- `specArt205Tax (amount) := specCappedBase amount * 10 / 100 + specExcessBase amount * 20 / 100`
- `specAfterDeductionBase (amount deduction) := if deduction ≤ amount then amount - deduction else 0`
- `specArt205TaxAfterDeduction (amount deduction) := specAfterDeductionBase amount deduction * 10 / 100`
- `agreeArt205Tax : Bool` — 15 点の金額で impl ≡ spec を `==` 比較（有限点のみ、全称主張ではない）。
- `agreeArt205TaxAfterDeduction : Bool` — 9 組の金額/控除額で同様に比較。

双方とも `example : agree... = true := by decide`。

### 1.3 `IncomeArt205WithholdingTests.lean`（退行テスト）

新規定理名なし、全て `example ... := by decide`。境界: 0、百万円ちょうど / 1 円超 / 5 円超、控除 > 金額（saturating → 0）、端数（9 × 10% = 0、5 × 20% = 1）。

**本件の本モデル def 数 = 5**（Spec 独立定式 5 + agree 2 は別枠）。

## 2. 転記監査に追加すべき check（JSON 断片）

`kind: "file"` / `title: null` で needle 6 本。needle は一字も変えず原文から抽出、
全角空白 U+3000 を含まない。各 61〜97 文字。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "（徴収税額）第二百五条前条第一項の規定により徴収すべき所得税の額は、次の各号の区分に応じ当該各号に掲げる金額とする。一前条",
    "その金額に百分の十（同一人に対し一回に支払われる金額が百万円を超える場合には、その超える部分の金額については、百分の二十）の税率を乗じて計算した金額",
    "一前条第一項第一号、第二号、第四号若しくは第五号又は第七号に掲げる報酬若しくは料金又は契約金（次号に掲げる報酬及び料金を除く。）",
    "二前条第一項第二号に掲げる司法書士、土地家屋調査士若しくは海事代理士の業務に関する報酬若しくは料金、同項第三号に掲げる診療報酬",
    "同項第四号に掲げる職業拳けん闘家、外交員、集金人若しくは電力量計の検針人の業務に関する報酬若しくは料金、同項第六号に掲げる報酬若しくは料金又は同項第八号に掲げる賞金",
    "その金額（当該賞金が金銭以外のもので支払われる場合には、その支払の時における価額として政令で定めるところにより計算した金額）から政令で定める金額を控除した残額に百分の十の税率を乗じて計算した金額"
  ]
}
```

## 3. 検証結果（すべて本セッションで実行済み）

1. **ビルド**: `lake build JapanTaxLaw.IncomeArt205Withholding JapanTaxLaw.IncomeArt205WithholdingSpec JapanTaxLaw.IncomeArt205WithholdingTests`
   → **成功（5 jobs、warning なし）**。
   （当初 `min_eq_left` / `min_eq_right` を未修飾で使い unknown identifier となったため `Nat.min_eq_left` / `Nat.min_eq_right` に修正。また閉項の `rw` が goal を解消して余分な `decide` が no-goals となったため削除。いずれも証明戦略の問題でありモデル結果には影響しません。）
2. **`python scripts/ci/check_no_sorry.py`** → `no forbidden placeholder proofs found in tracked Lean sources`。
   （本スクリプトは `git ls-files` 対象=追跡済み .lean のみ走査。新規 3 ファイルも実証コードに `sorry` / `admit` なしを目視確認。）
3. **`#print axioms`**（一時ファイル `axiom_probe_IA205.lean`・実行後に削除済み）:
   公開 25 名（実装 def 5 + 定理 13 + Spec def 5 + agree def 2）を検査。**22 名は axiom 0 件**、
   `art205Tax_of_le` / `art205Tax_of_gt` / `art205TaxAfterDeduction_of_lt` の 3 本のみ `[propext]`。
   **`Classical.choice` も `sorryAx` も一切なし**（`propext` は許容範囲）。
4. **原文逐語検証**: pinned JSON の `law_full_text` から `tag` / `attr` を除く葉テキストを連結し、
   空白・U+3000 を除去した正規化テキストに対し各 needle を `.find()` で検索 → **6/6 FOUND（MISS なし）**。
   needle 長は 61 / 74 / 64 / 63 / 82 / 97 文字、いずれも U+3000 非含有。
   担当原文 439 文字全体も同正規化テキストの部分文字列であることを確認。

## 4. README / PROGRESS への 1 行文案（統合担当は追記してください）

README.md（3 行）:

```
JapanTaxLaw/IncomeArt205Withholding.lean     # 所得税法 art. 205（徴収税額: 一号 報酬等×10%（百万円超部分は20%）・二号 政令控除後残額×10%）L4 モデル
JapanTaxLaw/IncomeArt205WithholdingSpec.lean # 同上 独立定式
JapanTaxLaw/IncomeArt205WithholdingTests.lean# 同上 退行テスト
```

docs/PROGRESS.md（L4 一覧行に追記）:

```
所得税法 art. 205 IncomeArt205Withholding.lean（徴収税額: 一号 min(金額,100万)×10%＋(金額−100万)×20%（saturating, floor）、二号 (金額−政令控除額)×10%（saturating, floor）・区分/政令控除額/該当性は caller-established・非現金賞金の価額算定は NOT MODELLED）
```

## 5. `JapanTaxLaw.lean` に追加すべき 3 import（統合担当は追記してください）

```
import JapanTaxLaw.IncomeArt205Withholding
import JapanTaxLaw.IncomeArt205WithholdingSpec
import JapanTaxLaw.IncomeArt205WithholdingTests
```

## 6. NOT MODELLED とその理由

- **政令で定める控除額の算定・価額算定**（二号「から政令で定める金額を控除した残額」、および賞金の「その支払の時における価額として政令で定めるところにより計算した金額」）:
  政令への委任事項であり原文に算式が無い。caller-established な `Money` として受け取るのみ。
- **一号／二号の区分・前条第一項各号の該当性判定**:
  原文は「次の各号の区分に応じ」と規定するのみで判定基準を与えない。呼び出し側が目的の def を選択し、Bool を金額式に混入させない。
- **租税条約上の軽減・免除、端数処理（通則法 art. 118 / 119）、復興特別所得税・防衛特別所得税、確定申告上の調整**:
  他法令・他条の対象であり本条の bounded 模型の外。

以上、模型的性質のみを主張し、法的正解性・網羅性は主張しません。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のままです。
