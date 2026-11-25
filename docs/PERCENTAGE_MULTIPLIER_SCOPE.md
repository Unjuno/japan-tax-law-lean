# Percentage-multiplier cycle — PROVED_SCOPE, not FULLY_VERIFIED

18 pinned units state percentage multiplications: 14× 15% 不申告加算金,
2× 35% shortfall additions, 1× 15%/20% withholding list, 1× 15% rate list.

`PercentageSurcharge.lean` computes `amount × rate / 100`. The independent
spec uses REDUCED fractions (15% = 3/20, 35% = 7/20, 20% = 1/5) — different
numerals, not the implementation formula. Universal theorems `agree15`,
`agree35`, `agree20` are proved with `Nat.mul_div_mul_right`, i.e. genuinely
non-tautological kernel proofs, plus a monotonicity theorem.

Mechanical self-audit: 18/18 prefixes resolve uniquely, rate phrases verbatim
in pinned raw snapshots, 18/18 SHA-256 matches, rates all in {15,35,20},
0 forbidden proof markers.

**Honesty note:** the independent adversarial subagent was unavailable
(usage limit). The `ADVERSARIAL_REVIEW` evidence axis was therefore NOT
recorded. Derive_status accordingly yields **PROVED_SCOPE**, not
FULLY_VERIFIED. This is progress (NOT_STARTED → PROVED_SCOPE) without
overstating verification.

Measured: NOT_STARTED 260,967 → 260,949; PROVED_SCOPE 0 → 18;
FULLY_VERIFIED unchanged at 2,827.
