# Normative unit: 関税法 art. 12の3 (加算後累積納付税額 三百万円超 / 百分の五)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|3958fc3a40a3b23cc18914fd4b63859239081258599ec53e4a8e09d5911c2384`
- law/revision: `329AC0000000061` / `329AC0000000061_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:12_3/Article#12_3/Paragraph#3/ParagraphSentence/Sentence#1`
- verbatim unit: 「加算後累積納付税額 … が三百万円を超えるときは … その割合から百分の五を減じた割合 …」 (EXCEPTION)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (2934 chars)

## Computable slice

Two components of this single Sentence are modelled: (1) the ¥3,000,000
cumulative-paid-amount threshold with strict 超える (exclusive) comparison;
(2) the verbatim 「百分の五」 rate ratio (5/100 = 1/20) from the
non-foreknown-filing clause. Both are kernel-checked against an independent
spec whose numerals are read separately from the 原文.

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「三百万」 = ¥3,000,000 with 超える strict (`> 3,000,000`);
  H2 「百分の五」 = 5/100 = 1/20.
- **T**: recursive walk of pinned JSON `Sentence` nodes; both verbatim needles
  occur in `Article:12_3` paragraph 3; independent kanji→Arabic conversion
  三百万 → 3,000,000 and 五/百 → 5/100.
- **D**: D1 PASS (impl and independent spec literals agree with 原文);
  D2 PASS boundaries 2,999,999 false / 3,000,000 false / 3,000,001 true;
  D3 PASS rate ratio 5×20 = 100, all kernel-decided.
- **C**: C1 「超える」 exclusive (an inclusive reading moves the boundary).
  C2 first attempt modelled only ¥3M; evidence `clause_correspondence`
  correctly rejected it because 百分の五 is also verbatim in the clause —
  the slice was expanded to model that genuine rate, NOT to game a gate.
- **U**: U1 tiered brackets, the multiplication/aggregation, the 政令
  calculation of the deductible amount, and other paragraphs are outside
  this unit and remain NOT MODELLED. Human legal review is pending
  (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 2 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
