# Unit review — 関税定率法 art.7(15)（一年以内 → 一年以内において速やかに 読替え）

Normative unit id: `NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f`

Law: 143AC0000000054 (関税定率法), revision
`143AC0000000054_20260601_508AC0000000005`,
snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「この場合において、第七項本文中「一年以内に」とあるのは、「一年以内において速やかに」と読み替えるものとする。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#15/ParagraphSentence/Sentence#2`.
Norm kind: **READING** (読み替え / textual substitution rule).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.7(15) sentence 2 directs that, in a specified case, the phrase 「一年以内に」 in paragraph 7's main text be read as 「一年以内において速やかに」. Both phrases retain the one-year (12-month) outer bound; the substituted phrase adds a promptness (速やかに) requirement. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「関税定率法 art.7(15)…↔ CustomsReadingSubstitution.lean (readingSubstitution)」 pinned to law 143AC0000000054, article locator 第七条, needle with terminal 「。」. Full-file count of the needle is 1 and it is located in Article 7 / Paragraph 15. |
| D (decision) | PASS — audit reports `178/178 checks passed`. |
| C (competing interpretation) | The substitution is a textual 読み替え, not a numeric change; modeling the two statutory phrases as an enumerated type is faithful. The specific triggering case 「この場合において」 and the substantive art.7 investigation rules are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsReadingSubstitution.lean` — `DeadlinePhrase` enumerated type (two statutory phrases), `readingSubstitution`, `outerDeadlineMonths` (12 for both), `hasPromptnessReq`, `applyReadingToText`.
- Independent spec: predicate-based conditional reformulation; `agree_reading` proved by exhaustive case analysis over the type's inhabitants (a universal proof over the finite type, not a finite sample).
- Kernel proofs: `reading_preserves_deadline`, `reading_adds_promptness`, `reading_idempotent`, `reading_text_preserves_length` (universal over List), `reading_text_preserves_deadline` (induction over arbitrary lists).
- Build: `lake build` → full build success (584 jobs); axiom probe: most theorems axiom-free, list theorems use `propext`/`Quot.sound`, no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The triggering condition 「この場合において」, the substantive investigation rules of art.7, other paragraphs and all 政令 details. This is a computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_CUSTOMS_READING_SUBSTITUTION_7_15.md` (H/T/D/C/U per finding).
