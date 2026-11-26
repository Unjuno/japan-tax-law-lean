# Normative unit: 関税法 art. 12の3(3)第三号 (三百万円を超える部分に相当する税額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|525106c63e66613142dbca1d783fc345ef26693d9e2cad75d59d1879c3e23df2`
- law/revision: `329AC0000000061` / `329AC0000000061_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/Item#3/ItemSentence/Column#1/Sentence#1`
- verbatim unit: 「三百万円を超える部分に相当する税額」 (CONDITION, strict threshold)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (2934 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「三百万」 = ¥3,000,000 and 「超える」 is strict/exclusive
  (`> 3,000,000`), not inclusive and not ¥300,000 or ¥30,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「三百万円を超える部分に相当する税額」 occurs exactly once in `Article:12_3`
  第3項第三号; independent kanji→Arabic conversion 三百万 → 3000000.
  Note: `clause_correspondence` passes with {3000000} alone and correctly
  REJECTS the {5,100,3000000} set (the 百分の五 rate belongs to a different
  item of the same article, not this clause) — clause scoping verified.
- **D**: D1 PASS (impl `excessThreshold = 3_000_000` and spec
  `specThreshold = 3000000` match); D2 PASS boundaries 2,999,999 false /
  3,000,000 false / 3,000,001 true, all kernel-decided.
- **C**: C1 「超える」 is exclusive; an inclusive reading would move the
  3,000,000 boundary. The verbatim 「超える」 was used, not a summary.
- **U**: U1 the bracket's rate, the other brackets, the aggregation and the 政令
  calculation are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
