# Normative unit: 租税特別措置法 art.5 (四十万円以上九十五万円未満の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|bd58b479eddb67ddb3abddf1f6fbd458eb04c32139598f2f9558370d208dfcda`
- law/revision: `332AC0000000026` / `332AC0000000026_20261101_507AC0000000013`
- enforcement: 2026-11-01
- source path: `LawBody[79]/SupplProvision/SupplProvision[5]/Article:5/Article#5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「四十万円以上九十五万円未満の金額」 (CONDITION, bounded interval)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (443 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「四十万」 = ¥400,000 (inclusive lower); 「九十五万」 = ¥950,000
  (exclusive upper): `400,000 ≤ amount < 950,000`.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「四十万円以上九十五万円未満の金額」 occurs exactly once in `Article:5`
  附則; independent kanji→Arabic conversion 四十万 → 400000, 九十五万 → 950000.
- **D**: D1 PASS (impl and spec bounds match the 原文 values); D2 PASS
  boundaries 399,999 false / 400,000 true / 949,999 true / 950,000 false,
  all kernel-decided.
- **C**: C1 「以上」 inclusive and 「未満」 exclusive; alternative readings
  would move the interval boundaries. The verbatim forms were used.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
