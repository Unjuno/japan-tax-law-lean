# Normative unit: 租税特別措置法 art. 70の2の5 (二百万円以下の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|d3a66f4c2318bf25b70e76bc4dfefa974b74bd9b34ecc9e1aabcad77d8a78ca8`
- law/revision: `332AC0000000026` / `332AC0000000026_20261101_507AC0000000013`
- enforcement: 2026-11-01
- source path: `LawBody[3]/MainProvision/MainProvision[3]/Article:70_2_5/Article#70_2_5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「二百万円以下の金額」 (CONDITION, inclusive bracket cap)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (1401 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「二百万」 = ¥2,000,000 and 「以下」 is inclusive (`≤ 2,000,000`),
  not exclusive and not ¥200,000 or ¥20,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「二百万円以下の金額」 occurs exactly once in `Article:70_2_5`; independent
  kanji→Arabic conversion 二百万 → 2000000.
- **D**: D1 PASS (impl `bracketCap = 2_000_000` and independent spec
  `specCap = 2000000` match the 原文 value); D2 PASS boundaries 1,999,999 true /
  2,000,000 true / 2,000,001 false, all kernel-decided.
- **C**: C1 「以下」 is inclusive; an exclusive reading would move the
  2,000,000 boundary. The verbatim 「以下」 was used, not a summary.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
