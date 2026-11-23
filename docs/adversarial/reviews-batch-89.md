# Adversarial review — batch 89

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for JointHeirThreshold2.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### JointHeirThreshold2.lean — 相続税法施行規則 第十一条（相続人二人以上の連署申告）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 相続税法施行規則 (law id 360CO0000000005), revision 360CO0000000005_20250401_507CO0000000006
- Source: data/raw/360CO0000000005_20250401_507CO0000000006.law.json
- SHA-256: 228e54ca458c5192fbb3c1b3a6063d09f3fd66f8c5a6d3958d5389a0d6b38eb1 (SHA-256 照合 OK)
- Article Num: 11 (第十一条). 独立再抽出で 1 structural hit、全文 1 箇所一致を照合。
- Needle verbatim in scoped Article 11:
  「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」
- Statutory literal 2 = 二（相続人が二人以上）— confirmed in the needle;
  independent spec_literals = {2}.
- 二人以上 = n >= 2 INCLUSIVE: a COUNT TRIGGER (二人 = 2, 以上 = >=), not a cap.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (1),
  threshold_at (2), threshold_above (3) — all kernel-decided examples; 10 also.
- 独立仕様: specFloor / specJoint defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeFloor, agreeJoint).
- 判定 (H/T/D/C/U): H（二人という法定人数）, T（2, INCLUSIVE >=; bytes pinned by SHA-256）, D（by decide / rfl）, C（needle verbatim, boundary categories complete）, U（他条・申告書の様式・連署の手続等は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
