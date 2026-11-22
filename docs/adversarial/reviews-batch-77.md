# Adversarial review — batch 77

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for ProductionVolume6KL.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### ProductionVolume6KL.lean — 酒税法施行規則 第十二条の二（製造見込数量六キロリットル以上）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 酒税法施行規則 (law id 337CO0000000097), revision 337CO0000000097_20250401_507CO0000000006
- Source: data/raw/337CO0000000097_20250401_507CO0000000006.law.json
- SHA-256: a0eb9311f04b00c430c604f8426cbafa48007530dfad8cdbd44f8ccb80d5879d
- Article Num: 12_2 (第十二条の二, Paragraph#1 / Item#2). 独立再抽出で照合 OK。
- Needle verbatim in scoped Article 12の2 (file-wide count = 1):
  「一の製造場において原料用アルコール及びスピリッツを製造しようとする場合で、製造免許を受けた後一年間におけるその製造見込数量の合計が六キロリットル以上であるとき。」
- Statutory literal 6 = 六（六キロリットル）— confirmed in the needle; independent spec_literals = {6}.
- 境界カテゴリ (>=3): zero (0), small_input (1/5/6/7), threshold_below (5), threshold_at (6), threshold_above (7) — all kernel-decided examples.
- Volume threshold, unit キロリットル (kL); 以上 = INCLUSIVE >=. Distinct from money/count/duration thresholds.
- 独立仕様: specFloor / specMeets defined without implementation identifiers; bridges are `unfold ... ; rfl` only.
- 判定 (H/T/D/C/U): H（六キロリットルという法定しきい値）, T（6, INCLUSIVE >=; bytes pinned by SHA-256）, D（by decide / rfl）, C（needle verbatim, boundary categories complete）, U（他項・他条・施行手続は非介入）。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
