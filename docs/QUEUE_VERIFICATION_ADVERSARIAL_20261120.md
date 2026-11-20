# Adversarial verification of the normative queue (2026-11-20)

Scope: independent inspection of the first execution task (task queue and
completion judgement). This document records only mechanical observations and
the fixes that were applied. It does **not** claim legal correctness or
completion of the tax-law formalisation.

Baseline re-fetched from GitHub: `main` HEAD `2224688` matched the local clone
at the start of the session (`22246889a2d91e927cadb2c6382a9911904325e3`).
Reference commit `44fa08a` is an earlier ancestor in the same history.

## Defects found and fixed

| ID | Finding | Evidence | Fix |
|---|---|---|---|
| D1 | `normative_core` dependency readiness could be satisfied by any proved unit of the same law, ignoring article and enforced revision | selector read `proved_laws` as a law-id set | readiness now keys on `(law_id, article, enforcement_date)` and rejects bare 15-digit ids |
| D2 | `scripts/ci/task_queue.py` read `enforcement_date` from `current_revision`, but the pinned inventory stores `amendment_enforcement_date`; every unit got `""` | generated queue showed `"enforcement_date": ""` for all units | fallback added; generated queue now shows `"2026-06-01"` for 関税定率法 |
| D3 | Generated units had no `revision` and no `norm_fragment`; the selector's computability ranking was always zero | selected records showed `"revision": ""`, `"norm_fragment": ""` | queue now emits `revision`, `norm_fragment`, `norm_type`; selector enriches its output from them |
| D4 | `scripts/law_audit/phase_e/article_scope.py` imported `normative_core` without adding `scripts/ci` to `sys.path`, so the CI gate crashed with `ModuleNotFoundError` | `python scripts/law_audit/phase_e/article_scope.py` exit 1 | path inserted before import; gate now reports `158 scoped / 0 whole-text across 158 checks` |
| D5 | `scripts/ci/task_selector.py` was reverted to the legacy schema (`status["formalized"]`) while the queue emits a string status, so the selector could not run | legacy source at lines 38-40 | selector re-integrated with `normative_core.select_tasks` and made schema-tolerant |
| D6 | `scripts/tests/test_completion_gate_adversary.py` imported a module that had been deleted | unittest discovery: 1 import error | independent adversary restored, with H/T/D/C/U findings; its 8 tests pass |
| D7 | Initial adversary rules produced two false positives (presence aggregation labelled as presence, and required-gate handling without a literal `strict` flag) | auditor reported `no_needle_completion=FAIL`, `skip_not_pass=FAIL` against compliant code | rules refined; auditor now reports 4/4 PASS with `failures: []` |

## Measured verification

- `python -m unittest discover -s scripts/tests -t .` → **113 tests, OK**
- `python scripts/ci/task_queue.py` → `396854 units; NOT_STARTED=396852, BLOCKED=2`
- `python scripts/ci/task_selector.py 2` → 2 selected, 1 blocked by dependency, legal review not a filter
- `python scripts/ci/article_obligations.py` → `NOT_STARTED=52, FULLY_VERIFIED=0`
- `python scripts/law_audit/phase_e/article_scope.py` → `158 scoped / 0 whole-text across 158 checks`
- `python scripts/ci/completion_gate_adversary.py` → all four H/T/D/C/U rules PASS

## Unverified obligations (explicitly not claimed)

- 396,852 units remain NOT_STARTED; none has a Lean kernel proof or an
  independent source-correspondence audit recorded.
- Human legal review remains pending for every unit.
- No whole-tax-law completion claim is made. The figures above measure only
  queue/completion-mechanism correctness, not substantive legal formalisation.
