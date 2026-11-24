# Per-unit cycle — 地方税法 74条の5 (たばこ税の税率)

Second distinct formalization cycle (after 酒税法 附則八条三項).

## Selected unit
- `normative_id`: `af0337e57754…`; law 325AC0000000226 (地方税法)
- revision `325AC0000000226_20261101_508AC0000000002`
- span 0–22 of the pinned raw snapshot; no dependencies, no unresolved conditions
- verbatim: 「たばこ税の税率は、千本につき千七十円とする。」

## Artifacts
- `JapanTaxLaw/LocalTobaccoRate.lean` — `ratePerThousand = 1070`,
  `tobaccoTaxYen n = n * 1070` (n counts 千本 units)
- `JapanTaxLaw/LocalTobaccoRateSpec.lean` — independent recursive spec
  (`specTobaccoTaxYen`: 0↦0, n+1↦spec n + 1070), **`agreeTobaccoRate` proved by
  induction for ALL Nat**, `spec_monotone` universal
- `JapanTaxLaw/LocalTobaccoRateTests.lean` — boundaries and examples
- imported from `JapanTaxLaw.lean`

## Verification
- Full Lean build: **524 jobs**, 0 errors; forbidden-proof scan clean.
- cross-law pin consistency: 448 pinned modules, 0 failed.
- Independent read-only fidelity audit (`LOCAL-TOBACCO-RATE-SRC-1`): **D=PASS**,
  recomputed source SHA-256 and span digest matched pinned values; H/T/D/C/U
  recorded, including the competing reading (1.07円/本 with rounding) and
  out-of-scope items.
- 10 evidence axes recorded; unit FULLY_VERIFIED.

Measured: NOT_STARTED 264,998 → 264,997; FULLY_VERIFIED 5 → 6.
Human legal review remains pending and is never fabricated.

Out of scope: fractional-本 rounding, eligibility, 製造場 classification,
特定たばこ特例.
