# Adversarial review — batch 78

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for CouncilMemberCap30.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### CouncilMemberCap30.lean — 税制調査会組織規則 第一条（委員三十人以内）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 税制調査会組織規則 (law id 425CO0000000025), revision 425CO0000000025_20221202_504CO0000000367
- Source: data/raw/425CO0000000025_20221202_504CO0000000367.law.json
- SHA-256: 8c164ab067608887627e8a5aecbe9784331597dbf0def96e76d0058ffe7b13d5
- Article Num: 1. 独立再抽出で照合 OK。
- Needle verbatim in scoped Article 1:
  「税制調査会（以下「調査会」という。）は、委員三十人以内で組織する。」
- Statutory literal 30 = 三十（委員三十人以内）— confirmed in the needle;
  independent spec_literals = {30}.
- 三十人以内 = n <= 30 INCLUSIVE: a COUNT CAP (maximum), not a >= floor.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (29),
  threshold_at (30), threshold_above (31) — all kernel-decided examples.
- 独立仕様: specCap / specWithin defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeCap, agreeWithin).
- 判定 (H/T/D/C/U): H（三十人という法定上限）, T（30, INCLUSIVE <=; bytes pinned by SHA-256）, D（by decide / rfl）, C（needle verbatim, boundary categories complete）, U（他条・委員の任命等は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
