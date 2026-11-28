# Normative unit: 相続税法 art.1の3 (相続開始前十年以内の住所)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|46158208ca535db7caaf710f6aaccd29da4847ec77e12c037869077566d13fdf`
- law/revision: `325AC0000000073` / `325AC0000000073_20260401_506AC0000000008`
- enforcement: 2026-04-01
- source path: `LawBody[3]/MainProvision/MainProvision[0]/Article:1_3/Article#1_3/Paragraph#1/Item#2/Subitem1#1/Subitem2#1/Subitem2Sentence/Sentence#1`
- verbatim unit: 「当該相続又は遺贈に係る相続の開始前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもの」 (REFERENCE)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (2201 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 the residence window is ten years before the inheritance/gift start,
  inclusive at year 10.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  sentence occurs exactly once in `Article:1の3`; independent extraction of
  「十」 → 10; `clause_correspondence` accepts `{10}`.
- **D**: D1 PASS (impl `windowYears = 10` and spec `specWindow = 10`); D2 PASS
  at 0/9/10/11/20 years, all kernel-decided.
- **C**: C1 「十年以内」 is inclusive at year 10; an exclusive reading would
  move the boundary to 11. The verbatim 「以内」 was used.
- **U**: U1 the identity of the person, other subitems, the tax consequences and
  other paragraphs are outside this unit and remain NOT MODELLED. Human legal
  review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
