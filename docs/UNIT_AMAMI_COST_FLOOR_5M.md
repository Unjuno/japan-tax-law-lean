# Normative unit: 奄美群島振興開発特別措置法施行令 art.1 (五百万円以上のもの)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|c84b2fde84cc466644104334326676ef74bb96231b546dde613f27cbcb104950`
- law/revision: `411M50000008014` / `411M50000008014_20240401_506M60000008035`
- enforcement: 2024-04-01
- source path: `LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/Item#1/Subitem1#1/Subitem2#2/Subitem2Sentence/Column#2/Sentence#1`
- verbatim unit: 「五百万円以上のもの」 (CONDITION, inclusive acquisition-cost floor)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (1549 chars)
- note: law name does not contain 「税」; related statute reached via the 不均一課税
  relation (sub-goal §2), acquired under source-layer L0.

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「五百万」 = ¥5,000,000 and 「以上」 is inclusive (`≥ 5,000,000`),
  not exclusive and not ¥500,000 or ¥50,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「五百万円以上のもの」 occurs exactly once in `Article:1`; independent
  kanji→Arabic conversion 五百万 → 5000000.
- **D**: D1 PASS (impl `costFloor = 5_000_000` and spec `specFloor = 5000000`
  match the 原文 value); D2 PASS boundaries 4,999,999 false / 5,000,000 true /
  5,000,001 true, all kernel-decided.
- **C**: C1 「以上」 is inclusive; an exclusive reading would move the
  5,000,000 boundary. The verbatim 「以上」 was used, not a summary.
- **U**: U1 the non-uniform tax rate, the categories, the calculation and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
