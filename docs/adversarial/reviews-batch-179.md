# Adversarial review — batch 179

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for HeiseiFY6Attribution.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### HeiseiFY6Attribution.lean — 公債収入 第二条（平成6年度所属の歳入）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: law id 406AC0000000108, revision 406AC0000000108_20070401_419AC0000000023
- Source: data/raw/406AC0000000108_20070401_419AC0000000023.law.json
- SHA-256: dd0bf0ec751b7d5712636c239b74368c514ae7818b4c77c52adcb1fff1f9935b (SHA-256 照合 OK)
- Article Num: 2 (第二条). Scoped Article 2 に needle 1 箇所一致を照合。
- Needle verbatim in scoped Article 2:
  「この場合において、同年四月一日以後発行される同項の公債に係る収入は、平成六年度所属の歳入とする。」
- Statutory literal 6 = 六（平成六年度）— confirmed in the needle;
  independent spec_literals = {6}, source_literals_verified True,
  parse_statutory_rate is None (no 百分の rate in this clause).
- 所属の歳入 = EXACT single-year attribution (fy == 6), NOT a range;
  bond issuance details / revenue amounts are out of scope by design.
- 境界カテゴリ (>=3): zero (0), small_input (5), threshold_below (5),
  threshold_at (6), threshold_above (7) — all kernel-decided examples.
- 独立仕様: specFY / specBelongs defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeFY, agreeBelongs).
- 判定 (H/T/D/C/U): H（公債収入の平成6年度所属の歳入という明示的 temporal 帰属）, T（6, EXACT fy == 6; bytes pinned by SHA-256）, D（rfl / by decide のみ）, C（needle verbatim, boundary categories complete, spec independence confirmed）, U（公債の発行詳細、収入額、他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
