# STAGING IAD — 租税特別措置法 art. 41の3の11（所得金額調整控除）bounded L4 モデル

Pinned source: law_id `332AC0000000026` / revision `332AC0000000026_20261101_507AC0000000013`
（租税特別措置法, enforcement 2026-11-01; raw snapshot
`data/raw/332AC0000000026_20261101_507AC0000000013.law.json`）。担当範囲原文は
`C5_adj_income.txt`（1361 文字）。当該条 leaf-text を `re.sub(r"[\s　]+", "", ...)`
で正規化したテキストと担当範囲原文の本文は一字不変で同一（1361 文字、U+3000 不包含）。

## def 一覧（namespace `JapanTaxLaw.IncomeAdjustmentDeduction`, Money = Nat）

### 実装 `IncomeAdjustmentDeduction.lean` — 7 defs + 12 定理

| def | 式 | 根拠 |
|---|---|---|
| `salaryIncomeThreshold` | `8_500_000` | 第1項「八百五十万円」 |
| `salaryIncomeCap` | `10_000_000` | 第1項「千万円」 |
| `adjustmentRateNumerator` | `10` | 第1項「百分の十」 |
| `adjustmentRateDenominator` | `100` | 第1項「百分の十」 |
| `smallIncomeCap` | `100_000` | 第2項「十万円」 |
| `incomeAdjustmentDeduction1 salary` | `(min salary salaryIncomeCap - salaryIncomeThreshold) * adjustmentRateNumerator / adjustmentRateDenominator` | 原文「（当該給与等の収入金額が千万円を超える場合には、千万円）から八百五十万円を控除した金額の百分の十に相当する金額」。saturating Nat、`salary ≤ 8_500_000` → 0、`salary ≥ 10_000_000` → 150_000 |
| `incomeAdjustmentDeduction2 salaryAfter pensionOther` | `min salaryAfter smallIncomeCap + min pensionOther smallIncomeCap - smallIncomeCap` | 原文「（…十万円）及び（…十万円）の合計額から十万円を控除した残額」。saturating Nat、合計 ≤ 100_000 → 0 |

定理 11 件（positivity 5: `salaryIncomeThreshold_pos` / `salaryIncomeCap_pos` /
`adjustmentRateNumerator_pos` / `adjustmentRateDenominator_pos` / `smallIncomeCap_pos`;
大小 2: `salaryIncomeThreshold_lt_cap` / `smallIncomeCap_lt_salaryThreshold`;
境界 4: `incomeAdjustmentDeduction1_of_le_threshold` / `incomeAdjustmentDeduction1_of_ge_cap` /
`incomeAdjustmentDeduction2_of_sum_le_cap` / `incomeAdjustmentDeduction2_of_both_ge_cap`）
＋ private `natSubEqZeroOfLeFree`（axiom-free な saturating 証明用、帰納法）。

### Spec `IncomeAdjustmentDeductionSpec.lean` — 4 defs

- `specIncomeAdjustmentDeduction1`: `if salary ≤ 8_500_000 then 0 else if salary < 10_000_000 then (salary - 8_500_000) / 10 else 150_000`（impl の `* 10 / 100` を `/ 10` で独立定式化）。
- `specIncomeAdjustmentDeduction2`: 2 つの `min` を `if` で明示し、saturating 減算も明示の `if` で書き下した独立定式。
- `agreeIncomeAdjustmentDeduction1` / `agreeIncomeAdjustmentDeduction2`: impl ↔ spec の有限グリッド一致（`by decide`、全称主張ではない）。850万円ちょうど／超、1000万円超、端数、十万境界を含む。

### Tests `IncomeAdjustmentDeductionTests.lean`

- 新規名前付き宣言なし。すべて `example ... := by decide` の kernel-decide smoke。
  境界: 850万円ちょうど（8_500_000→0）／超（8_500_001、8_500_010、8_500_011）、
  1000万円ちょうど（10_000_000→150_000）／超（10_000_001→150_000）、
  十万境界（100_000、99_999+1、100_001、200_000）、端数（99_999+2→1）。

名前付き宣言合計 **23** 件（impl defs 7 + impl 定理 12（private 1 含む）+ spec defs 4）。
`example` は無名宣言のため数に含めない。

## Transcription audit JSON fragment

