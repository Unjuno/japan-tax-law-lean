# Adversarial review — batch 149

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for CombinableRecordItemsTwo.lean and its independent Spec/Tests
modules. Every claim below is reproducible from committed bytes.

### CombinableRecordItemsTwo.lean — 記録事項等 第五条（二以上の記録項目の組合せ）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 電子帳簿保存法施行規則 (electronic books preservation; law id 410M50000040043),
  revision 410M50000040043_20250401_507M60000040028
- Source: data/raw/410M50000040043_20250401_507M60000040028.law.json
- SHA-256: 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44 (SHA-256 照合 OK)
- Article Num: 5 (第五条). 独立再抽出で scoped Article 5 に needle 1 箇所一致、
  文献全体でも 1 箇所一致を照合。
- Needle verbatim in scoped Article 5:
  「二以上の任意の記録項目を組み合わせて条件を設定することができること。」
- Statutory literal 2 = 二（二以上の任意の記録項目）— confirmed in the needle;
  independent spec_literals = {2}. parse_statutory_rate(scoped) = None, so
  source_literals_verified({2}, scoped) = True.
- 二以上 = n >= 2 INCLUSIVE: a COUNT FLOOR (二 = 2, 以上 = >=), not a cap;
  distinct norm from the joint-heir rule, despite the shared direction.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (1),
  threshold_at (2), threshold_above (3) — all kernel-decided examples; 10 also.
- 独立仕様: specMin / specCombine defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeMin, agreeCombine).
- 判定 (H/T/D/C/U): H（二という法定項目数）, T（2, INCLUSIVE >=; bytes pinned by SHA-256）,
  D（by decide / rfl）, C（needle verbatim, boundary categories complete）,
  U（記録項目の種別・組合わせの意味・設定される条件・他項他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
