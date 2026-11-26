# FULL-COVERAGE adversarial review — 百分のp (36 candidates, 35 accepted)

Auditor: independent general subagent (session ses_de70fed10ffewe9H0FN5RFhpXA).
Read-only, non-sampled audit of all 36 units in `percent3_units.json`.
Scripts: `percent3_source_fidelity_audit.py`. Not legal advice; not a
completeness claim.

## Verdict: FAIL for 1/36; PASS for the remaining 35

| Check | Result |
|---|---|
| SHA-256 pin (unit = task = on-disk = INVENTORY) | 36/36 |
| Token 「百分のX」 verbatim in fragment and full text | 36/36 |
| Fragment contiguous via `make_full_text_reader(task)` | 36/36 |
| Independent `kansuji.kanji_to_int` == recorded `percent` | 36/36 |
| Clean rate-application context (not ownership ratio / not 1/200) | **35/36** |
| Lean family intact, independent spec, no forbidden tokens | PASS |

The single failure is `77bb4525...2858` (law `347M50000040044`, 第15条):
the pinned text is 「総点数に**二**百分の一を乗じて得た点数」 — a 1/200
rate, not a 1/100 rate. The collector captured only the suffix 「百分の一」.
This is a genuine model/fidelity mismatch, not a tooling artifact.

## H/T/D/C/U
- H = 「百分のp」 denotes the exact fraction `amount*p / 100`.
- T = full-coverage SHA, verbatim token, parsed-text contiguity, independent
  Kanji re-parse, rate-context classification, Lean token/spec scan.
- D = PASS 35/36; FAIL for the 1/200 unit. All Kanji parses correct (an
  earlier collector defect 五十→49 was avoided by using `kansuji.kanji_to_int`).
- C = that unit belongs to a separate 1/200 model, not this family.
- U = rounding to yen and the amount itself are caller-established; no legal
  review performed.

## Action
The 1/200 unit's IntegerPercentRates evidence is retracted and it is marked
`BLOCKED` with `SPEC_FIDELITY_CONTRADICTION_ADVERSARIAL`; no adversarial axis
is claimed. The other 35 units receive `ADVERSARIAL_REVIEW` and
`FULLY_VERIFIED`.
