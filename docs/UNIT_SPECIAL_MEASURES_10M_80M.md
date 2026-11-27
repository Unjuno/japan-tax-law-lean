# Normative unit: 租税特別措置法 art.5 附則 (千万円以上八千万円未満の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|62f5cc4bbcea65fa1da837bb0ec429829f05651a40f4dcc9f285ce8d904c238a`
- law/revision: `332AC0000000026` / `332AC0000000026_20261101_507AC0000000013`
- enforcement: 2026-11-01
- source path: `LawBody[79]/SupplProvision/SupplProvision[5]/Article:5/Article#5/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「千万円以上八千万円未満の金額」 (CONDITION, bounded interval)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (443 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「千万」 = ¥10,000,000 (inclusive lower); 「八千万」 = ¥80,000,000
  (exclusive upper): `10,000,000 ≤ amount < 80,000,000`.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「千万円以上八千万円未満の金額」 occurs exactly once in `Article:5`;
  independent kanji→Arabic conversion 千万 → 10000000, 八千万 → 80000000.
- **D**: D1 PASS (impl and spec bounds match the 原文 values); D2 PASS
  boundaries 9,999,999 false / 10,000,000 true / 79,999,999 true /
  80,000,000 false, all kernel-decided.
- **C**: C1 「以上」 inclusive and 「未満」 exclusive; alternative readings
  would move the interval boundaries. The verbatim forms were used.
- **U**: U1 the bracket's rate, other brackets, the base calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.