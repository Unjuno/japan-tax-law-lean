# Evidence artifacts (norm-unit completion ledger)

All files are JSON objects keyed by `norm_id` (24-hex string from
`scripts/ci/norm_identity.py`). Missing keys are treated as **no evidence**,
never as PASS. A `SKIPPED` state is reported separately and never counted as
PASS.

## module_bindings.json

```json
{
  "<norm_id>": {
    "impl": "JapanTaxLaw/IncomeTaxRate.lean",
    "spec": "JapanTaxLaw/IncomeTaxRateSpec.lean",
    "tests": "JapanTaxLaw/IncomeTaxRateTests.lean"
  }
}
```

Each referenced module must contain `norm-id: <norm_id>` (or
`norm_unit <norm_id>`) in a doc comment. The spec module must additionally
contain a typed `def` / `theorem` / `structure` / `abbrev` whose name contains
`spec`. File existence alone is insufficient.

## proof_obligations.json

```json
{
  "<norm_id>": {
    "theorem_names": ["rateBandBoundary", "rateMonotone"],
    "proof_obligations": ["spec↔impl agreement", "boundary reachability"]
  }
}
```

## kernel_audit.json

```json
{
  "<norm_id>": {
    "exit_code": 0,
    "lean_version": "4.x.y",
    "axioms": [],
    "theorems": ["rateBandBoundary", "rateMonotone"],
    "axiom_free": true,
    "timestamp": "2026-11-20T00:00:00Z"
  }
}
```

`axiom_free` must be true, `exit_code` 0, and every theorem in
`proof_obligations.json` must appear in `theorems`. `sorryAx`,
`Classical.choice` and `Quot.sound` in `axioms` fail the check.

## boundary_cases.json

```json
{
  "<norm_id>": {
    "boundary_covered": true,
    "cases": [
      {"input": "1950000", "expected": "0.05", "kind": "lower_bound"},
      {"input": "1950001", "expected": "0.10", "kind": "above_bound"}
    ]
  }
}
```

## adversarial_findings.json

Each record must contain all five fields; an empty field fails the check.

```json
{
  "<norm_id>": {
    "H": "falsifiable statement to test",
    "T": "reproduction command / input",
    "D": "PASS / FAIL / INCONCLUSIVE",
    "C": "competing interpretation considered",
    "U": "remaining uncertainty"
  }
}
```

## unhandled_conditions.json

```json
{
  "<norm_id>": {"conditions": ["未施行の附則条項"]}
}
```

An empty `conditions` list is a valid disclosure; a missing key is not.

## legal_review.json (human only)

```json
{
  "<norm_id>": {
    "reviewer": "name",
    "review_date": "2026-11-20",
    "conclusion": "original text correctly represented"
  }
}
```

The Coordinator must never populate this file mechanically. It is the only
way to reach `FULLY_VERIFIED`.
