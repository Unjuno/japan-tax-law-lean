# Independent audit — TRANSITIONAL decomposition reclassification (§1)

Auditor: independent general subagent (session ses_de9b62f41ffecw7h9O3miUOnDC).
Read-only audit of the new `TRANSITIONAL` norm pattern in
`scripts/ci/norm_decomposer.py` and its 465 newly classified units.
Not legal advice; not a completeness claim.

## Verdict: PASS (with documented priority caveat)
- 465 unique units, all `norm_type=TRANSITIONAL`; pinned SHA-256 465/465
  across 62 distinct source files, 0 hash failures.
- Phrase check: 456/465 fragments contain 従前の例による; the other 9 are
  exactly 80-char `norm_fragment` truncations — all 465 full pinned unit spans
  contain the pattern (464 at sentence end, 1 mid-unit). No silent drop.
- 8 sampled pinned sources (one per distinct file) show the phrase verbatim in
  genuine 経過措置 context (old-law treatment tied to a pre-enforcement date).
- Unit count unchanged 268107 → 268107; stable positional keys identical;
  UNCLASSIFIED 64828 → 64363 exactly −465; de-unclassified set equals the
  465 list; newly unclassified = 0. 17 units retained other unresolved
  conditions, so units with any unresolved fell by 448, not 465.

## Caveat (recorded, not hidden)
TRANSITIONAL is placed above DEEMING/READING_SUBSTITUTION/LEGAL_EFFECT/etc. in
KIND_PRIORITY. Mixed sentences such as 「旧法第四条を読み替えて適用する場合は、
なお従前の例による」 get primary TRANSITIONAL. In total 19,302 units now have
TRANSITIONAL primary, all pattern-backed in full text; 18,837 previously typed
units changed primary (10,980 LEGAL_EFFECT, 2,946 CONDITION, ...). This is a
classification-order trade-off, not a loss of units or evidence: 139 evidence
records were remapped by stable source key and all prior statuses preserved.

## Evidence migration
Because `norm_type` participates in normative IDs, 19,302 IDs changed.
Evidence and task state were remapped from old→new ID via
(law_id, path, norm_start, norm_end, norm_fragment); 139 records moved, 0 lost.
Stale blockers introduced by the one intermediate regeneration (`NO_LONGER_IN_PROJECTION`,
`SOURCE_PROJECTION_CHANGED_REVALIDATE`) were cleared only for IDs present in the
new projection after the stable-key match.
