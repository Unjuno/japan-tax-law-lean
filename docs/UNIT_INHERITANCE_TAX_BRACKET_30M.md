# Normative unit: 相続税法 art. 21の7 (三千万円を超える金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|7e19c12b92a5778bd5316fcf9548271de5a3256091b2addd3f1ec59619e759df`
- law/revision: `325AC0000000073` / `325AC0000000073_20260401_506AC0000000008`
- enforcement: 2026-04-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「三千万円を超える金額」 (CONDITION, strict threshold)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (253 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「三千万」 = ¥30,000,000 and 「超える」 is strict/exclusive
  (`> 30,000,000`), not inclusive and not ¥3,000,000 or ¥300,000,000.
- **T**: direct recursive walk of the pinned JSON `Sentence` node; the verbatim
  「三千万円を超える金額」 occurs exactly once in `Article:21_7`; independent
  kanji→Arabic conversion 三千万 → 30000000. Needle count in raw = 1.
- **D**: D1 PASS (impl `bracketThreshold = 30_000_000` and independent spec
  `specThreshold = 30000000` match the re-extracted 原文 value); D2 PASS
  boundaries 29,999,999 false / 30,000,000 false / 30,000,001 true, all
  kernel-decided.
- **C**: C1 「超える」 is exclusive; an inclusive reading would move the
  30,000,000 boundary. The verbatim 「超える」 was used, not a summary.
- **U**: U1 the bracket's rate, the remaining brackets/deductions, and other
  articles are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
