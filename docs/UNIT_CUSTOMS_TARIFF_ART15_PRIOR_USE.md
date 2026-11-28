# Normative unit: 関税定率法 art.15(1)(9) (入国前一年以上の使用例外的限定)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|dc53fcddca38961e0306ab237c7d7cea636e1ba936284d7fc2a52df7b57d38b4`
- law/revision: `143AC0000000054` / `143AC0000000054_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#9/ItemSentence/Sentence#2`
- verbatim unit: 「ただし、その入国前にこれらの者が既に使用したもの（船舶及び航空機については、その入国前一年以上これらの者が使用したもの）に限る。」 (EXCEPTION)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (1419 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 general goods qualify only if already used before entry; ships and
  aircraft require prior use of at least one year (`>= 12 months`).
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  sentence occurs exactly once in `Article:15`; independent extraction of
  「一年」 → 1 year (12 months); `clause_correspondence` accepts `{1}`.
- **D**: D1 PASS (impl `oneYearMonths = 12` and spec `specOneYear = 1` year agree
  under `months = years * 12`); D2 PASS at general 0/1 months and vessel
  11/12/24 months, all kernel-decided.
- **C**: C1 「一年以上」 is inclusive (>= 12 months); an exclusive reading would
  move the 12-month boundary. The verbatim 「以上」 was used.
- **U**: U1 the exemption's main rule, the identity of 「これらの者」, other items
  and other paragraphs are outside this unit and remain NOT MODELLED. Human
  legal review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
