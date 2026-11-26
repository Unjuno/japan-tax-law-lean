# Unit review — たばこ税法改正政令整備政令 art.3（第六項・第七項の準用 / READING）

Normative unit id: `NORM|3b374d46b3620530b433d1c8d12e627f7d2327139e6f3f92e7209a4c140854a5`
Law: `422CO0000000060`, revision `422CO0000000060_20101001_000000000000000` (`CurrentEnforced`).
Source: `data/raw/422CO0000000060_20101001_000000000000000.law.json`
SHA-256 (CRLF→LF): `b6ae25c119ea3741f5567f8fb9bdbddc21b8bc992f00af56d7de585b848f51cd`
Provision: `LawBody[2]/MainProvision/MainProvision[0]/Article:3/Article#3/Paragraph#9/ParagraphSentence/Sentence#1`

Verbatim (READING): 「第六項及び第七項の規定は、前項の場合について準用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | Paragraphs 6 and 7 apply mutatis mutandis to the preceding case. Paragraph tags 0 (第六項) and 1 (第七項) → listed code 1; others → 0. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第三条`. Independent audit: needle whole law = 1, scoped (2153 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle (needle typo in the first draft corrected before execution), correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the paragraph selection is modelled, not the paragraphs' substance. |
| U | Content of paragraphs 6/7 and the triggering case need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `ParagraphSixSevenReading.lean` — `asListed : Nat → Nat | 0 => 1 | 1 => 1 | succ(succ _) => 0`, with three boundary theorems.
- Independent spec: `ParagraphSixSevenReadingSpec.lean` — `specAsListed k := if k = 0 || k = 1 then 1 else 0`, no implementation definitions reused.
- Universal kernel proof: `agree_as_listed (k : Nat)` — nested `cases` + `decide`/`rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: paragraphs' content, triggering case, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
