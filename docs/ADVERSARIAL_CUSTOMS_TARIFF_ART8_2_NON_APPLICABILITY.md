# Independent adversarial review — 関税定率法 第八条の二(2)（条件）CONDITION

Unit: NORM|3f6a79aacce7c6e225e32f8ee0c3a4f20ff56056b93d87ac347341b2ceee1ede
Verbatim (injected from the authoritative queue task, not hand-typed):
  「前項の規定は、次の各号のいずれかに該当する場合には、適用しない。」

## Verdict: CONCRETE FINDING (1) reproduced, fixed, and confirmed

Initial independent review raised one concrete finding (H/T/D): two hand-typed statutory
quotes in `CustomsTariffArt8_2NonApplicabilitySpec.lean:7` and `…Tests.lean:6` used
`場合は` (U+5834 U+5408 U+306f) instead of the authoritative `場合には` (with U+306B).

**Fix:** the authoritative needle was injected programmatically from `build/task_queue.json`
(no hand-typed CJK) into both files, replacing the entire `「…」` quote.

**Confirmation (byte-level, mechanical):** all five quote sites (impl, Spec, Tests, unit doc,
adversarial doc) now contain the exact queue needle with U+306B present and the deviating
`場合は` variant absent; the audit literal in `transcription_audit.py` is intact and decodes
to the queue needle. Rebuild 5 jobs; transcription audit 357/357; queue invariants 14/14;
decomposition coverage 33652/33652; no-sorry clean. All other review checks passed on the
first pass (SHA-256, needle count 1, law identity 関税定率法 not 関税法, two-item structure,
len 4324 locator, axiom-free `agree_non_applicability` total over 3 constructors).

No remaining H/T/D/C/U finding. Human legal review remains `LEGAL_REVIEW_PENDING`.
