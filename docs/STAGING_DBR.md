# STAGING DBR — 租税特別措置法施行令 art. 26の12（繰上償還等の場合の所得税の還付）bounded L4 モデル

Pinned source: law_id `332CO0000000043` / revision `332CO0000000043_20261101_507CO0000000127`
（租税特別措置法施行令, enforcement 2026-11-01; raw snapshot
`data/raw/332CO0000000043_20261101_507CO0000000127.law.json`, Article Num `26_12`,
normalized leaf text 747 chars）。担当範囲の原文は
`C:\Users\junny\AppData\Local\Temp\opencode\C5_refund.txt`（UTF-8, 747 文字）とも一致
（正規化テキストとの完全一致を確認、いずれも U+3000 を 1 も含まない）。

## def 一覧（namespace `JapanTaxLaw.DiscountBondRefund`, Money = Nat）

### 本則 — 券面金額 − 償還金額（買入金額）× 徴収税率

| def | 式 | 根拠 |
|---|---|---|
| `discountBondRefund faceAmount redemptionAmount withholdingRate` | `withholdingRate.applyFloor (faceAmount - redemptionAmount)` | 原文「割引債の券面金額から償還金額…を控除した金額…に、…徴収された所得税の税率を乗じて計算した金額」。Nat 減算は saturating（券面 ≤ 償還なら 0）、税率適用は `TaxRate.applyFloor`（切り捨て）、税率は caller-established |

`redemptionAmount` には原文「買入消却が行われる場合には、その買入金額」を適用済みの
値（償還金額または買入金額）を渡す。買入消却かどうかの区分は caller-established で
Bool は金額式に入れない。

### 外国法人が国外発行した割引債（一号・二号）— 案分の基盤と還付額

| def | 式 | 根拠 |
|---|---|---|
| `foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart` | `(faceAmount - redemptionAmount) * domesticPart / issuanceDiscount` | 原文「券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額」。イ = 社債発行差金、ロ = 国内帰属部分。割合を `domesticPart / issuanceDiscount` として乗じてから除する形式（整数除算の精度保持）。分母 0 → 0（安全版）、券面 ≤ 償還なら 0 |
| `foreignBondRefund faceAmount redemptionAmount issuanceDiscount domesticPart withholdingRate` | `withholdingRate.applyFloor (foreignBondBase ...)` | 原文の括弧内（外国法人分の金額）を本則の「券面−償還」の代わりに税率へ乗じる構造。一号・二号は同じ算術構造で、旧法人法の区分は caller-established |

### verified facts / Spec / agree / Tests

- 実装側の verified facts / positivity 定理 **19** 件:
  `discountBondRefund_eq`, `discountBondRefund_same`, `discountBondRefund_zero_of_le`,
  `discountBondRefund_zero_rate`, `discountBondRefund_pos`, `discountBondRefund_mono_face`,
  `foreignBondBase_eq`, `foreignBondBase_zero_denominator`, `foreignBondBase_same`,
  `foreignBondBase_zero_of_le`, `foreignBondBase_zero_domestic`,
  `foreignBondBase_domestic_full`, `foreignBondBase_pos`, `foreignBondBase_mono_domestic`,
  `foreignBondRefund_eq`, `foreignBondRefund_same`,
  `foreignBondRefund_zero_denominator`, `foreignBondRefund_eq_discountBondRefund`,
  `foreignBondRefund_pos`。
- Spec（独立整数定式、`TaxRate` / `applyFloor` を使わない）: `specDiscountBondRefund`
  （被乗数を入れ替え saturating を `if` で明示）, `specForeignBondBase`
  （分母零・saturating を `if` で明示）, `specForeignBondRefund`（税率適用を独立定式で）。
- Spot-check: `agreeDiscountBondRefund`, `agreeForeignBondBase`, `agreeForeignBondRefund`
  （有限点の `==` 一致、`by decide`。分母零・券面 = 償還・券面 < 償還・端数切り捨てを含む）。
- Tests: kernel-decide smoke（境界: 券面 = 償還で 0、買入金額 > 券面で 0、税率分子 0、
  分母 0、国内帰属部分 0、割合 1 で本則に一致、端数切り捨て、買入消却区分の例）。
- 名前付き宣言合計 **28** 件（impl defs 3 + impl 定理 19 + spec defs 3 + agree defs 3）。
  `example` は無名宣言のため数に含めない。

