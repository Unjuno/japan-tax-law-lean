# Normative unit: 印紙税法 art. 4 (十万円を超える金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|b0df6aef4d7d37f887aa42d8a9df6abad324059fdaed2fd3636a8ef9bbe69af6`
- law/revision: `342AC0000000023` / `342AC0000000023_20261001_507AC0000000070`
- enforcement: 2026-10-01
- source path: `LawBody[3]/MainProvision/MainProvision[0]/Article:4/Article#4/Paragraph#4/Item#1/ItemSentence/Column#2/Sentence#1`
- verbatim unit: 「十万円を超える金額」 (CONDITION, strict threshold)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (991 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「十万」 = ¥100,000 and 「超える」 is strict/exclusive (`> 100,000`),
  not inclusive and not ¥10,000 or ¥1,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「十万円を超える金額」 occurs exactly once in `Article:4`; independent
  kanji→Arabic conversion 十万 → 100000.
- **D**: D1 PASS (impl `threshold = 100_000` and independent spec
  `specThreshold = 100000` match the re-extracted 原文 value); D2 PASS
  boundaries 99,999 false / 100,000 false / 100,001 true, all kernel-decided.
- **C**: C1 「超える」 is exclusive; an inclusive reading would move the
  100,000 boundary. The verbatim 「超える」 was used, not a summary.
- **U**: U1 the tax rates, document categories, calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
