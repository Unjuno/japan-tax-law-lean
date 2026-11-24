# Normative unit: 租税特別措置法施行令 art. 27の12の4 (¥400,000 threshold)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|3fde07139ef06bec48bde1f0d442767dd0da29eb07563b6c3705d90c73c8e84e`
- law/revision: `332CO0000000043` / `332CO0000000043_20261101_507CO0000000127`
- enforcement: 2026-11-01; snapshot SHA-256 `d0ad21a8…`
- source path: `LawBody[3]/MainProvision/MainProvision[2]/Article:27_12_4/…/Column#2/Sentence#1`
- verbatim unit: 「一台又は一基の取得価額が四十万円以上のもの」 (CONDITION, 21 chars)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 「四十万円」 means ¥400,000 inclusive (≥), not ¥40,000 or exclusive (>).
- **T**: direct recursive walk of the pinned JSON `Article` whose canonical
  number is `27_12_4`; the verbatim 21-char clause occurs exactly there;
  independent kanji→Arabic conversion 四十万 → 400000.
- **D**: D1 PASS (spec `specFloor = 400000` and impl `acquisitionCostFloor = 400_000`
  both match the re-extracted 原文 value); boundary examples 399999 false /
  400000 true / 400001 true, all kernel-decided.
- **C**: C1 「以上」 is inclusive; a strict reading would shift the 400,000
  boundary. The verbatim 「以上」 was used, not a coordinator summary.
- **U**: U1 the surrounding category definition and the special-measure
  calculation are outside this unit and remain NOT MODELLED. Human legal
  review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. This is a mechanical independent re-extraction,
not human legal review.
