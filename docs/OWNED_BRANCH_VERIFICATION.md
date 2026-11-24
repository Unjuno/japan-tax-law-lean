# Owned-branch verification state — `owned/verification-loop`

This document records the verification state of THIS branch/worktree only. It
is deliberately isolated from the shared working tree, where concurrent agents
switch branches and overwrite generated ledgers. No completion claim is made
for the whole tax-law corpus.

## Source scope (Directive §2)

- 327 provisional national 「税」 statutes (unchanged `INVENTORY.json`).
- 382 official e-Gov IDs discovered through reference/delegation relations, all
  outside those 327 and all with names not containing 「税」; 381 are pinned with
  enforced revision, SHA-256 and verified snapshot bytes
  (`data/DISCOVERED_INVENTORY.json`, `docs/DISCOVERED_SCOPE_RESTORE.md`).
- Historical 新／旧 references, local ordinances, treaties, circulars and case
  law remain separate layers; no false scope claim is made.

## Evidence ledger (Directive §1.5, §3, §5)

`data/verification_evidence.json` records **47 normative units**, each with 11
evidence axes (source location, decomposition audit, Lean-independent source
correspondence, independent spec, implementation, kernel proof, proof scope,
boundary proof, cross-law proof, tests, adversarial review). The generator
requires a hash-checked kernel-build attestation and a Lean-independent
numeric-literal check against the pinned original; a numeric match, a file
existing or a theorem name alone cannot set an axis.

Example unit: `NORM|167b8cab…` (相続税法 art. 21-5) — independently located in
the pinned 2026-04-01 snapshot, 六十万円 parsed to 600000 and matched in both
Spec and implementation, kernel builds of impl/spec/tests succeeded,
`#print axioms` reported no axioms, and H/T/D/C/U adversarial review recorded
in `docs/GIFT_21_5_VERIFICATION.md`.

## Reproduction

```
python scripts/ci/task_queue.py
python scripts/ci/verify_queue_invariants.py
python -m unittest discover -s scripts/tests -t .
```

Measured results on this branch (2026-11-20):

```
$ python scripts/ci/task_queue.py
normative-unit queue: 396854 units; NOT_STARTED=396801, PARTIAL=0,
PROVED_SCOPE=0, FULLY_VERIFIED=51, BLOCKED=2
state merge: 396853 change(s)

$ python scripts/ci/verify_queue_invariants.py
PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=51 axes=11 unbacked=0
12/12 invariants passed
$ python -m unittest discover -s scripts/tests -t . → 164 tests, OK

The 47th unit was promoted from PROVED_SCOPE after the adversarial
needle-reuse finding was resolved by STRUCTURAL identity rather than text:
`scripts/ci/resolve_gift_needle_ambiguity.py` re-extracted both pinned articles
and confirmed two distinct queue ids for art. 21-5 and art. 21-11-2, then
cleared the text-only ambiguity from the durable state with an H/T/D/C/U trail.
This does not weaken the finding — text-only identification is still invalid;
the unit is identified by article/paragraph/sentence position and source hash.
```

The 48th unit is 昭和二十二年法律第百七十五号 art. 2(1): 「合計所得金額が
五百万円以下であるとき」 (`NORM|89a8b5e3…`). It has an independent spec
restating the non-strict threshold as `¬(5M < income)`, a universal agreement
theorem over all `Nat` (no finite grid), kernel-decided boundaries
4,999,999 / 5,000,000 / 5,000,001, a Lean-independent source audit (D=PASS,
五百万円 → 5,000,000), and an H/T/D/C/U adversarial review recording the
inclusive-vs-strict competing reading and the out-of-scope applicability
conditions. Its agreement theorem uses Lean's standard `propext`; the boundary
theorems are axiom-free.

The 49th unit is the same article's strict-exceedance band,
`NORM|2a1dc80c…`: 「合計所得金額が七百五十万円を超えるとき」. Independent spec
(`¬(income ≤ 7.5M)`) vs implementation (strict `<`), universal agreement over
all `Nat`, kernel boundaries 7,499,999 / 7,500,000 / 7,500,001, source audit
D=PASS with 七百五十万円 → 7,500,000, and H/T/D/C/U review of the strict-vs-
inclusive competing reading. It is a distinct unit id from the ≤7.5M band.

The 50th unit is 相続税法 art. 16 appendix-table band
`NORM|93b274d3…`: 「千万円を超え三千万円以下の金額」 — a compound
strict-lower/inclusive-upper predicate with two pinned constants
(¥10,000,000 and ¥30,000,000). Independent spec, universal agreement over
all `Nat`, six kernel boundaries, source audit D=PASS, and H/T/D/C/U review
of the mixed strict/inclusive reading. The rate and other bands are not
modelled by this unit.

Scope work on this branch: `data/LOCAL_JURISDICTIONS.json` enumerates 1,965
local-government jurisdictions (47 prefectures, 792 cities, 194 wards, 743
towns, 189 villages) from the official 総務省 municipality-code PDF, with
explicit `NOT_ACQUIRED` status; ordinance text, revisions and proofs are NOT
acquired. `docs/SOURCE_LAYERS.md` now reports L2_ORDINANCE as
`ENUMERATED_NOT_ACQUIRED` (1,965), still separate from the statutory layer.

The 51st unit is 相続税法 art. 38(4) ただし書
`NORM|6c279214c…`: the compound exception requiring BOTH 延納税額 ≤ ¥1,000,000
AND 延納期間 ≤ 3 years. Money (yen) and duration (years) are typed as distinct
variables with recorded units; the spec is a Boolean negation of both strict
comparisons, agreement is universal over all Nat pairs, and boundaries for both
caps are kernel-decided. H/T/D/C/U review records the AND-vs-OR competing
reading and the dimension check.

So 51 evidence-backed units left NOT_STARTED on this branch; the
shared working tree, by contrast, was repeatedly reset to FULLY_VERIFIED=0 by
concurrent branch switches. This ledger is committed here so the gain is
durable. `docs/TASK_QUEUE.md` is regenerated with these counts.

Local full `lake build` was attempted but had to be stopped at 15/524 modules
under severe system load from concurrent agents; it is NOT claimed as a full
kernel build. The targeted builds that back the recorded evidence did succeed:

```
lake build JapanTaxLaw.GiftTaxSpec  → Build completed successfully (4 jobs)
lake build JapanTaxLaw.GiftTaxTests → Build completed successfully (4 jobs)
lake env lean gift_axioms.lean:
  giftTax_zero_below_deduction, giftPortionTax_zero, agreeGiftTax,
  spec_impl_basic_deduction_agree — each "does not depend on any axioms"
```

## Not claimed

- Whole-tax-law completion, legal correctness, or human legal review.
- Formalization of any discovered related statute.
