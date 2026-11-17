# STAGING — W-C（所得税法 art. 80 / 81 / 82 控除3条 と art. 170 / 182 / 209の3 / 211 税率4条）受け渡しメモ

> 実装担当 W-C からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeMiscDeductions.lean` | 新規 |
| `JapanTaxLaw/IncomeMiscDeductionsSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeMiscDeductionsTests.lean` | 新規 |
| `docs/STAGING_WC.md` | 本ファイル（上書き） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
raw snapshot sha256 `94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`
（data/INVENTORY.json の `raw_snapshot` と一致確認済み。`IndividualIncomeTax.lean` と同一ピン。）

**名前空間: `JapanTaxLaw.IncomeMiscDeductions`（サブ名前空間）**。
フラットな `JapanTaxLaw` には `LocalIncomeTax.lean`（地方税法 art. 34）が
`widowDeduction = 260_000` / `singleParentDeduction = 300_000` /
`workingStudentDeduction = 260_000` を既に定義しており、同名衝突を避けるためです。
本スライスの金額は **270,000 / 350,000 / 270,000** です。

## 1. def 一覧

### 1.1 `IncomeMiscDeductions.lean`（18 defs / 28 公開定理 / 8 smoke）

**控除3条（控除額定数 + saturating 控除後）**

| def | 条 | 値／式 |  needle 対応 |
| --- | --- | --- | --- |
| `widowDeduction` | 第80条 寡婦控除 | 270,000 | #1, #2 |
| `incomeAfterWidowDeduction` | 第80条 | `totalIncome - widowDeduction`（saturating） | #1 |
| `singleParentDeduction` | 第81条 ひとり親控除 | 350,000 | #3, #4 |
| `incomeAfterSingleParentDeduction` | 第81条 | `totalIncome - singleParentDeduction`（saturating） | #3 |
| `workingStudentDeduction` | 第82条 勤労学生控除 | 270,000 | #5, #6 |
| `incomeAfterWorkingStudentDeduction` | 第82条 | `totalIncome - workingStudentDeduction`（saturating） | #5 |

**税率4条（金額 × 率、`TaxRate.applyFloor`）**

| def | 条 | 率／式 | needle 対応 |
| --- | --- | --- | --- |
| `profitDistributionRate` | 第211条 | `⟨20,100⟩` | #12 |
| `profitDistributionWithholdingTax` | 第211条 | `利益分配額 × 20/100` | #12 |
| `benefitSupplementRate` | 第209条の3 | `⟨15,100⟩` | #11 |
| `benefitSupplementWithholdingTax` | 第209条の3 | `給付補てん金等 × 15/100` | #11 |
| `interestWithholdingRate` | 第182条 利子等 | `⟨15,100⟩` | #9 |
| `dividendWithholdingRate` | 第182条 配当等 | `⟨20,100⟩` | #10 |
| `article182Rate` | 第182条 区分選択 | `isDividend ? 20% : 15%` | #9, #10 |
| `article182WithholdingTax` | 第182条 | `金額 × (15% or 20%)/100` | #9, #10 |
| `separateTaxationRate` | 第170条 原則 | `⟨20,100⟩` | #7 |
| `separateTaxationReducedRate` | 第170条 一部 | `⟨15,100⟩` | #8 |
| `article170Rate` | 第170条 率選択 | `isReduced ? 15% : 20%` | #7, #8 |
| `article170SeparateTax` | 第170条 | `国内源泉所得 × (20% or 15%)/100` | #7, #8 |

- 公開定理 28 本: 控除額 `*_pos` 3、saturating の `*_of_ge` / `*_of_lt` / `*_le_total` 各 3、
  率 `*_num_pos` 6、率選択 characterization 4、法定リテラルへの `exact` 接続 6。
  （`Nat.sub_eq_zero_of_le` は core で `propext` 依存のため、
  自前の axiom-free 補助 `natSubEqZeroOfLeFree`（`private`）で `*_of_lt` を証明。）
- 該当性（寡婦／ひとり親／勤労学生、利子等／配当等、161条1項8号・15号該当）は
  caller-established Bool とし、金額算出式には入れていません。

### 1.2 `IncomeMiscDeductionsSpec.lean`（12 defs）

- 独立整数定式: `specWidowDeduction` / `specSingleParentDeduction` /
  `specWorkingStudentDeduction` / `specIncomeAfter` /
  `specIncomeAfterWidowDeduction` / `specIncomeAfterSingleParentDeduction` /
  `specIncomeAfterWorkingStudentDeduction` /
  `specProfitDistributionWithholdingTax` / `specBenefitSupplementWithholdingTax` /
  `specArticle182WithholdingTax` / `specArticle170SeparateTax`。
  `TaxRate.applyFloor` を使わず `* 20 / 100` 等を直接記述し、
  控除は明示 `if` で saturating を表現（fill 減算のアンダーフローに依存しない）。
- `agreeIncomeMiscDeductions : Bool` — impl と spec の全テスト点（総所得 9 点 × 控除3条、
  金額 12 点 × 税率_FUNCTION 6 通り）を `==` 比較。
  `example : agreeIncomeMiscDeductions = true := by decide`。

### 1.3 `IncomeMiscDeductionsTests.lean`

- `example ... := by decide` の kernel-decide smoke 32 本のみ（新規定理名なし）。

### 1.4 doc-comment に明記した射程外（overclaim 防止）

- 所得の金額（totalIncome）自体の算定、控除の適用順序、復興特別所得税・防衛特別所得税、
  確定申告調整、端数処理（通則法 art. 118 / 119）、art. 170「前条に規定する所得税の額」の算定は非モデル化。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "居住者が寡婦である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から二十七万円を控除する",
    "前項の規定による控除は、寡婦控除という",
    "居住者がひとり親である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から三十五万円を控除する",
    "前項の規定による控除は、ひとり親控除という",
    "居住者が勤労学生である場合には、その者のその年分の総所得金額、退職所得金額又は山林所得金額から二十七万円を控除する",
    "前項の規定による控除は、勤労学生控除という",
    "国内源泉所得の金額に百分の二十",
    "については、百分の十五）の税率を乗じて計算した金額とする",
    "一利子等その金額に百分の十五の税率を乗じて計算した金額",
    "二配当等その金額に百分の二十の税率を乗じて計算した金額",
    "給付補てん金、利息、利益又は差益の額に百分の十五の税率を乗じて計算した金額とする",
    "契約に基づき支払われる利益の分配の額に百分の二十の税率を乗じて計算した金額とする"
  ]
}
```

