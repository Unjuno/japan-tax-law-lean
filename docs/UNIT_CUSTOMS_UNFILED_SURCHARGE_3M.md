# Normative unit: 関税法 art. 12の3 (加算後累積納付税額 三百万円超)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|3958fc3a40a3b23cc18914fd4b63859239081258599ec53e4a8e09d5911c2384`
- law/revision: `329AC0000000061` / `329AC0000000061_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/ParagraphSentence/Sentence#1`
- verbatim unit: 「加算後累積納付税額 … が三百万円を超えるとき」 (EXCEPTION, strict threshold)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「三百万」 means ¥3,000,000 and 「超える」 is strict/exclusive
  (`> 3,000,000`), not inclusive (≥) and not ¥300,000 or ¥30,000,000.
- **T**: direct recursive walk of the pinned JSON `Sentence` nodes; the
  verbatim clause 「…三百万円を超えるとき」 occurs exactly in `Article:12_3`
  paragraph 3, and 「三百万円を超える部分」 occurs in a subordinate item.
  Independent kanji→Arabic conversion 三百万 → 3000000.
- **D**: D1 PASS (spec `specThreshold = 3000000` and impl
  `cumulativePaidThreshold = 3_000_000` match the re-extracted 原文 value);
  D2 PASS boundary examples 2,999,999 false / 3,000,000 false / 3,000,001
  true, all kernel-decided.
- **C**: C1 「超える」 is exclusive; an inclusive reading would move the
  3,000,000 boundary. The verbatim 「超える」 was used, not a summary.
- **U**: U1 the tiered rates, the 期限後特例申告 5% reduction, the 政令
  calculation of the deductible amount, and other paragraphs are outside
  this unit and remain NOT MODELLED. Human legal review is pending
  (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. This is a mechanical independent re-extraction,
not human legal review.
