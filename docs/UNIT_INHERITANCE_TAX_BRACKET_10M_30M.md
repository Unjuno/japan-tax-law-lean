# Normative unit: 相続税法 art. 16 (千万円を超え三千万円以下の金額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470`
- law/revision: `325AC0000000073` / `325AC0000000073_20260401_506AC0000000008`
- enforcement: 2026-04-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`
- verbatim unit: 「千万円を超え三千万円以下の金額」 (CONDITION, bounded interval)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (437 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「千万」 = ¥10,000,000 and 「三千万」 = ¥30,000,000; H2 「超え」 is
  strict/exclusive on the lower bound and 「以下」 inclusive on the upper.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「千万円を超え三千万円以下の金額」 occurs exactly once in `Article:16`;
  independent kanji→Arabic conversion 千万 → 10,000,000, 三千万 → 30,000,000.
- **D**: D1 PASS (impl and independent spec literals match the 原文);
  D2 PASS boundaries 10,000,000 false / 10,000,001 true / 30,000,000 true /
  30,000,001 false, all kernel-decided.
- **C**: C1 a strict upper bound or inclusive lower bound would move the
  bracket edges; the verbatim 超える/以下 was used, not a summary.
- **U**: U1 the bracket's rate, other brackets/deductions, and other articles
  are outside this unit and remain NOT MODELLED. Human legal review is pending
  (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