> **重要（統合時の注意）**: needle は原文 pinned bytes の一字一句です。
> 文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。
> §4 の検証で実際に `.find()` したのは、まさに上記 12 文字列です（`_norm` は
> 空白・全角空白を除去するだけなので、needle 中の文字は一切変換していません）。

参考：現行スクリプト形式への変換例（name は任意）:

```python
yield ("所得税法 art. 80/81/82（寡婦・ひとり親・勤労学生控除）と art. 170/182/209の3/211（税率）↔ IncomeMiscDeductions.lean",
       "340AC0000000033",
       "file", None,
       [
         # ↑ の JSON の needles 配列 12 本をそのまま列挙
       ])
```

## 3. 期待 literal 増分

- 新規 check 1 件 × needles **12 本**なので **+12**。
- needle 数 = 12（控除3条 × 2 = 6、art.170 × 2、art.182 × 2、art.209の3 × 1、art.211 × 1）。
- `docs/PROGRESS.md` §7 の記載値はメインセッションで再確認してください。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.IncomeMiscDeductions JapanTaxLaw.IncomeMiscDeductionsSpec JapanTaxLaw.IncomeMiscDeductionsTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド・CI は未実行）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WCAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 28 本の公開定理と `agreeIncomeMiscDeductions` の **全 29 件が
    "does not depend on any axioms"**。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
    （`Nat.sub_eq_zero_of_le` / `Nat.sub_eq_zero_iff_le` / `omega` は core で `propext`
    に依存するため、`natSubEqZeroOfLeFree`（axiom-free 帰納法）に置き換えた。）
- 原文逐語検証: 下記 §5 のとおり **12/12 FOUND、MISS 0 件**。
  normalized テキスト（支給ファイル `W_C_income.txt`）と pinned JSON の
  `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した
  両方で各 needle の出現回数は **1**（一意）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

needle を `_norm = re.sub(r"[\s　]+", "", ...)` で正規化し、Python の `.find()` で検索
（needle 側も同正規化）。`law id 340AC0000000033` と revision は INVENTORY.json で一致確認済み。

| # | 対象 | 結果 | len | 出現回数(norm) | offset(norm: 支給テキスト) | offset(norm: pinned JSON) |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | widowDeduction（寡婦・27万） | FOUND | 55 | 1 | 18 | 98750 |
| 2 | 寡婦控除という | FOUND | 19 | 1 | 75 | 98807 |
| 3 | singleParentDeduction（ひとり親・35万） | FOUND | 57 | 1 | 117 | 98840 |
| 4 | ひとり親控除という | FOUND | 21 | 1 | 176 | 98899 |
| 5 | workingStudentDeduction（勤労学生・27万） | FOUND | 57 | 1 | 220 | 98934 |
| 6 | 勤労学生控除という | FOUND | 21 | 1 | 279 | 98993 |
| 7 | art.170 原則 20% | FOUND | 15 | 1 | 351 | 187954 |
| 8 | art.170 一部 15% | FOUND | 28 | 1 | 422 | 188025 |
| 9 | art.182 利子等 15% | FOUND | 27 | 1 | 517 | 197378 |
| 10 | art.182 配当等 20% | FOUND | 27 | 1 | 544 | 197405 |
| 11 | art.209の3 給付補てん金等 15% | FOUND | 40 | 1 | 622 | 229536 |
| 12 | art.211 利益分配 20% | FOUND | 40 | 1 | 712 | 229778 |

- **FOUND 12 件 / MISS 0 件。** アンカーの勝手な変更・正規化はしていません。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`IndividualIncomeTax` 3 行の直後に追加）:
  ```text
  JapanTaxLaw/IncomeMiscDeductions.lean / -Spec.lean / -Tests.lean  # 所得税法 art.80/81/82（寡婦・ひとり親・勤労学生控除）と art.170/182/209の3/211（源泉徴収・分離課税の税率）bounded L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 art.80/81/82 寡婦(27万)・ひとり親(35万)・勤労学生(27万)控除と art.170/182/209の3/211 税率 IncomeMiscDeductions.lean（控除3条は saturating Nat、税率4条は TaxRate.applyFloor、区分該当性は caller-established）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.IncomeMiscDeductions
import JapanTaxLaw.IncomeMiscDeductionsSpec
import JapanTaxLaw.IncomeMiscDeductionsTests
```

（W-C は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 所得税法の上記 **7 条文のみ**（控除3条・税率4条）。
  所得税法全体、他の控除・税率・申告・納付・分離課税の詳細は NOT YET COVERED。
- 寡婦／ひとり親／勤労学生該当性、利子等／配当等の区分、161条1項8号・15号該当性は
  caller-established であり、法的判断の自動化はしていません。
- 名称衝突を避けるため `JapanTaxLaw.IncomeMiscDeductions` サブ名前空間を採用しました
  （フラットな同名 def は `LocalIncomeTax.lean` に別金額で既存）。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-C は実行していません）。
