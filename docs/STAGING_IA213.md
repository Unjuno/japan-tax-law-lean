# STAGING — IA213 (所得税法 art. 213 非居住者の国内源泉所得に対する徴収税額) 受け渡しメモ

> 実装担当 IA213 からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> **完成・網羅を主張しません。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のままです。**

## 0. 対象ファイル（新規作成 4 ファイルのみ）

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeArt213Withholding.lean` | 新規 |
| `JapanTaxLaw/IncomeArt213WithholdingSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeArt213WithholdingTests.lean` | 新規 |
| `docs/STAGING_IA213.md` | 新規（本ファイル） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
（IncomeWithholdingRates.lean / IndividualIncomeTax.lean と同一ピン）。
担当原文: `C:\Users\junny\AppData\Local\Temp\opencode\C3_income213.txt`（art. 213、UTF-8、782 文字、JSON 本文と全文一致を確認済み）。

namespace: `JapanTaxLaw.IncomeArt213Withholding`（他モジュールと衝突なし）。

## 1. def 一覧

### 1.1 `IncomeArt213Withholding.lean`（実装）

税率定数・控除額:

- `def art213GeneralRate : TaxRate := ⟨20, 100, by decide⟩` — 一号の百分の二十。
- `def art213ReducedRate : TaxRate := ⟨10, 100, by decide⟩` — 二号の百分の十。
- `def pensionDeduction (months : Nat) : Money := 50_000 * months` — 一号イの五万円 × 月数。
- `def prizeDeduction : Money := 500_000` — 一号ロの五十万円。

控除後金額（saturating Nat 減算、控除 > 金額 なら 0）:

- `def art213Pension12Base (annuity : Money) (months : Nat) : Money` — イ: 年金の額 − 5万円 × 月数。
- `def art213Prize13Base (prize : Money) : Money` — ロ: 金額 − 50万円。
- `def art213Pension14Base (annuity premiumCorrespondingAmount : Money) : Money` — ハ: 年金の額 − 保険料対応額（保険料対応額は caller-established、算定は NOT MODELLED）。

区分選択・徴収税額（区分は caller-established Bool、**Bool は金額式に入れず分岐条件にのみ使用**）:

- `def art213Item1Base (amount months premiumCorrespondingAmount) (isPension12 isPrize13 isPension14 : Bool) : Money` — イ → ロ → ハ → 一般 の順で選択。
- `def art213Item1WithholdingTax (...) : Money` — 一号 = 控除後金額 × 20 / 100（applyFloor）。
- `def art213Item2WithholdingTax (amount : Money) : Money` — 二号 = 金額 × 10 / 100（applyFloor）。
- `def article213WithholdingTax (amount months premiumCorrespondingAmount) (isItem2 isPension12 isPrize13 isPension14 : Bool) : Money` — 整体。`true` = 二号、`false` = 一号。

定理（全 22 本、内訳は §3）: 率 positivity 4、控除 zero/succ 2、saturating 2 分岐 6、上限 3、区分選択 4、率選択 3。
（private 補題 `natSubEqZeroOfLeFree` は `sorry` 無しの帰納法。）

### 1.2 `IncomeArt213WithholdingSpec.lean`（独立整数定式）

`TaxRate.applyFloor` を使わず、率を直接 `* 20 / 100` / `* 10 / 100`、控除を明示的な saturating `if` で書き下し:

- `specPensionDeduction (months) := months * 50_000`（impl の `50_000 * months` と意図的に別形）
- `specPrizeDeduction`, `specPension12Base`, `specPrize13Base`, `specPension14Base`, `specItem1Base`
- `specArticle213WithholdingTax (...) : Nat`
- `agreeArticle213Withholding : Bool` — 10 組の金額/月数/保険料対応額 × 6 通りの区分フラグの有限点で impl ≡ spec を `==` 比較（全称主張ではない）。`example : agreeArticle213Withholding = true := by decide`。

### 1.3 `IncomeArt213WithholdingTests.lean`（退行テスト）

新規定理名なし、全て `example ... := by decide`。境界: 金額 0、控除 > 金額（saturating → 0）、月数 0、50万円境界、丸め（9 × 20% = 1、9 × 10% = 0）、一号 20% と二号 10% の対比。

## 2. 転記監査に追加すべき check（JSON 断片）

`kind: "file"` / `title: null` で needle 6 本。needle は一字も変えず原文から抽出、
全角空白 U+3000 を含まない。各 60〜130 文字。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "（徴収税額）第二百十三条前条第一項の規定により徴収すべき所得税の額は、次の各号の区分に応じ当該各号に定める金額とする。一前条",
    "前条第一項に規定する国内源泉所得（次号及び第三号に掲げるものを除く。）その金額（次に掲げる国内源泉所得については、それぞれ次に定める金額）に百分の二十の税率を乗じて計算した金額",
    "イ第百六十一条第一項第十二号ロ（国内源泉所得）に掲げる年金その支払われる年金の額から五万円にその支払われる年金の額に係る月数を乗じて計算した金額を控除した残額",
    "ロ第百六十一条第一項第十三号に掲げる賞金その金額（金銭以外のもので支払われる場合には、その支払の時における価額として政令で定めるところにより計算した金額）から五十万円を控除した残額",
    "ハ第百六十一条第一項第十四号に掲げる年金同号に規定する契約に基づいて支払われる年金の額から当該契約に基づいて払い込まれた保険料又は掛金の額のうちその支払われる年金の額に対応するものとして政令で定めるところにより計算した金額を控除した残額",
    "政令で定めるところにより計算した金額を控除した残額二第百六十一条第一項第五号に掲げる国内源泉所得その金額に百分の十の税率を乗じて計算した金額"
  ]
}
```

