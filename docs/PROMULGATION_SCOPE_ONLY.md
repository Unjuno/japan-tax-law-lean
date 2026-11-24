# Promulgation-day cycle — an audit that correctly refused verification

1,082 pinned units state 「公布の日から施行する」 (943 main clauses, 139 provisos).
A minimal Lean model (`PromulgationEffective.lean`) encoded a zero-day offset
with an `agreePromulgationOffset` proof.

The independent adversarial audit returned **D: FAIL** on two grounds:

1. **Dual timing (2 units):** `751c405135d5…` and `afaf3082e97a…` also state a
   different effective date (同年十月一日 / 昭和四十三年六月一日) for part of the
   provision. A uniform zero-day offset is false for them.
2. **Thin model:** the spec was `offset = 0` and the agreement proof was `rfl`
   — a definitional tautology with no independent semantic derivation. The
   audit stated that calling these units FULLY_VERIFIED would be dishonest;
   PINNED/SCOPE_ONLY is the honest assessment.

**Action taken (no false progress claimed):**
- 1,080 units: only `SOURCE_LOCATION` and `DECOMPOSITION_AUDIT` evidence
  recorded → **PARTIAL**, not FULLY_VERIFIED.
- 2 dual-timing units: additionally `DUAL_EFFECTIVE_DATE_NOT_MODELLED` blocker
  → **BLOCKED**.

Measured status: NOT_STARTED 262,176 → 261,094; PARTIAL 3,104 → 4,184;
FULLY_VERIFIED unchanged at 2,827; BLOCKED 0 → 2.

This is a governance result: the queue refused to convert a tautological proof
into verification progress. The objective's rule that new models count only
when unverified obligations actually decrease is enforced here.
