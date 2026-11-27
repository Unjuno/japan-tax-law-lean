# Normative unit: 法人税法施行令 art.139の4 (二十万円未満である場合)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|d6935531b7cf6d81e6480be40135c346fbb83326ac4874d43acfb9eef55616e2`
- law/revision: `340CO0000000097` / `340CO0000000097_20261001_507CO0000000121`
- enforcement: 2026-10-01
- source path: `LawBody[3]/MainProvision/MainProvision[1]/Article:139_4/Article#139_4/Paragraph#2/Item#3/ItemSentence/Sentence#1`
- verbatim unit: 「二十万円未満である場合」 (CONDITION, strict upper bound)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (4326 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「二十万」 = ¥200,000 and 「未満」 is strict/exclusive (`< 200,000`),
  not inclusive and not ¥20,000 or ¥2,000,000.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「二十万円未満である場合」 occurs exactly once in `Article:139_4`;
  independent kanji→Arabic conversion 二十万 → 200000.
- **D**: D1 PASS (impl `amountCap = 200_000` and spec `specCap = 200000` match
  the 原文 value); D2 PASS boundaries 199,999 true / 200,000 false /
  200,001 false, all kernel-decided.
- **C**: C1 「未満」 is exclusive; an inclusive reading would move the
  200,000 boundary. The verbatim 「未満」 was used, not a summary.
- **U**: U1 the tax calculation, the other items, the categories and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
