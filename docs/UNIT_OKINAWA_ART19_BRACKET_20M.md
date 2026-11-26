# Normative unit: 沖縄の復帰政令 art.19 (二千万円以上の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|39f4f8364a3b42270ace8b5c071bc2a3b23b6a55b15fddd5f8fcdc00cb84079b`
- law/revision: `347CO0000000151` / `347CO0000000151_20251231_507CO0000000426`
- enforcement: 2025-12-31
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「二千万円以上の金額」 (CONDITION, inclusive bracket floor)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (945 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「二千万」 = ¥20,000,000 and 「以上」 is inclusive (`≥ 20,000,000`),
  not exclusive and not ¥2,000,000 or ¥200,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「二千万円以上の金額」 occurs exactly once in `Article:19`; independent
  kanji→Arabic conversion 二千万 → 20000000.
- **D**: D1 PASS (impl `bracketFloor = 20_000_000` and independent spec
  `specFloor = 20000000` match the 原文 value); D2 PASS boundaries 19,999,999
  false / 20,000,000 true / 20,000,001 true, all kernel-decided.
- **C**: C1 「以上」 is inclusive; an exclusive reading would move the
  20,000,000 boundary. The verbatim 「以上」 was used, not a summary.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
