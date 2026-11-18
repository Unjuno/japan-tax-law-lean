# STAGING ANMINMAX — 相続税法 art. 24(1) 四号 および art. 24(3)(4)（一時金の給付金額／有期・終身の min・max 選択）

Pinned source: law_id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008`
（相続税法, enforcement 2026-04-01; raw snapshot
`data/raw/325AC0000000073_20260401_506AC0000000008.law.json`）。

## def 一覧（namespace `JapanTaxLaw.InheritanceAnnuityMinMax`, Money = Nat）

| def | 式 | 根拠 |
|---|---|---|
| `lumpSumPaymentAmount amount` | `amount` | art. 24(1) 四号「一時金その給付金額」 |
| `conditionalAnnuityValue termValue lifetimeValue` | `min termValue lifetimeValue` | art. 24(3)「いずれか少ない金額」 |
| `continuingAnnuityValue termValue lifetimeValue` | `max termValue lifetimeValue` | art. 24(4)「いずれか多い金額」 |
| `annuityMinMaxValue isContinuingContract termValue lifetimeValue` | `if isContinuingContract then continuingAnnuityValue … else conditionalAnnuityValue …` | 契約種別（3項/4項）の caller-established Bool による選択のみ。Bool は金額の算術に入れない。 |

Spec（独立定式）: `specLumpSumPaymentAmount`, `specConditionalAnnuityValue`（`if` による min の別表現）,
`specContinuingAnnuityValue`（`if` による max の別表現）, `specAnnuityMinMaxValue`。
Spot-check: `agreeLumpSumPaymentAmount`, `agreeConditionalAnnuityValue`,
`agreeContinuingAnnuityValue`, `agreeAnnuityMinMaxValue`（いずれも `by decide`）。

有期・終身の各算出額は caller-established Money。art. 24(1) 一号〜三号の max 構造は
`JapanTaxLaw.InheritanceAnnuityMaxima`（W-AnMax）が担当し、重複定義していない。
複利年金現価率・予定利率・余命年数・平均額との乗除は NOT MODELLED。第24条(2)(5) は対象外。

## Transcription audit JSON fragment

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "四第三条第一項第五号に規定する一時金その給付金額２前項に規定する定期金給付契約に関する権利で同項第三号の規定の適用を受けるものにつき、その目的とされた者が当該契約に関する権利を取得",
    "その権利者に対し、一定期間、かつ、その目的とされた者の生存中、定期金を給付する契約に基づくものの価額は、同項第一号に規定する有期定期金として算出した金額又は同項第三号に規定する終身定期金として算出した金額のいずれか少ない金額による。",
    "その者が死亡したときはその権利者又はその遺族その他の第三者に対し継続して定期金を給付する契約に基づくものの価額は、同項第一号に規定する有期定期金として算出した金額又は同項第三号に規定する終身定期金として算出した金額のいずれか多い金額による。",
    "定期金として算出した金額又は同項第三号に規定する終身定期金として算出した金額のいずれか少ない金額による。４第一項に規定する定期金給付契約に関する権利で、その目的とされた者の生存中定期金を給付し"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.InheritanceAnnuityMinMax JapanTaxLaw.InheritanceAnnuityMinMaxSpec JapanTaxLaw.InheritanceAnnuityMinMaxTests`
   → `Build completed successfully (5 jobs)`. 警告なし。全体ビルド／CI／`run_python_gates` は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **26** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **18** 件、
   `propext` のみ **8** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 4 needle すべてについて、pinned 正規化原文
   `inherit_art24.txt`（1583 文字）と pinned JSON の leaf-text を U+3000 除去した
   正規化テキストの双方に `.find() >= 0`。文字数 90 / 116 / 120 / 96（すべて 60〜130）、
   U+3000 不包含。MISS なし。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.InheritanceAnnuityMinMax
import JapanTaxLaw.InheritanceAnnuityMinMaxSpec
import JapanTaxLaw.InheritanceAnnuityMinMaxTests
```

## README / PROGRESS 1行文案

- README: `InheritanceAnnuityMinMax — 相続税法 art.24(1)四号・(3)(4) の一時金給付金額／有期・終身の min・max 選択（bounded L4, caller-established Money/Bool）。`
- PROGRESS: `Added InheritanceAnnuityMinMax{,,Spec,,Tests}: art.24(1)四号 identity, art.24(3) min, art.24(4) max; 26 named decls axiom-probed; 4 verbatim needles; integration 3 imports pending.`

## Honest scope

小さな L4 スライスであり、完成・網羅を主張しない。人間の法的レビューではない。
L7 候補 **3438 件は unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
