# Adversarial review — batch 209

Mechanical (not human) independent re-extraction and cross-check of the pinned
source artifact for a new gift-tax rate-bracket unit. Every claim below is
reproducible from committed bytes. No human legal approval is recorded here.

### InheritanceGiftTaxRateBracket15M30M.lean — 相続税法 第二十一条の七(1)（千五百万円超三千万円以下）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 相続税法 (law id 325AC0000000073), revision 325AC0000000073_20260401_506AC0000000008
- Source: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
- SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7 (SHA-256 照合 OK)
- Article Num: 21_7 (第二十一条の七), Paragraph 1, table upper-column cell.
  Independent re-extraction located the verbatim needle exactly once in the
  scoped article:
  「千五百万円を超え三千万円以下の金額」
- Normative unit: NORM|68cc7a516287f33351d259921d3e7dde2e314a75cde606a098b736c6e4319ab5
- Statutory literals: 15,000,000 = 千五百万, 30,000,000 = 三千万. Both kanji
  spellings occur verbatim in the scoped clause. 「を超え」 = strict lower
  bound (excluded); 「以下」 = inclusive upper bound.
- Independent spec: `specInBracket` uses `Nat.succ 15_000_000 ≤ amount ∧
  amount ≤ 30_000_000`, reusing no implementation identifier. The equivalence
  bridge `agree_in_bracket` is a universal, axiom-free kernel theorem.
- 境界カテゴリ: zero, below (14,999,999), threshold_at (15,000,000, excluded),
  threshold_above (15,000,001), interior (20,000,000), upper_inclusive
  (30,000,000), upper_excluded (30,000,001). All kernel-decided.
- 判定 (H/T/D/C/U):
  - H（贈与税税率表の「千五百万円を超え三千万円以下の金額」区間）
  - T（15,000,000 / 30,000,000、千五百万 / 三千万、bytes pinned by SHA-256）
  - D（`rfl` / `by decide` / 普遍的な `agree_in_bracket` のみ）
  - C（needle verbatim、境界カテゴリ完整、spec 独立性確認）
  - U（対応税率、他の区分、控除規定、他条・他項は非介入）
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない
  (mechanical, not human). Human legal review remains a separate pending axis.
