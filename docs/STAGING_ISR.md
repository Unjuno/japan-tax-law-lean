# STAGING ISR — 地方税法施行令 art. 26（中間納付額に係る延滞金の還付）bounded L4 モデル

Pinned source: law_id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083`
（地方税法施行令, enforcement 2026-11-01; raw snapshot
`data/raw/325CO0000000245_20261101_508CO0000000083.law.json`）。

## def 一覧（namespace `JapanTaxLaw.IntermediateSurchargeRefund`, Money = Nat）

### 本則 — 延滞金額の按分還付

| def | 式 | 根拠 |
|---|---|---|
| `surchargeRefund surchargePaid refundAmount intermediateTotal` | `surchargePaid * refundAmount / intermediateTotal` | 原文「当該中間納付額について納付された延滞金額に当該中間納付額のうち…還付すべき金額…の占める割合を乗じて得た金額」。割合を分子/分母ペア `(refundAmount, intermediateTotal)` で表現。Nat 除算の切り捨て、分母 0 → 0（安全版） |

### ただし書 — 分割納付の控除

| def | 式 | 根拠 |
|---|---|---|
| `splitRefund amount1 amount2` | `amount1 - amount2` | 原文「第一号に掲げる金額から第二号に掲げる金額を控除した金額とする」。saturating Nat、`amount2 > amount1` → 0 |

### 補助

- 実装側の verified facts / positivity 定理 **13** 件（`surchargeRefund_eq`,
  `surchargeRefund_zero_denominator`, `surchargeRefund_zero_refund`,
  `surchargeRefund_zero_surchargePaid`, `surchargeRefund_full`, `surchargeRefund_pos`,
  `surchargeRefund_mono`, `surchargeRefund_le_surchargePaid`, `splitRefund_eq`,
  `splitRefund_zero_of_le`, `splitRefund_pos_of_lt`, `splitRefund_zero_applied`,
  `splitRefund_le`）。
- Spec（独立整数定式）: `specSurchargeRefund`（被乗数を入れ替えた
  `(refundAmount * surchargePaid) / intermediateTotal`）, `specSplitRefund`
  （saturating を `if amount2 ≤ amount1 then amount1 - amount2 else 0` と明示）。
- Spot-check: `agreeSurchargeRefund`, `agreeSplitRefund`（いずれも有限点点の `==` 一致、
  `by decide`。分母零・`refund=intermediateTotal`・端数切り捨て・
  `amount2 > amount1` を含む）。
- Tests: kernel-decide smoke（境界: 分母 0、還付額 = 中間納付額で納付済延滞金額そのもの、
  端数切り捨て、`amount2 > amount1` で 0、`amount1 = amount2` で 0）。
- 名前付き宣言合計 **19** 件（impl defs 2 + impl 定理 13 + spec defs 2 + agree defs 2）。
  `example` は無名宣言のため数に含めない。

## Transcription audit JSON fragment

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（中間納付額に係る延滞金の還付）第二十六条道府県知事は、前条の規定によつて中間納付額を還付する場合において、当該中間納付額について納付された法第七十二条の四十四又は第七十二条の四十五の規定による延滞金があるときは、",
    "当該延滞金のうち還付すべき中間納付額に対応するものとして、当該中間納付額について納付された延滞金額に当該中間納付額のうち前条第一項の規定により還付すべき金額（次条第一項第一号又は第二号の規定により充当される金額があるときは、これを控除した金額）の占める割合を乗じて得た金額を併せて還付する。",
    "ただし、中間納付額が分割して納付されている場合には、第一号に掲げる金額から第二号に掲げる金額を控除した金額とする。",
    "一当該中間納付額について納付された延滞金額二当該中間納付額のうち納付の順序に従い当該中間納付額に係る事業年度の法第七十二条の二十八第二項の申告書に記載された事業税額（次条第一項第一号の規定により充当される金額があるときは、これを加算した金額）に達するまで順次求めた各中間納付額につき、法の規定により計算される延滞金額の合計額"
  ]
}
```

## 検証結果

1. **build**: `lake build JapanTaxLaw.IntermediateSurchargeRefund JapanTaxLaw.IntermediateSurchargeRefundSpec JapanTaxLaw.IntermediateSurchargeRefundTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **19** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **9** 件、
   `propext` のみ **10** 件（許容）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 4 needle すべてについて、pinned JSON の当該条 leaf-text から
   ASCII タグ名トークンを除き U+3000 を除去した正規化テキスト（471 文字、
   U+3000 不包含）に `.find() >= 0`。文字数 107 / 145 / 57 / 162、
   出現位置 0 / 107 / 252 / 309、いずれも U+3000 不包含。MISS なし。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.IntermediateSurchargeRefund
import JapanTaxLaw.IntermediateSurchargeRefundSpec
import JapanTaxLaw.IntermediateSurchargeRefundTests
```

## README / PROGRESS 1行文案

- README: `IntermediateSurchargeRefund — 地方税法施行令 art.26 の中間納付額に係る延滞金の還付（本則の按分・ただし書の第一号−第二号、bounded L4, saturating Money, caller-established 延滞金/還付額/充当額/区分）。`
- PROGRESS: `Added IntermediateSurchargeRefund{,,Spec,,Tests}: art.26 surcharge apportionment (zero-floor, 切捨て) + split proviso (saturating), 19 named decls axiom-probed; 4 verbatim needles; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- **第二号の「法の規定により計算される延滞金額の合計額」は NOT MODELLED**。
  原文は「当該中間納付額のうち納付の順序に従い…事業税額に達するまで順次求めた各中間納付額につき、
  法の規定により計算される延滞金額の合計額」を要求するが、各中間納付額の延滞金額の算定と
  その合計の手続は本モジュールの外にある。架空の算定式を仮定せず、
  `splitRefund amount2` はその合計額を caller-established な入力として受け取るだけである。
- 延滞金額・還付すべき金額・中間納付額・充当される金額・分割納付かどうかの区分は
  caller-established。`surchargeRefund refundAmount` は「充当される金額があるときは、
  これを控除した金額」を適用済みの値として受け取る。Bool（区分）は金額式に入れず、
  Caller が本則／ただし書の適用を選ぶ。
- 前条（art. 25）の中間納付額還付の成立、次条（art. 27）の充当の成立、
  法第七十二条の四十四／四十五の延滞金の発生・額そのものも NOT MODELLED。
- 端数切り捨て・分母零の退化ケースに法的意味があるとは主張しない。
  転記監査は fidelity-only であり法的正しさを保証しない。人間の法的レビューではない。

小さな L4 スライスであり、完成・網羅を主張しない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
