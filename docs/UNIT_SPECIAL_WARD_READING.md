# Unit review — 口蹄疫特例法施行令 art.2(6)（特別区への準用 / READING）

Normative unit id: `NORM|dd5ec1ac1f02917579082e477bba620ca8d36970e2a503fef2f51185baa2d6b4`
Law: `422CO0000000221`, revision `422CO0000000221_20101029_000000000000000` (`CurrentEnforced`).
Source: `data/raw/422CO0000000221_20101029_000000000000000.law.json`
SHA-256 (CRLF→LF): `578e40cfd0d6aecab3979acf0387571275f75e69448e3b9ceb6cecceda7499d1`
Provision: `LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#6/ParagraphSentence/Sentence#1`

Verbatim (READING): 「前各項の規定は、特別区について準用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The preceding paragraphs apply mutatis mutandis to 特別区. Jurisdiction code 0 (特別区) → listed code 1; others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第二条`. Independent audit: needle whole law = 1, scoped (1236 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the 準用 selection is modelled, not the preceding paragraphs' substance. |
| U | Preceding paragraphs' content need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `SpecialWardReading.lean` — `asSpecialWard : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `SpecialWardReadingSpec.lean` — `specAsSpecialWard c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_special_ward (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: preceding paragraphs' content, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
