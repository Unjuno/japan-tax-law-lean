# Reading-substitution cycle — scope-only, not verification

127 pinned units state 読替え rules (「「X」とあるのは「Y」と読み替える」),
giving 196 substitution pairs. `ReadingSubstitutions.lean` transcribes all 196
pairs verbatim; the kernel checks the list length (196) and that each copied
pair has a non-empty, distinct source/target.

The independent audit reported:
- transcription fidelity **PASS** — 127/127 prefixes resolve uniquely,
  196/196 pairs verbatim in pinned raw snapshots, 127/127 SHA-256 matches.
- but FULLY_VERIFIED is **NOT honest**: the model has no target-provision model,
  no substitution/application semantics, and no proof that applying a pair
  yields the legally correct reading. `specValidPair` is not connected to the
  Bool check, so the independent-spec axis is nominal.

**Action taken:** recorded only `SOURCE_LOCATION` + `DECOMPOSITION_AUDIT` for
the 127 units → PARTIAL. FULLY_VERIFIED unchanged at 2,827.

Measured: NOT_STARTED 261,094 → 260,967; PARTIAL 4,184 → 4,311. No false
progress recorded. The objective's rule that a new model counts only when
unverified obligations genuinely decrease is enforced again.
