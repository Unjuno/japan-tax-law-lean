# Adversarial review — batch 155

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for BondRevenueFiscalYear.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### BondRevenueFiscalYear.lean — 公債収入 第二条（昭和51年度所属の歳入）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: law id 352AC0000000035, revision 352AC0000000035_19770504_000000000000000
- Source: data/raw/352AC0000000035_19770504_000000000000000.law.json
- SHA-256: 038efcee43b35b2d7fa50fd4831ae81da57d7b485250661e04faba452a1fbe41 (SHA-256 照合 OK)
- Article Num: 2 (第二条). Scoped Article 2 に needle 1 箇所一致を照合。
- Needle verbatim in scoped Article 2:
  「この場合において、当該公債に係る収入は、昭和五十一年度所属の歳入とする。」
- Statutory literal 51 = 五十一（昭和五十一年度）— confirmed in the needle;
  independent spec_literals = {51}, source_literals_verified True,
  parse_statutory_rate is None (no 百分の rate in this clause).
- 所属の歳入 = EXACT single-year attribution (fy == 51), NOT a range;
  distinct from MergerGrantFiscalWindow [47,52] by design.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (50),
  threshold_at (51), threshold_above (52) — all kernel-decided examples.
- 独立仕様: specFY / specBelongs defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeFY, agreeBelongs).
- 判定 (H/T/D/C/U): H（公債収入の昭和51年度所属の歳入という明示的 temporal 帰属）, T（51, EXACT fy == 51; bytes pinned by SHA-256）, D（rfl / by decide のみ）, C（needle verbatim, boundary categories complete, spec independence confirmed）, U（公債の発行、収入額、適用期間 Range、他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
