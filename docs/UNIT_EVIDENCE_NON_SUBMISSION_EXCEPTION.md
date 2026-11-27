# Unit review — 相殺関税政令 art.7(4) ただし書（証拠不提出の例外 / EXCEPTION）

Normative unit id: `NORM|f7b116e19fbd4c2e1dfb0eafbee2f8a05520b402b210e60c5997abca04d1a524`
Law: `406CO0000000415`, revision `406CO0000000415_20171008_428CO0000000240` (`CurrentEnforced`).
Source: `data/raw/406CO0000000415_20171008_428CO0000000240.law.json`
SHA-256 (CRLF→LF): `3b0d6b8a73c3766b709c75f15a533014005c94debf0ed23f737ba3ad4f972e8a`
Provision: `LawBody[2]/MainProvision/MainProvision[6]/Article:7/Article#7/Paragraph#4/ParagraphSentence/Sentence#2`

Verbatim (EXCEPTION): 「ただし、当該利害関係者が相当な期間内に当該証拠又は証言を提供しない場合は、この限りでない。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | If the interested party does not provide evidence/testimony within a reasonable period, the main rule's limit does not apply. Case codes 0 (non-submission) → 1 (exception applies); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第七条`. Independent audit: needle whole law = 1, scoped (1037 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the exception switch is modelled, not the qualified main rule. |
| U | The qualified main rule, party identity and reasonable-period determination need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `EvidenceNonSubmissionException.lean` — `asException : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `EvidenceNonSubmissionExceptionSpec.lean` — `specAsException c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_exception (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: qualified main rule, party identity, reasonable period, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
