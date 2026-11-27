# Normative unit: 沖縄の復帰政令 art.19 (五百万円以上八百万円未満の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|45d460c0948fd3d0bf385abdf4f6beba73ced2d26d84738a6d9305084e2c9456`
- law/revision: `347CO0000000151` / `347CO0000000151_20251231_507CO0000000426`
- enforcement: 2025-12-31
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「五百万円以上八百万円未満の金額」 (CONDITION, bounded interval)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (945 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「五百万」 = ¥5,000,000 (inclusive lower); 「八百万」 = ¥8,000,000
  (exclusive upper): `5,000,000 ≤ amount < 8,000,000`.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「五百万円以上八百万円未満の金額」 occurs exactly once in `Article:19`;
  independent kanji→Arabic conversion 五百万 → 5000000, 八百万 → 8000000.
- **D**: D1 PASS (impl and spec bounds match the 原文 values); D2 PASS
  boundaries 4,999,999 false / 5,000,000 true / 7,999,999 true /
  8,000,000 false, all kernel-decided.
- **C**: C1 「以上」 inclusive and 「未満」 exclusive; alternative readings
  would move the interval boundaries. The verbatim forms were used.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
