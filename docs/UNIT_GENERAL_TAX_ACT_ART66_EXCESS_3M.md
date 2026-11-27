# Normative unit: 国税通則法 art.66(3)(3) (三百万円を超える部分に相当する税額)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|245fbea3a32526db3e7a4a4c2a1bc7a366f7f8e94fce22b0d9e53dbd579d1173`
- law/revision: `337AC0000000066` / `337AC0000000066_20261101_507AC0000000013`
- enforcement: 2026-11-01
- source path: `LawBody[2]/MainProvision/MainProvision[5]/Article:66/Article#66/Paragraph#3/Item#3/ItemSentence/Column#1/Sentence#1`
- verbatim unit: 「三百万円を超える部分に相当する税額」 (CONDITION, strict excess portion)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (3500 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「三百万」 = ¥3,000,000; 「を超える部分」 is a strict excess:
  `excess = 0` for `amount <= 3,000,000`, otherwise `amount - 3,000,000`.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  「三百万円を超える部分に相当する税額」 occurs exactly once in `Article:66`;
  independent kanji→Arabic conversion 三百万 → 3000000.
- **D**: D1 PASS (impl `threshold = 3_000_000` and spec `specThreshold = 3000000`
  match the 原文 value); D2 PASS at 2,999,999 → 0 / 3,000,000 → 0 /
  3,000,001 → 1 / 5,000,000 → 2,000,000, all kernel-decided.
- **C**: C1 「を超える」 is strict; an inclusive reading would make the excess at
  3,000,000 equal 1 instead of 0. The verbatim 「超える」 was used.
- **U**: U1 conversion of the excess portion into the final 税額 (rate), other
  items, the cap and other paragraphs are outside this unit and remain
  NOT MODELLED. Human legal review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
