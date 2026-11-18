# STAGING LVT — 地価税法 art. 22（税率 千分の三）および art. 23（評価の原則）

Pinned source: law_id `403AC0000000069` / revision `403AC0000000069_20250601_504AC0000000068`
（地価税法, enforcement 2025-06-01; raw snapshot
`data/raw/403AC0000000069_20250601_504AC0000000068.law.json`）。

担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\S1_landvalue.txt`
（第二十二条 LEN 57 / 第二十三条 LEN 172）。

## def 一覧（namespace `JapanTaxLaw.LandValueTaxRate`, Money = Nat）

| def | 式 | 根拠 |
|---|---|---|
| `landValueTaxRate` | `⟨3, 1000, by decide⟩` | art. 22「千分の三の税率」= 3/1000 |
| `landValueTax taxableBase basicDeduction` | `landValueTaxRate.applyFloor (taxableBase - basicDeduction)` | art. 22「課税価格から基礎控除の額を控除した残額に千分の三の税率を乗じて計算した金額」 |

- 控除は **saturating Nat 減算**（`taxableBase < basicDeduction` なら残額 0）。
  境界の exact 定理: `landValueTax_zero`, `landValueTax_at_deduction`,
  `landValueTax_below_deduction`。単調性: `landValueTax_monotone_base`。
- 丸めは `TaxRate.applyFloor`（切り捨て）。独自の丸め規則は硬コードしていない。
- 課税価格・基礎控除額・該当性は **caller-established**（`Money` として受け取る）。
  `Bool` は金額の算術に入れていない。

Spec（独立整数定式）: `specLandValueTax taxableBase basicDeduction =
  (taxableBase - basicDeduction) * 3 / 1000`（`applyFloor` を再利用せず Nat 演算で書き直し）。
Spot-check: `lvtCheckGrid`（有限グリッド 40 点, 両順序）, `agreeLandValueTaxRate`
（税率 binding + グリッド + 境界/端数十二点; いずれも `by decide`）。
有限サンプルのみで普遍定理は主張しない。

## art. 23 は NOT MODELLED（評価の原則 — 算術なし）

第二十三条は「土地等の価額は、次条に定めるものを除き、課税時期における時価による」という
**評価の原則**であり、税率や税額の算術を一切含まず、金額を計算する def を置く根拠がない。
後段（相続税法第二十六条の二第一項の土地評価審議会との調査審議）も手続規定であり算術対象外。
よって本スライスでは art. 23 を数理モデル化せず、**NOT MODELLED** とする。
下記 needle の 1 本は原文保持の証拠として残すのみで、対応する Lean def は存在しない。
（「時価」の評価方法・評価審議会の調査審議は人間の法的判断に委ねる。）

## Transcription audit JSON fragment

```json
{
  "law_id": "403AC0000000069",
  "kind": "file",
  "title": null,
  "needles": [
    "（税率）第二十二条地価税の額は、課税価格から基礎控除の額を控除した残額に千分の三の税率を乗じて計算した金額とする。第三章土地等の評価",
    "（評価の原則）第二十三条土地等の価額は、次条に定めるものを除き、課税時期における時価による。２相続税法（昭和二十五年法律第七十三号）第二十六条の二第一項（土地評価審議会）に規定する土地評価審議会は、相続税に係る同条第二項の土地の評価に関する事項"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.LandValueTaxRate JapanTaxLaw.LandValueTaxRateSpec JapanTaxLaw.LandValueTaxRateTests`
   → `Build completed successfully (5 jobs)`。自作 3 モジュールのみ。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **9** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **5** 件、
   `propext` のみ **4** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 2 needle について、pinned JSON（`law_full_text` の leaf-text を
   `re.sub(r"[\s　]+", "", …)` で正規化）に対して Python `.find()` を実行。
   - needle 1（art. 22 + 第三章見出し）: 文字数 **66**, U+3000 なし, `.find()` = **8907** → HIT。
   - needle 2（art. 23）: 文字数 **122**, U+3000 なし, `.find()` = **8973** → HIT。
   - 文字数はいずれも 60〜130 の範囲内。MISS **0**。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.LandValueTaxRate
import JapanTaxLaw.LandValueTaxRateSpec
import JapanTaxLaw.LandValueTaxRateTests
```

## README / PROGRESS 1行文案

- README: `LandValueTaxRate — 地価税法 art.22 の税額算術（課税価格−基礎控除）×3/1000 を切り捨て（bounded L4, caller-established Money, saturating subtraction）；art.23 評価の原則は NOT MODELLED。`
- PROGRESS: `Added LandValueTaxRate{,,Spec,,Tests}: art.22 rate 3/1000 + saturating deduction + floor; 9 named decls axiom-probed (propext only); 2 verbatim needles; art.23 not modelled; integration 3 imports pending.`

## Honest scope

小さな L4 スライスであり、完成・網羅を主張しない。人間の法的レビューではない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/L7_CANDIDATES_UNREVIEWED.csv` / `docs/RECURSIVE_DISCOVERY.md` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
