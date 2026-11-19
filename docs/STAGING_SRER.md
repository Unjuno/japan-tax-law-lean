# STAGING SRER — 地方税法施行令 art. 35の4の6（標準税率超過率）bounded L4 モデル

Pinned source: law_id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083`
（地方税法施行令, enforcement 2026-11-01; raw snapshot
`data/raw/325CO0000000245_20261101_508CO0000000083.law.json`）。担当範囲の原文は
`C:\Users\junny\AppData\Local\Temp\opencode\C4_rate_above.txt`（UTF-8, 833 文字）とも一致。

## def 一覧（namespace `JapanTaxLaw.StandardRateExcessRatio`, Money = Nat）

| def | 式 | 根拠 |
|---|---|---|
| `sumMoney xs` | `[] ↦ 0`; `x :: rest ↦ x + sumMoney rest` | 一号〜三号・五号（および四号）の事業税額の合計。各額は caller-established |
| `standardRateExcessRatio baseTax standardTaxEquivalent` | `if baseTax = 0 then 0 else (baseTax - standardTaxEquivalent) / baseTax` | 1項「基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率」。Nat 除算（切り捨て）、分母 0 は 0 を返す安全版 |
| `baseBusinessTax amounts deductions` | `sumMoney amounts - sumMoney deductions` | 2項「第一号から第三号まで及び第五号に掲げる事業税額の合計額から第四号に掲げる事業税額を控除した額」。saturating Nat |
| `excessRatioFromItems amounts deductions standardTaxEquivalent` | `standardRateExcessRatio (baseBusinessTax amounts deductions) standardTaxEquivalent` | 1項を2項から組み立てたもの |

### verified facts / Spec / agree / Tests

- 実装側の verified facts / positivity 定理 **12** 件
  （`sumMoney_nil`, `sumMoney_cons`, `standardRateExcessRatio_zero_base`,
  `standardRateExcessRatio_eq_div`, `standardRateExcessRatio_self`,
  `standardRateExcessRatio_zero_of_ge`, `standardRateExcessRatio_le_one`,
  `baseBusinessTax_eq`, `baseBusinessTax_le_amounts`,
  `baseBusinessTax_eq_zero_of_ge`, `baseBusinessTax_eq_amounts_of_no_deduction`,
  `excessRatioFromItems_eq`）。
- Spec（独立整数定式）: `specStandardRateExcessRatio`（`==` 判定・除算）,
  `specSumMoney`（再帰パターン）, `specBaseBusinessTax`（saturating を `if a ≤ d then 0` で明示）,
  `specExcessRatioFromItems` — impl と独立に定式化。
- Spot-check: `agreeStandardRateExcessRatio`（3 群の有限点点の `==` 一致、`by decide`）。
- Tests: 境界（分母 0 / `baseTax = standardTaxEquivalent` で 0 / 端数切り捨て /
  控除 > 合計で saturating 零 / 控除 0 で率 1）の `by decide` smoke。
- 名前付き宣言合計 **21** 件（impl defs 4 + impl 定理 12 + spec defs 4 + agree def 1）。
  Tests は無名 `example` のみ。

## Transcription audit JSON fragment

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "道府県知事が基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率（第四項及び次条において「標準税率超過率」という。）とする。",
    "前項の基準事業税額とは、第一号から第三号まで及び第五号に掲げる事業税額の合計額から第四号に掲げる事業税額を控除した額をいう。",
    "一前年度三月から当該年度二月までの間（以下この項において「算定期間」という。）に道府県知事に提出された法第七十二条の二十五、第七十二条の二十八又は第七十二条の二十九の規定による申告書に記載された事業税額",
    "四算定期間に道府県知事が更正をした場合における当該更正により減少した事業税額",
    "前項各号に掲げる事業税額に係る税率が法第七十二条の七十六第一号に規定する標準税率（次条第一項において「標準税率」という。）であるものとした場合における前項に規定する基準事業税額として算定した額をいう。"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.StandardRateExcessRatio JapanTaxLaw.StandardRateExcessRatioSpec JapanTaxLaw.StandardRateExcessRatioTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **21** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **14** 件、
   `propext` のみ **7** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle すべてについて、pinned JSON の当該条 leaf-text を
   U+3000 除去した正規化テキスト（833 文字、U+3000 不包含）に `.find() >= 0`。
   文字数 75 / 62 / 101 / 38 / 100（すべて原文から一字も変えず抽出）、U+3000 不包含。
   MISS なし。当該条の原文は U+3000 を 1 も含まないため正規化テキスト＝原文。
5. **def 数**: 名前付き宣言 21 件（impl 4 defs + 12 theorems, spec 4 defs, agree 1 def）。
   無名 `example` は別途多数（smoke / points / tests）。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.StandardRateExcessRatio
import JapanTaxLaw.StandardRateExcessRatioSpec
import JapanTaxLaw.StandardRateExcessRatioTests
```

## README / PROGRESS 1行文案

- README: `StandardRateExcessRatio — 地方税法施行令 art.35の4の6 の標準税率超過率 (基準事業税額−標準税率相当額)÷基準事業税額 と、一号〜三号・五号の合計−四号の基準事業税額（bounded L4, saturating Money, caller-established 額/該当性）。`
- PROGRESS: `Added StandardRateExcessRatio{,,Spec,,Tests}: art.35の4の6 1項 ratio (zero-den safe, Nat floor) + 2項 base (items 1-3,5 sum minus item 4, saturating); 21 named decls axiom-probed; 5 verbatim needles; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- 基準事業税額・標準税率相当額・各号の事業税額・該当性はすべて caller-established。
  Bool は金額式に入れない（判定は呼び出し側で行い、Money として渡す）。
- **2項の算定期間**（前年度三月から当該年度二月まで）および各申告書
  （法第七十二条の二十五・二十八・二十九による申告書、第七十二条の三十一第二項・第三項の
  修正申告書、第七十二条の三十九・四十一・四十一の二による更正・決定）の**具体的認定は
  NOT MODELLED**。本モジュールは既に認定済みの金額の合計・控除構造のみを写す。
- 3項の標準税率相当額の算定（税率が標準税率であるとした場合の再計算）、4項の総務省令、
  および「毎年度」「第四項及び次条」の定義は NOT MODELLED / caller-established。
- Nat 除算・減算により端数は切り捨て・控除超過は 0（saturating）。特に
  `0 < standardTaxEquivalent ≤ baseTax` のとき整数除算で比は 0、`= 0` のとき 1 にしかならない。
  有理数での割合・丸め規則は NOT MODELLED。
- 転記監査は fidelity-only であり法的正しさを保証しない。

小さな L4 スライスであり、完成・網羅を主張しない。人間の法的レビューではない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
