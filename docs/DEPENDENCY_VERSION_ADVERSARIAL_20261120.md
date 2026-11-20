# Adversarial finding — dependency enforcement version (Directive §1.6 / §5)

Date: 2026-11-20  · Base: `origin/main` `e7b30c9` (freshly re-fetched)
Scope: `scripts/ci/normative_core.py`, `scripts/ci/task_queue.py`

## H — falsifiable hypothesis

`parse_dependencies` records `enforcement_version=""` for every
`law_article` dependency, and `dependency_readiness` keys readiness on the
*caller's own* `enforcement_date`. Therefore a unit that depends on an
**unverified future version** of a referenced law is reported as
dependency-ready (false readiness), violating §1.6
("依存関係は法令名・条番号・施行版まで解析する").

## T — reproducible test

`_repro_dep.py` (kept as a regression test in
`scripts/tests/test_normative_core.py::DependencyTests::
test_readiness_uses_dependency_version_not_callers_date`):

- verified: `B-LAW / 第三条 / 2026-01-01`
- caller enforced `2026-01-01`, depends on `B-LAW / 第三条 / 2027-01-01`
  (not verified anywhere)

Measured **before** the fix:

```
readiness = {'uB': True, 'uA-future': True, 'uA-correct': True}
uA-future depends on B@2027-01-01 (NOT verified); correct answer = False; current = True
BUG CONFIRMED
```

Measured **after** the fix:

```
readiness = {'uB': True, 'uA-future': False, 'uA-correct': True}
no false readiness in this case
```

## D — decision

PASS (defect found, fixed, regression-locked). Four new tests added;
`python -m unittest scripts.tests.test_normative_core
scripts.tests.test_completion_gate_adversary -v` → **32 tests OK**.

Fix: `build_law_version_index(laws)` maps each law id to its current enforced
version; `parse_dependencies(..., law_versions)` populates
`enforcement_version` and marks a name-only hit `unresolved_underdetermined`
when no version can be resolved; `dependency_readiness` keys on the declared
dependency version, never on the caller's date. Backward-compatible: callers
that omit `law_versions` keep the legacy name-only behaviour.

## C — competing interpretation

One could argue that "enforcement version" in §1.6 refers to the citing law's
enforcement version only, making the former keying acceptable. This reading is
rejected because (a) the dependency record itself exposes an
`enforcement_version` field that was always empty — dead evidence of the kind
§1.4 forbids treating as completion — and (b) it would make a dependency on a
not-yet-enforced amendment indistinguishable from one on the enforced text,
which is exactly the "historical / not-yet-enforced" distinction §2 requires.

## U — residual uncertainty

- The referenced law's enforced version is taken from the 2026-11-15 snapshot
  inventory (`current_revision`). A citation to a *historical* version of a
  referenced law is not yet modelled; such dependencies remain underdetermined
  and are held back rather than silently accepted.
- 2 of 327 laws have no enforced version (fully unenforced orders); a
  dependency on them is now correctly underdetermined.
- This is a mechanism fix, **not** a claim that all cross-law relations are
  verified. No Lean theorem and no new normative model was added here.
