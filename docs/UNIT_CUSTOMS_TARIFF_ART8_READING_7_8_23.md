# Normative unit: 関税定率法 art.8(28) (第七項・第八項・第二十三項の準用)

Status record with measured values. No legal-correctness claim.

- normative_id: `NORM|0eddc7c518823f0a15df18f78b861199b1187a2ecf3bf037a5045417ca0e8cbe`
- law/revision: `143AC0000000054` / `143AC0000000054_20260601_508AC0000000005`
- enforcement: 2026-06-01
- source path: `LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#28/ParagraphSentence/Sentence#1`
- verbatim unit: 「第七項、第八項及び第二十三項の規定は、前項の調査が開始された場合について準用する。」 (READING)
- dependencies: none; unhandled_conditions: none; coverage: exact / COVERED (6919 chars)

## Independent original-text audit (H/T/D/C/U)

- **H**: H1 the incorporated paragraph numbers are exactly 7, 8 and 23; the
  incorporation is active only when the preceding paragraph's investigation has
  started.
- **T**: recursive walk of the pinned JSON `Sentence` node; the verbatim
  sentence occurs exactly once in `Article:8`; independent extraction of the
  kanji numerals 七 → 7, 八 → 8, 二十三 → 23 from the verbatim text;
  `clause_correspondence` accepts `{7,8,23}` and rejects unrelated numerals.
- **D**: D1 PASS (impl pattern match and spec list both give 7/8/23); D2 PASS
  paragraphs 6, 9, 22, 24 excluded; `applies false 7 = false`,
  `applies true 7 = true`, `applies true 9 = false`, all kernel-decided.
- **C**: C1 「準用する」 is a reading/incorporation, not a free-standing
  obligation; 「前項の調査が開始された場合」 is a genuine activation condition.
  Alternative readings that apply without the condition were rejected.
- **U**: U1 the substantive content of paragraphs 7, 8 and 23, the investigation
  procedure and other paragraphs are outside this unit and remain NOT MODELLED.
  Human legal review is pending (`LEGAL_REVIEW_PENDING`).

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1. Zero confirmed findings is not
evidence of absence of defects. Mechanical independent re-extraction, not
human legal review.
