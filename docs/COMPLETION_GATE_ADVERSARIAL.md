# Adversarial audit of the completion gate

repo: `D:\CodexData\Temp\opencode\jtl-next6`

verdict: **PASS** (0 MUST failures)

- tools present: 4/4
- evidence file: D:\CodexData\Temp\opencode\jtl-next6\data\verification_evidence.json
- durable state counts: {"BLOCKED": 2, "FULLY_VERIFIED": 1192, "NOT_STARTED": 1}

| rule | must | H | T | D | C | U |
|---|---|---|---|---|---|---|
| distinct_completion_states | yes | Tools collapse verification into a single boolean/COMPLETE flag. | searched stripped code of 4 tools | PASS | A tool may mention FULLY_VERIFIED only in a docstring. | Emitted status column checked by ledger rules. |
| no_presence_or_string_completion | yes | A needle/file/name match alone sets a completion status. | two-step assignment scan over 4 tools | PASS | Only presence variables used in status assignments are flagged. | Cross-checks ARTICLE_OBLIGATIONS.md: presence must cap at PARTIAL. |
| collision_free_id_components | yes | IDs omit law/revision/history/main-supplementary/appendix-cell/unit fields. | searched stripped code for law_id, revision, history, suppl, appdx, cell, unit, sha256 | PASS | ID construction may be in a helper module. | Digest construction covered by dedicated unit tests. |
| dependency_not_15digit_only | yes | Dependencies resolved by 15-digit number search only. | searched law-name/article/revision plus 15-digit handling | PASS | Parsing may be delegated to a helper. | Queue tests exercise helper behaviour. |
| durable_ownership_and_blockers | yes | Regeneration loses owner/blocker/artifacts. | searched stripped code for owner, blocker, artifact, task_state.json, merge | PASS | State file name may differ in case. | Fields existing does not prove conflict-free assignment. |
| skip_is_not_pass | yes | Absent required gate counted as pass. | inspected run_python_gates.py for REQUIRED_GATES and distinct required-gate handling | PASS | Optional phase gates may SKIP legitimately. | CI enforcement outside this audit. |
| ledger_no_bare_complete | yes | Ledger reports bare COMPLETE. | scanned 302 article rows | PASS | FULLY_VERIFIED requires evidence (next rule). | Stale ledger may pass. |
| fully_verified_has_evidence | yes | FULLY_VERIFIED asserted without machine-produced evidence. | 0 FULLY_VERIFIED rows; evidence verification_evidence.json (3 keys) | PASS | Evidence file may be stale. | Run proof/attestation gates before trusting FULLY_VERIFIED. |
| scope_mispin_reported | no | Needles match a different article than stated. | counted scope-candidate states | PASS | Cross-article reuse may be legitimate. | Each candidate needs confirmation. |