```json
{
  "law_id": "332AC0000000026",
  "kind": "file",
  "title": null,
  "needles": [
    "その年中の給与等の収入金額が八百五十万円を超える居住者で、特別障害者に該当するもの又は年齢二十三歳未満の扶養親族を有するもの若しくは特別障害者である同一生計配偶者若しくは扶養親族を有するものに係る総所得金額を計算する場合には、",
    "その年中の給与等の収入金額（当該給与等の収入金額が千万円を超える場合には、千万円）から八百五十万円を控除した金額の百分の十に相当する金額を、その年分の給与所得の金額から控除する。",
    "その年分の給与所得控除後の給与等の金額及び公的年金等に係る雑所得の金額がある居住者で、当該給与所得控除後の給与等の金額及び当該公的年金等に係る雑所得の金額の合計額が十万円を超えるものに係る総所得金額を計算する場合には、",
    "当該給与所得控除後の給与等の金額（当該給与所得控除後の給与等の金額が十万円を超える場合には、十万円）及び当該公的年金等に係る雑所得の金額（当該公的年金等に係る雑所得の金額が十万円を超える場合には、十万円）の合計額から十万円を控除した残額",
    "第一項の場合において、居住者が特別障害者に該当するかどうか又はその者が年齢二十三歳未満の扶養親族に該当するかどうか若しくは特別障害者である同一生計配偶者若しくは扶養親族に該当するかどうかの判定は、その年十二月三十一日"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.IncomeAdjustmentDeduction JapanTaxLaw.IncomeAdjustmentDeductionSpec JapanTaxLaw.IncomeAdjustmentDeductionTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの外部参照可能な名前付き宣言
   **22** 件（private 1 件は外部名がなく除外）を列挙し `lake env lean`（exit code 0）で
   `#print axioms`。結果: axiom-free **19** 件、`propext` のみ **3** 件（許容）、
   `Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle すべてについて、pinned JSON の当該条 leaf-text から
   `re.sub(r"[\s　]+", "", ...)` で正規化したテキスト（1361 文字、U+3000 不包含）に
   `.find() >= 0`。文字数 113 / 89 / 109 / 118 / 108、出現位置 20 / 133 / 223 / 332 / 505、
   いずれも U+3000 不包含。**FOUND 5 / MISS 0**。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.IncomeAdjustmentDeduction
import JapanTaxLaw.IncomeAdjustmentDeductionSpec
import JapanTaxLaw.IncomeAdjustmentDeductionTests
```

## README / PROGRESS 1行文案

- README: `IncomeAdjustmentDeduction — 租税特別措置法 art.41の3の11（所得金額調整控除）の bounded L4 モデル（第1項 (min 給与 1000万 − 850万) × 10%、第2項 min 控除後 10万 + min 年金雑所得 10万 − 10万、saturating Money、caller-established 該当性）。`
- PROGRESS: `Added IncomeAdjustmentDeduction{,,Spec,,Tests}: art.41-3-11 income adjustment deduction (two capped formulas, saturating Nat), 23 named decls axiom-probed; 5 verbatim needles; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- **第3項の判定基準日（その年十二月三十一日、死亡・出国の場合はその時、判定に係る者が
  既に死亡している場合は死亡の時）は NOT MODELLED**。原文は「判定は、その年十二月三十一日…
  の現況による」と定めるが、これは日付と人的現況による法的判断であり金額算定式ではない。
  架空の日付計算・状態遷移を仮定せず、本モジュールは第1項・第2項の金額式のみを扱います。
- 給与等の収入金額、給与所得控除後の給与等の金額、公的年金等に係る雑所得の金額、
  居住者であること、特別障害者／23歳未満扶養親族／同一生計配偶者等への該当性、
  そして第1項・第2項の適用の有無は caller-established。Bool（該当性・適用可否）は
  金額式に入れず、Caller が適用条項を選びます。第2項の「第1項の控除をした残額」も
  caller-established な入力 `salaryAfter` として受け取ります。
- 総所得金額自体の算定、所得税法第22条・第121条第3項の読み替え（第5項・第6項）、
  税額計算、他の所得控除との調整、端数処理（通則法 art. 118 / 119）、政令（第7項）、
  第4項の用語定義の詳細（所得税法各条への参照）は NOT MODELLED。
- 転記監査は fidelity-only であり法的正しさを保証しない。人間の法的レビューではない。
  完成・網羅を主張しない。

L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
