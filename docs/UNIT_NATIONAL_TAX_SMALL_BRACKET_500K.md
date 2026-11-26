# Normative unit: 国税通則法 art.66(3) (五十万円以下の部分に相当する税額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|1536f5c05d4f7fcf695531b882ef8f87188b0985d3a6dafd42dd1b1187cee81f`
- law/revision: `337AC0000000066` / `337AC0000000066_20261101_507AC0000000013`
- enforcement: 2026-11-01
- source path: `LawBody[2]/MainProvision/MainProvision[5]/Article:66/Article#66/Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1`
- verbatim unit: 「五十万円以下の部分に相当する税額」 (CONDITION, inclusive bracket cap)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (3500 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「五十万」 = ¥500,000 and 「以下」 is inclusive (`≤ 500,000`),
  not exclusive and not ¥50,000 or ¥5,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「五十万円以下の部分に相当する税額」 occurs exactly once in `Article:66`
  第3項第一号; independent kanji→Arabic conversion 五十万 → 500000.
  Note: other items of art.66 contain 「百分の五」 (rate 3/20 in scope), but
  `clause_correspondence` accepts {500000} on THIS clause and rejects the
  {5,100,500000} set — clause scoping verified, no over-credit.
- **D**: D1 PASS (impl `bracketCap = 500_000` and spec `specCap = 500000`
  match the 原文 value); D2 PASS boundaries 499,999 true / 500,000 true /
  500,001 false, all kernel-decided.
- **C**: C1 「以下」 is inclusive; an exclusive reading would move the
  500,000 boundary. The verbatim 「以下」 was used, not a summary.
- **U**: U1 the bracket's rate, the other brackets, the aggregation and the 政令
  calculation are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
