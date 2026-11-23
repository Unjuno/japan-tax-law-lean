# Unit review — 国税審議会令 art.4（委員の任期は二年とする）

Normative unit id: `NORM|5adb98f94dfcc1816db82d141229cfd8c175fbebd2c2a3ad22d59aafbc2a2032`

Law: 412CO0000000278 (国税審議会令), CabinetOrder, revision
`412CO0000000278_20260401_507CO0000000412`, snapshot
`data/raw/412CO0000000278_20260401_507CO0000000412.law.json`, sha256
`165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186`.

Verbatim source text: 「委員の任期は、二年とする。」 (verbatim-unique in whole law).
Kind: **EFFECT** — the committee member term is exactly 2 years.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This article fixes the committee member term at exactly 2 years. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「国税審議会令 art.4（委員の任期は二年とする）↔ CommitteeTermTwoYears.lean」 law 412CO0000000278; needle unique. Full audit: 436/436 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第四条. |
| C (competing interpretation) | Reading the term as "up to two years" would admit 1 year; kernel theorem `term_one_false` rejects that. Reading it as "at least two" would admit 3; `term_three_false` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. 委員 identity, appointment/renewal rules and committee powers require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `committeeTermYears=2`, `isCommitteeTerm y := decide (2 <= y && y <= 2)`.
- Independent spec: `specIsCommitteeTerm y := decide (¬ y < 2 && ¬ 2 < y)` (negated strict orders — distinct operators); universal `agree_committee_term` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `term_two_true` (2 qualifies), `term_one_false`, `term_three_false`.
- Tests: 10 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

委員 identity, appointment/renewal rules, committee powers, other articles and
operational rules. This is a computable slice of one EFFECT norm unit.

## Adversarial review

See `docs/adversarial/reviews-committee-term-two-years.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
