# Normative unit: 関税法 art. 12の3(3) (五十万円以下の部分に相当する税額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|1cf9da8c896be64495a6c3922e7f36b091614299e36a165462b003eb1e008dbe`
- law/revision: `329AC0000000061` / `329AC0000000061_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1`
- verbatim unit: 「五十万円以下の部分に相当する税額」 (CONDITION, inclusive bracket cap)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (2934 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「五十万」 = ¥500,000 and 「以下」 is inclusive (`≤ 500,000`),
  not exclusive and not ¥50,000 or ¥5,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「五十万円以下の部分に相当する税額」 occurs exactly once in `Article:12_3`
  第3項第一号; independent kanji→Arabic conversion 五十万 → 500000.
- **D**: D1 PASS (impl `bracketCap = 500_000` and independent spec
  `specCap = 500000` match the 原文 value); D2 PASS boundaries 499,999 true /
  500,000 true / 500,001 false, all kernel-decided.
- **C**: C1 「以下」 is inclusive; an exclusive reading would move the
  500,000 boundary. The verbatim 「以下」 was used, not a summary.
- **U**: U1 the bracket's rate, other brackets, the aggregation and the 政令
  calculation are outside this unit and remain NOT MODELLED. Human legal
  review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
