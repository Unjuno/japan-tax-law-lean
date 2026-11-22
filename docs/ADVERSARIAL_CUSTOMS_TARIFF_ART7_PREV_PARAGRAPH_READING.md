# Independent adversarial review — 関税定率法 第七条(25)（準用）READING

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written outside the repo and deleted; no repository file
modified by the reviewer; no `lake build` run by reviewer.

## Verdict: CONCRETE FINDINGS (3) — all documentation/evidence-level (D-class); FIXED, confirming review pending

The formalization core is sound (no H/T/C/U defects): sha256, needle uniqueness,
all statutory CJK byte-fidelity (incl. fullwidth caption parens), law identity,
article-kind locator len 5989, 前項=24 derivation, 準用 interpretation, spec
distinctness/equivalence over all 2x3 combos, axiom-free proof, no forbidden
constructs, English-only audit name, no duplicate impl. Three D-class findings
were reproduced and fixed:

1. **D — adversarial doc:4** carried a pending-verdict placeholder with zero
   recorded findings. Fixed by recording this verdict and the three findings.
2. **D — evidence ledger** had `__ADVERSARIAL__` placeholder (downstream audit
   FAIL 'non-batch reference'). Fixed by recording the verdict summary.
3. **D — unit doc:22** cited the audit check with U+2026 U+2194 (`…↔`) instead of
   the actual ` - ` separator. Fixed to the exact registered check label.

Unit: NORM|f8c7e9bb416eb400df2c804473bd1982fd394436266d05baed397418ac7c731e
Verbatim (injected from the authoritative queue task, not hand-typed):
  「第八項、第九項及び第二十項の規定は、前項の調査が開始された場合について準用する。」

Scope of the computable slice: only the cross-reference structure (which source
provisions — para 8, 9 and 20 — are read into the 前項 (para 24) investigation-start
case). The substantive content of those paragraphs, the trigger's establishment,
other reading rules, and legal correctness are NOT MODELLED.

Human legal review remains `LEGAL_REVIEW_PENDING` (non-blocking, separate axis).
