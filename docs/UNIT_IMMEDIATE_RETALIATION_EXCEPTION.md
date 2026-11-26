# Unit review — 報復関税等政令 art.2(1) ただし書（直ちに措置をとる場合の例外 / EXCEPTION）

Normative unit id: `NORM|191808d9f8712d403ee653616a4107f62c451eaae37d90ac990046223bceeca7`
Law: `406CO0000000418`, revision `406CO0000000418_20010106_412CO0000000307` (`CurrentEnforced`).
Source: `data/raw/406CO0000000418_20010106_412CO0000000307.law.json`
SHA-256 (CRLF→LF): `9b5379bdc281682b8dd57ef47d66847b6b05cbca4254afeb8ce6ecb1314b28ee`
Provision: `LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/ParagraphSentence/Sentence#2`

Verbatim (EXCEPTION): 「ただし、報復関税等に係る措置を直ちにとる必要があると認められる場合は、この限りでない。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | When immediate retaliatory measures are found necessary, the main rule's limit does not apply. Case codes 0 (immediate necessity) → 1 (exception applies); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第二条`. Independent audit: needle whole law = 1, scoped (220 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the exception switch is modelled, not the qualified main rule. |
| U | The qualified main rule and measure content need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `ImmediateRetaliationException.lean` — `asException : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `ImmediateRetaliationExceptionSpec.lean` — `specAsException c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_exception (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: qualified main rule, retaliatory measure content, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
