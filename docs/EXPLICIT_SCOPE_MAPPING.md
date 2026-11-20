# Explicit spec/proof scope mapping (Directive §1.5, §3)

## Problem

Literal containment (`all kanji literals of the spec occur in the clause`)
was used as a proxy for "the spec models this clause". The independent review
of PR #204 showed two failure modes:

- a spec with no numeric literals makes the predicate vacuous, so every
  eligible unit in the article is accepted, including clauses documented as
  `NOT MODELLED`;
- a numeral shared with a different article (or a same-numbered supplementary
  provision) can produce a false scope match.

## Decision

`scripts/ci/spec_scope_map.py` builds `data/SPEC_SCOPE_MAP.json` from the
**committed spec source headers**. Each spec declares, in its leading
doc-comment, the law id and the articles it restates (e.g. `art. 21-7`,
`第89条`, `Art. 4-5`). A unit is in scope only when:

1. its law id is declared in that spec header,
2. its canonical article key is one of the declared articles,
3. it has no unresolved conditions.

All rejected units are recorded with the specific reason
(`ARTICLE_NOT_DECLARED`, `LAW_ID_NOT_DECLARED_IN_SPEC_HEADER`,
`UNIT_HAS_UNRESOLVED_CONDITIONS`, `NO_ARTICLE_DECLARATION_IN_SPEC_HEADER`).
H/T/D/C/U findings for the rule are embedded in the generated map.

`generate_verification_evidence.py` now requires a positive decision from
this map *in addition to* the existing checks (kernel attestation with hash
match, scoped needles, independent spec, review, test counts, non-empty kanji
set, verbatim source location, exact decomposition coverage).

## Measured effect

```
spec scope map: 97 modules, 510/1433 candidate units explicitly in scope
generate_verification_evidence -> attested units: 7
task_queue -> NOT_STARTED=396844, PROVED_SCOPE=1, FULLY_VERIFIED=7, BLOCKED=2
verify_queue_invariants -> 12/12 passed (unbacked=0)
```

The count fell from 8 to 7 because one previously attested unit was not in
any spec's declared scope. This is an honest reduction, not a lost proof.

## Gate order (CI)

```
spec-scope regression tests -> explicit spec-scope mapping
  -> verification evidence regeneration -> task queue
  -> queue invariants -> article obligations
```

SKIP is never PASS; all of these gates are required.

No completion claim is made.
