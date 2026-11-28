# Normative unit: 地方税法 art.20の2(3) (七日経過で送達とみなす)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|94b107b492843483af55a7f2fa65c4f7eec3b29d6d814a936c21da0541e542aa`
- law/revision: `325AC0000000226` / `325AC0000000226_20261101_508AC0000000002`
- enforcement: 2026-11-01
- source path: `LawBody[2]/MainProvision/MainProvision[0]/Article:20_2/Article#20_2/Paragraph#3/ParagraphSentence/Sentence#1`
- verbatim unit: 「前項の場合において、同項の規定による措置を開始した日から起算して七日を経過したときは、書類の送達があつたものとみなす。」 (DEEMING)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (432 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 delivery is deemed once 7 days have elapsed, inclusive at day 7.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  sentence occurs exactly once in `Article:20の2`; independent extraction of
  「七」 → 7; `clause_correspondence` accepts `{7}` and rejects `{6}`, `{8}`.
- **D**: D1 PASS (impl `deemedDays = 7` and spec `specDays = 7`); D2 PASS at
  0/6/7/8/14 days, all kernel-decided.
- **C**: C1 「七日を経過したとき」 is inclusive at day 7; an exclusive reading
  would move the boundary to day 8. The verbatim 「経過したとき」 was used.
- **U**: U1 the underlying measure, the preceding paragraph's conditions and
  all other paragraphs are outside this unit and remain NOT MODELLED. Human
  legal review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