## 3. 検証結果（すべて本セッションで実行済み）

1. **ビルド**: `lake build JapanTaxLaw.IncomeArt213Withholding JapanTaxLaw.IncomeArt213WithholdingSpec JapanTaxLaw.IncomeArt213WithholdingTests`
   → **成功（5 jobs、warning なし）**。
   （当初、区分選択定理を `rfl` で示そうとして `maximum recursion depth` / `deep recursion detected` が発生。
   `by simp [art213Item1Base]` に変更して解消。これは証明戦略の問題でありモデル結果には影響しません。）
2. **`python scripts/ci/check_no_sorry.py`** → `no forbidden placeholder proofs found in tracked Lean sources`。
   （本スクリプトは `git ls-files` 対象=追跡済み .lean のみ走査。新規 3 ファイルは未追跡のため別途 self-check も実施、
   `sorry` / `admit` は実証コードに無し。）
3. **`#print axioms`**（一時ファイル `axiom_probe_IA213.lean`・実行後に削除済み）:
   - 公開定理 **22 本中 18 本は axiom 0 件**。
   - 区分選択の 4 本（`art213Item1Base_pension12` / `_prize13` / `_pension14` / `_general`）のみ `[propext]`。
     `simp` が Bool 条件の `if` を簡約する際に `propext` を経由するため（許容範囲）。
   - **`Classical.choice` も `sorryAx` も一切なし**。
4. **原文逐語検証**: pinned JSON の `ArticleTitle == 第二百十三条` 本文を正規化（`[\s　]+` 除去）
   し、各 needle を `.find()` で検索 → **6/6 FOUND**。U+3000 非含有・長さ 62/88/79/90/118/70 文字を確認。
   JSON の本文全文（782 文字）は `C3_income213.txt` と一致。

## 4. README / PROGRESS への 1 行文案（統合担当は追記してください）

README.md（3 行）:

```
JapanTaxLaw/IncomeArt213Withholding.lean     # 所得税法 art. 213（非居住者の国内源泉所得の徴収税額: 一号 20%・イ月数控除/ロ50万円控除/ハ保険料対応額控除・二号 10%）L4 モデル
JapanTaxLaw/IncomeArt213WithholdingSpec.lean # 同上 独立定式
JapanTaxLaw/IncomeArt213WithholdingTests.lean# 同上 退行テスト
```

docs/PROGRESS.md（L4 一覧行に追記）:

```
所得税法 art. 213 IncomeArt213Withholding.lean（非居住者の国内源泉所得の徴収税額: 一号（一般/イ=年金−5万円×月数/ロ=金額−50万円/ハ=年金−保険料対応額）×20%、二号（第161条第一項第五号）×10%、いずれも floor・区分は caller-established Bool・三号/第二項/政令の保険料対応額算定・該当性判定は NOT MODELLED）
```

## 5. `JapanTaxLaw.lean` に追加すべき 3 import（統合担当は追記してください）

```
import JapanTaxLaw.IncomeArt213Withholding
import JapanTaxLaw.IncomeArt213WithholdingSpec
import JapanTaxLaw.IncomeArt213WithholdingTests
```

## 6. NOT MODELLED とその理由

- **一号ハの保険料対応額の算定**（「当該契約に基づいて払い込まれた保険料又は掛金の額のうちその支払われる年金の額に対応するものとして政令で定めるところにより計算した金額」）:
  政令への委任事項であり、原文に算式が無い。caller-established な `Money` パラメータとして受け取るのみ。
- **各号・各区分の該当性判定**（一号/二号、イ/ロ/ハ、第百六十一条各号・各号ロ/ハ）:
  原文は「次の各号の区分に応じ」と規定するのみで判定基準を与えない。caller-established Bool で選択し、金額式には混入させない。
- **賞金が金銭以外で支払われる場合の価額算定**（「その支払の時における価額として政令で定めるところにより計算した金額」）:
  政令への委任事項で原文に算式が無い。価額は caller-established な金額として受け取る。
- **art. 213 第一項 三号**（第百六十一条第一項第八号及び第十五号、百分の十五）:
  担当範囲外（本担当は税率定数 20% / 10% のみ）。
- **art. 213 第二項**（前条第三項の利子等・配当等・賞金、15% / 20% / 10%）:
  担当範囲外（同上）。
- **租税条約上の軽減・免除、端数処理（通則法 art. 118 / 119）、復興特別所得税・防衛特別所得税、確定申告上の調整**:
  他法令・他条の対象であり本条の bounded 模型の外。

以上、模型的性質のみを主張し、法的正解性・網羅性は主張しません。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のままです。
