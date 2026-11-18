# STAGING SPR — 相続税法 art. 23の2（配偶者居住権等の評価）bounded L4 モデル

Pinned source: law_id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008`
（相続税法, enforcement 2026-04-01; raw snapshot
`data/raw/325AC0000000073_20260401_506AC0000000008.law.json`）。

## def 一覧（namespace `JapanTaxLaw.SpouseResidenceValuation`, Money = Nat）

### 二号: 年数と「数」

| def | 式 | 根拠 |
|---|---|---|
| `remainingYears usefulLife elapsed` | `if usefulLife ≤ elapsed then 0 else usefulLife - elapsed` | ロ（耐用年数 − 経過年数）、原文「零以下である場合には、零」を saturating Nat で表現 |
| `netBuildingYears usefulLife elapsed duration` | `remainingYears usefulLife (elapsed + duration)` | イ（耐用年数 − 経過年数 − 存続年数）、saturating |
| `yearsRate i ro` | `if i = 0 \|\| ro = 0 then 0 else i / ro` | 二号「イをロで除して得た数」、零→零、端数切り捨て |

### 第1項〜第4項の評価額

| def | 式 | 根拠 |
|---|---|---|
| `spouseResidenceValue buildingValue yrsRate ratio` | `buildingValue - buildingValue * yrsRate * ratio` | 第1項「一号価額から一号価額に二号の数及び三号の割合を乗じて得た金額を控除した残額」(saturating, 切り捨て) |
| `spouseResidenceValueFrom buildingValue usefulLife elapsed duration ratio` | イ・ロ → `yearsRate` → `spouseResidenceValue` | 第1項を年数から組み立てたもの |
| `residenceBuildingValue marketValue residenceValue` | `marketValue - residenceValue` | 第2項「時価から居住権の価額を控除した残額」 |
| `landUseRightValue landValue ratio` | `landValue - landValue * ratio` | 第3項「一号価額から二号金額（前号価額×第一項第三号の割合）を控除した残額」 |
| `landValueAfterUseRight marketValue useRightValue` | `marketValue - useRightValue` | 第4項「時価から第3項の権利の価額を控除した残額」 |

### 補助

- 実装側の verified facts / positivity 定理 18 件（`remainingYears_eq_zero_of_le`,
  `remainingYears_pos`, `yearsRate_eq_div`, `spouseResidenceValue_le_building`,
  `spouseResidenceValue_eq_zero_of_deduction_ge`, `landUseRightValue_eq_zero_of_ratio_ge_one` 等）。
- Spec（独立整数定式）: `specRemainingYears`, `specNetBuildingYears`, `specYearsRate`,
  `specSpouseResidenceValue`, `specResidenceBuildingValue`, `specLandUseRightValue`,
  `specLandValueAfterUseRight` — saturating を `if d ≥ b then 0 else b - d` と明示的に書き直す。
- Spot-check: `agreeRemainingYears`, `agreeNetBuildingYears`, `agreeYearsRate`,
  `agreeSpouseResidenceValue`, `agreeResidenceBuildingValue`, `agreeLandUseRightValue`,
  `agreeLandValueAfterUseRight`（いずれも有限点点の `==` 一致、`by decide`）。
- Tests: 境界（年数0 / 時価0 / 控除>時価で saturating 零 / 割合0・1）の `by decide` smoke。
- 名前付き宣言合計 **40** 件（impl defs 8 + impl 定理 18 + spec defs 7 + agree defs 7）。

## Transcription audit JSON fragment

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "配偶者居住権の価額は、第一号に掲げる価額から同号に掲げる価額に第二号に掲げる数及び第三号に掲げる割合を乗じて得た金額を控除した残額とする。",
    "二当該配偶者居住権が設定された時におけるイに掲げる年数をロに掲げる年数で除して得た数（イ又はロに掲げる年数が零以下である場合には、零）",
    "三当該配偶者居住権が設定された時における当該配偶者居住権の存続年数に応じ、法定利率による複利の計算で現価を算出するための割合として財務省令で定めるもの",
    "配偶者居住権の目的となつている建物の価額は、当該建物の相続開始の時における当該配偶者居住権が設定されていないものとした場合の時価から前項の規定により計算した当該配偶者居住権の価額を控除した残額とする。",
    "配偶者居住権の目的となつている建物の敷地の用に供される土地（土地の上に存する権利を含む。以下この条において同じ。）を当該配偶者居住権に基づき使用する権利の価額は、第一号に掲げる価額から第二号に掲げる金額を控除した残額とする。"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.SpouseResidenceValuation JapanTaxLaw.SpouseResidenceValuationSpec JapanTaxLaw.SpouseResidenceValuationTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **40** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **29** 件、
   `propext` のみ **11** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle すべてについて、pinned JSON の当該条 leaf-text を
   U+3000 除去した正規化テキスト（1187 文字、U+3000 不包含）と原文テキストの双方に
   `.find() >= 0`。文字数 69 / 67 / 75 / 100 / 112（すべて 60〜130）、U+3000 不包含。
   MISS なし。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.SpouseResidenceValuation
import JapanTaxLaw.SpouseResidenceValuationSpec
import JapanTaxLaw.SpouseResidenceValuationTests
```

## README / PROGRESS 1行文案

- README: `SpouseResidenceValuation — 相続税法 art.23の2 の配偶者居住権・建物・敷地使用権・土地の各評価（bounded L4, saturating Money, caller-established 年数/割合/時価）。`
- PROGRESS: `Added SpouseResidenceValuation{,,Spec,,Tests}: art.23の2 1項〜4項 residual values, 二号 イ/ロ/数 (zero-floor), 40 named decls axiom-probed; 5 verbatim needles; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- 一号の「政令で定めるところにより計算した金額」（建物の一部賃貸・共有持分の按分）は
  政令依存のため NOT MODELLED。時価は caller-established Money。
- 耐用年数そのものの算定、建築後経過年数の端数処理（六月以上を一年、六月未満切り捨て）、
  存続年数の算定は政令依存のため NOT MODELLED。`remainingYears` / `netBuildingYears` は
  「零以下なら零」の saturating 構造のみを写す。
- 三号の割合（法定利率による複利の計算で現価を算出するための割合として財務省令で定めるもの）、
  二号の除数、各時価は caller-established。複利計算そのものは NOT MODELLED。

小さな L4 スライスであり、完成・網羅を主張しない。人間の法的レビューではない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
