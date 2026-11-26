# FULL-COVERAGE adversarial review — UnusedDeduction (62 units)

Auditor: independent general subagent (session ses_de7a985ecffeELFK7Fuzh1f3Ck).
Read-only, non-sampled audit over all 62 units in `unused.json`.
Script: `D:\CodexData\Temp\opencode\goal208\fullcov_unused_source_fidelity.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (failures: 0)

| Check | Result |
|---|---|
| Pinned SHA-256 == `source_sha256`; INVENTORY pin agrees | 62/62 |
| `phrase` verbatim in normalized pinned source / fragment / full text | 62/62 |
| Full `norm_fragment` contiguous in pinned source | 49/62 |
| Clause containing `控除しきれ…` contiguous in full provision text | 62/62 |
| Maximal clause around phrase verbatim in pinned source | 62/62 (min 19 chars) |
| Direction `deduction − base` | 62/62 consistent, 0 opposite flags |
| Forbidden proof tokens in Lean files | 0 |
| `undeducted_agrees` with independent `deduction - min deduction base` spec | intact |

The 13 non-contiguous fragments are exactly the table-cell concatenations in
`unused_noncontig.md`; their modeled clause is verbatim contiguous.

## H/T/D/C/U
- H = `控除しきれない金額` denotes the undeducted remainder `max(0, deduction - base)`.
- T = full-coverage SHA, verbatim phrase, clause extraction, direction cues,
  comment-stripped Lean token scan, spec/implementation independence check.
- D = PASS for the clause-level arithmetic; full-fragment contiguity 49/62,
  clause contiguity 62/62, direction 62/62, no forbidden markers.
- C = the 13 joined table-cell fragments are a decomposition artifact, not a
  model discrepancy; they remain `PROVED_SCOPE` with blocker
  `NON_CONTIGUOUS_TABLE_CELL_SPAN` and are NOT claimed `FULLY_VERIFIED`.
- U = operand identity, carry-forward period and any surrounding percentage
  rule are caller-established and NOT MODELLED; no legal review performed.

Only the 49 fully-contiguous units receive `ADVERSARIAL_REVIEW` and are promoted.
