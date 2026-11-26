# Normative unit: 沖縄の復帰政令 art.19 (百万円以上二百万円未満の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|c37518f6277d17ffd19b6277d2b49745f85c9f1a6127062026c7a1025d6160a4`
- law/revision: `347CO0000000151` / `347CO0000000151_20251231_507CO0000000426`
- enforcement: 2025-12-31
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「百万円以上二百万円未満の金額」 (CONDITION, bounded interval)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (945 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「百万」 = ¥1,000,000 (inclusive lower); 「二百万」 = ¥2,000,000
  (exclusive upper): `1,000,000 ≤ amount < 2,000,000`.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「百万円以上二百万円未満の金額」 occurs exactly once in `Article:19`;
  independent kanji→Arabic conversion 百万 → 1000000, 二百万 → 2000000.
- **D**: D1 PASS (impl and spec bounds match the 原文 values); D2 PASS
  boundaries 999,999 false / 1,000,000 true / 1,999,999 true / 2,000,000 false,
  all kernel-decided.
- **C**: C1 「以上」 inclusive and 「未満」 exclusive; alternative readings
  would move the interval boundaries. The verbatim forms were used.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
