# §2 probe: why candidate-date intersection is NOT a reference→revision mapping

Date: 2026-11-26. Read-only e-Gov `law_data` fetches to a temp directory; no
repository source files were changed by the probe. Not legal advice.

## Hypothesis under test
H: for a 附則 reference with defining clause 以下「新X法」という, if a pinned
revision candidate has an enforcement date appearing in that clause's context,
then that candidate revision is the law-data target of the reference.

## Test (T)
Fetched e-Gov law_data for three pin-feasible references from
`docs/HISTORICAL_REFERENCE_CONTEXTS.md`:
- `325AC0000000073` 新相続税法, candidate date 2024-01-01: 2 candidates
  fetched (`..._505AC0000000003`, `..._504AC0000000004`). Both contain the
  clause 3 and 2 times respectively, with context referring to 昭和六十四年
  四月一日 and 第三条の規定による改正後.
- `332CO0000000043` 旧租税特別措置法施行令, date 2018-01-01: 2 candidates
  fetched, both contain the clause twice, context refers to 昭和六十四年.
- `426AC0000000011` 新地方法人税法, date 2020-04-01: 3 candidates, each
  contains the clause once, with 令和二年四月一日 context.

## Decision (D)
**FAIL for the hypothesis.** No reference→revision mapping is established.
The clause is present in multiple candidate revisions of the same date, so
clause presence and date intersection are not discriminative.

## Competing interpretation (C)
Historic 附則 texts are carried forward into later consolidated revisions.
The defining clause therefore appears in many revisions; its presence says
the *amendment* is represented in that revision, not that the revision is
the one denoted by the reference.

## Uncertainty (U)
A defensible mapping would need the defining clause's amendment-law identity
(e.g. 第三条の規定による改正後 + the amendment statute named in 附則 第一条)
to be matched against the candidate's `amendment_law_id`. That work remains
undone. The ledger therefore continues to report 87 references with **0**
mappings, and the 6 date intersections remain candidates only.

Action: this probe is recorded as a negative result and no status in
`HISTORICAL_REFERENCE_CONTEXTS.md` is upgraded.
