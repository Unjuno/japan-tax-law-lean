# Adversarial review — batch 197

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for RefundDifferenceAmount.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### RefundDifferenceAmount.lean — 所得税額の還付 第六条（前号控除後の残額）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令 (law id 347M50000040042), revision 347M50000040042_20251231_507M60000040072
- Source: data/raw/347M50000040042_20251231_507M60000040072.law.json
- SHA-256: a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667 (SHA-256 照合 OK)
- Article Num: 6 (第六条). 独立再抽出で scoped Article 6 に needle 1 箇所一致を照合。
- Needle verbatim in scoped Article 6:
  「第三号に掲げる所得税の額から前号に掲げる所得税の額を控除した残額のうち還付を受けようとする金額」
- Statutory literal 3 = 三（第三号）— spec_literals = {3}, source_literals_verified True (parse_statutory_rate None).
- SATURATING subtraction: refundResidual = item3Amount - prevAmount on Nat;
  when prevAmount > item3Amount the residual is 0, since a refund cannot be negative.
- 境界カテゴリ (6): zero (0), small_input (1,2,3), saturation (0),
  threshold_below (2), threshold_at (3), threshold_above (4) — all kernel-decided examples.
- 独立仕様: specItem3 / specResidual defined without implementation identifiers;
  bridges are pure `unfold ... ; rfl` only (agreeItem3, agreeResidual).
- 判定 (H/T/D/C/U): H（第六条の前号控除後の残額＝還付額）, T（3, 三, bytes pinned by SHA-256）, D（rfl / by decide のみ）, C（needle verbatim, boundary categories complete, spec independence confirmed）, U（各号の定義、還付手続、他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
