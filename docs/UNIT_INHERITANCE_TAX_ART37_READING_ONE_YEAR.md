# Normative unit: 相続税法 art.37(6) (「二年」を「一年」と読み替える)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|a21c53e36ea825a1b4301337ab9dc6b03aff4de951fdbdfe5e7f91d91d8ffb7c`
- law/revision: `325AC0000000073` / `325AC0000000073_20260401_506AC0000000008`
- enforcement: 2026-04-01
- source path: `LawBody[3]/MainProvision/MainProvision[4]/Article:37/Article#37/Paragraph#6/ParagraphSentence/Sentence#2`
- verbatim unit: 「この場合において、同項ただし書中「二年」とあるのは、「一年」と読み替えるものとする。」 (EXCEPTION, reading substitution)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (1883 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 the proviso's 「二年」 is replaced by 「一年」 in this case; the
  effective period is one year (12 months), inclusive at the boundary.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  sentence occurs exactly once in `Article:37`; independent extraction of
  「二」 → 2 and 「一」 → 1; `clause_correspondence` accepts `{1,2}` and `{2}`.
- **D**: D1 PASS (impl 2/1/12 and spec 2/1/12 agree); D2 PASS at 11/12/13 and
  24 months, all kernel-decided.
- **C**: C1 「読み替える」 is a substitution limited to 「この場合」; applying the
  substitution outside that case was rejected. The original two-year period is
  retained in the model only as the source value, not as the effective limit.
- **U**: U1 the underlying proviso, the triggering conditions and other
  paragraphs are outside this unit and remain NOT MODELLED. Human legal review
  is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