## Transcription audit JSON fragment

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "（繰上償還等の場合の所得税の還付）第二十六条の十二法第四十一条の十二第五項の規定により還付する所得税の額は、割引債の券面金額から償還金額（買入消却が行われる場合には、その買入金額。以下この項において同じ。）を控除した金額",
    "に、当該割引債の発行の際に同条第三項の規定により当該割引債に係る償還差益について徴収された所得税の税率を乗じて計算した金額とする。",
    "第百四十一条第一号に掲げる外国法人が国外において発行した割引債の券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額",
    "イ当該割引債の社債発行差金ロイに掲げる金額のうち当該外国法人の平成二十六年旧法人税法第百四十一条第一号に規定する事業を行う一定の場所を通じて国内において行う事業に帰せられる部分の金額",
    "２法第四十一条の十二第五項の規定による還付は、同項に規定する償還の際、還付する。この場合において、当該還付をする金額は、同条第三項又は所得税法第百八十一条若しくは第二百十二条の規定により納付すべき金額から控除する。"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.DiscountBondRefund JapanTaxLaw.DiscountBondRefundSpec JapanTaxLaw.DiscountBondRefundTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **28** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **12** 件、
   `propext` のみ **16** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle すべてについて、pinned JSON の当該条 leaf-text から
   正規化したテキスト（747 文字、U+3000 不包含）に `.find() >= 0` → **FOUND**（MISS 0）。
   文字数 110 / 65 / 84 / 91 / 107、出現位置 0 / 149 / 288 / 372 / 640、
   いずれも U+3000 不包含。当該条の原文は U+3000 を 1 も含まないため
   正規化テキスト＝原文（C5_refund.txt の 747 文字とも完全一致）。
5. **def 数**: 名前付き宣言 28 件（impl 3 defs + 19 theorems, spec 3 defs, agree 3 defs）。
   無名 `example` は別途多数（smoke / points / tests）。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.DiscountBondRefund
import JapanTaxLaw.DiscountBondRefundSpec
import JapanTaxLaw.DiscountBondRefundTests
```

## README / PROGRESS 1行文案

- README: `DiscountBondRefund — 租税特別措置法施行令 art.26の12 の繰上償還等の場合の所得税の還付（本則 (券面−償還/買入)×徴収税率、外国法人分 (券面−償還)×国内帰属部分/社債発行差金、bounded L4, saturating Money, caller-established 額/区分/旧法人法認定 NOT MODELLED）。`
- PROGRESS: `Added DiscountBondRefund{,,Spec,,Tests}: art.26の12 refund (rate × (face−redemption) via applyFloor, foreign bond base with zero-den safe); 28 named decls axiom-probed (12 axiom-free/16 propext); 5 verbatim needles; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- **平成二十六年旧法人税法第百四十一条第一号・第二号・第三号に掲げる外国法人の
  具体的認定は NOT MODELLED**。原文は一号・二号の適用範囲を「所得税法等の一部を
  改正する法律（平成二十六年法律第十号）第三条の規定による改正前の法人税法
  （平成二十六年旧法人税法）第百四十一条第○号に掲げる外国法人」と規定するが、
  その認定（事業の種類、国内において行う事業に帰せられる部分の算定、
  「事業を行う一定の場所を通じて国内において行う事業」の判定、一号／二号の区分）は
  本モジュールの外にある。架空の認定式を仮定せず、`domesticPart` は認定済みの金額として
  受け取るだけである。これが本スライスで NOT MODELLED とする主な理由である。
- 券面金額・償還金額・買入金額・税率（ num/den と発行時に徴収済みであること）・
  社債発行差金・国内帰属部分・一号／二号該当性・外国法人が国外発行したこと・
  買入消却が行われたことはすべて caller-established。Bool（区分）は金額式に入れず、
  Caller が本則／外国法人分および一号／二号の適用を選ぶ。
- 法第四十一条の十二第三項の税率そのものの算定、第五項の還付の成立、償還の際の
  還付手続、還付額を納付すべき金額から控除する処理、所得税法第百八十一条・
  第二百十二条の納付額は NOT MODELLED / caller-established。
- 原文は「割合」を有理数で述べるが、本モデルは整数の乗除（切り捨て）で近似する。
  厳密な有理数割合・丸め規則の詳細、分母零の退化ケースに法的意味があるとは主張しない。
- 転記監査は fidelity-only であり法的正しさを保証しない。人間の法的レビューではない。

小さな L4 スライスであり、完成・網羅を主張しない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
