# Unit review — 国税審議会令 art.4(1) ただし書（補欠委員の残任期間 / EXCEPTION）

Normative unit id: `NORM|cf722af4d2f2c121fe0a14ac50941eeabab052f69898d39460641b370230662e`
Law: `412CO0000000278`, revision `412CO0000000278_20260401_507CO0000000412` (`CurrentEnforced`).
Source: `data/raw/412CO0000000278_20260401_507CO0000000412.law.json`
SHA-256 (CRLF→LF): `165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/ParagraphSentence/Sentence#2`

Verbatim (EXCEPTION): 「ただし、補欠の委員の任期は、前任者の残任期間とする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | A substitute member's term equals the predecessor's remaining term. `residual : Nat` in whole years; `substituteTerm residual = residual`. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle whole law = 1, scoped (196 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the proviso's term rule is modelled, not the ordinary two-year term. |
| U | Ordinary two-year term, appointment/renewal need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `SubstituteMemberResidualTerm.lean` — `substituteTerm residual := residual`, with universal `term_equals_residual` and a zero-boundary theorem.
- Independent spec: `SubstituteMemberResidualTermSpec.lean` — structural `specSubstituteTerm : Nat → Nat | 0 => 0 | succ n => succ n`, no implementation definitions reused.
- Universal kernel proof: `agree_substitute_term (residual : Nat)` — `cases residual <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: ordinary two-year term, appointment/renewal, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
