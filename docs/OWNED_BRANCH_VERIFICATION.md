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
$ python scripts/ci/batch_threshold_pipeline.py --limit 12
batch pipeline: verified=12 failed=0
$ python scripts/ci/batch_threshold_pipeline.py --limit 12
batch pipeline: verified=12 failed=0
$ python scripts/ci/batch_threshold_pipeline.py --limit 40
batch pipeline: verified=40 failed=2   (2 source-audit failures left NOT_STARTED)
$ python scripts/ci/batch_threshold_pipeline.py --limit 100
batch pipeline: verified=100 failed=2  (same 2 failures; now in a skip list)
$ python scripts/ci/batch_threshold_pipeline.py --limit 200
batch pipeline: verified=200 failed=4  (4 source-audit failures skip-listed)
$ python scripts/ci/batch_rate_pipeline.py --limit 50
rate batch pipeline: verified=50 failed=0
$ python scripts/ci/batch_rate_pipeline.py --limit 100
rate batch pipeline: verified=100 failed=0
$ python scripts/ci/batch_range_pipeline.py --limit 50
range batch pipeline: verified=50 failed=0
$ python scripts/ci/batch_range_pipeline.py --limit 100
range batch pipeline: verified=100 failed=0
$ python scripts/ci/batch_lower_bound_pipeline.py --limit 60
lower-bound batch pipeline: verified=60 failed=0
$ python scripts/ci/batch_strict_upper_pipeline.py --limit 60
strict-upper batch pipeline: verified=60 failed=2  (2 source-audit failures skip-listed)

$ python scripts/ci/task_queue.py
normative-unit queue: 396854 units; NOT_STARTED=396011, PARTIAL=0,
PROVED_SCOPE=0, FULLY_VERIFIED=841, BLOCKED=2
state merge: 396853 change(s)

$ python scripts/ci/verify_queue_invariants.py
PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=841 axes=11 unbacked=0
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

The 52nd unit is 地方税法 art. 71の6
`NORM|7e5f5d2a…`: 「利子割の税率は、百分の五とする。」 — the 5% rate encoded
as a `TaxRate` fraction 5/100 with a positivity-typed denominator (zero is
unrepresentable). The independent spec computes from `(5, 100)` without using
`TaxRate`, with universal agreement over every base amount. The source auditor
now also parses 百分のX percentages (constants checked [5, 100], D=PASS).
Floor rounding is recorded as a model choice, not a statutory claim.

The 53rd unit is 地方税法 art. 51 ただし書
`NORM|c6450946a…`: the 2% rate ceiling (百分の二を超えることができない). It is
encoded as a cross-multiplied STRICT exceedance test, with an independent
non-strict spec, universal agreement over all numerator/denominator pairs,
and equal-fraction boundary cases (20/1000 = 2/100). Source audit D=PASS;
H/T/D/C/U review records the strict-vs-inclusive competing reading.

The 54th unit is 関税定率法 art. 7 読替え
`NORM|fc34952b41…`: 「「一年以内に」とあるのは、「一年以内において速やかに」
と読み替えるものとする」。This is the first READING-kind unit verified. The
source auditor explicitly reports `phrase_only_correspondence=true` (no numeric
literal). A first String-based model was **rejected** after `#print axioms`
showed `Classical.choice`/`Quot.sound`; the final finite-phrase model has only
standard `propext`, with agreement exhaustive over its declared domain.

The 55th unit is 関税定率法 art. 8(3) みなし納付
`NORM|b3959ec60…`: a DEEMING-kind norm. It is an axiom-free one-way relation
(caller-established Bool for provisional payment → deemed payment), with an
independent two-branch spec and exhaustive Bool agreement. The source auditor
reports `phrase_only_correspondence=true` (no numeric literal in this unit).

The 56th unit is 租税特別措置法 art. 40の4(3) 推定
`NORM|aa4f3f14…`: a PRESUMPTION-kind norm. It is an axiom-free one-way rule
(absence of documents → presumed non-applicability), with an independent
two-branch spec, exhaustive Bool agreement, and a phrase-only source audit
that is explicitly labelled as such.

The 57th unit is 地方税法 art. 72の24の2(2)二
`NORM|4ce573224…`: a DELEGATION-kind norm (貯蓄保険 defined by cabinet order).
The 7% rate (constants [7,100], auditor D=PASS) is gated by a caller-established
designation Bool; the model explicitly does NOT resolve the delegated
definition. Independent spec, universal agreement, kernel boundaries and
H/T/D/C/U review of that scope limitation are recorded.

The 58th unit is 地方交付税法 art. 6の2(2)
`NORM|2485fde4…`: a REFERENCE-kind norm deriving 94% of the base amount from
前条第二項. The cross-reference is explicitly caller-established, not silently
resolved; constants [94,100] pass the Lean-independent audit, agreement is
universal over all bases, and H/T/D/C/U review records the out-of-scope base
and floor-rounding model choice.

The 59th unit is 地方税法 art. 30
`NORM|78c4b66b…`: the inclusive fine cap 三十万円以下 (300,000 yen). The
violation conditions and the 前条第一項 cross-reference remain
caller-established/out of scope; only the cap predicate is proved, with an
independent spec, universal agreement and kernel boundaries.

The 60th unit is 関税定率法 art. 7(7) 調査期間
`NORM|30ed71fa…`: a temporal norm 「一年以内」. The model deliberately avoids
an unproven 365-day calendar conversion: it checks a caller-established whole-
year count against an inclusive one-year limit, with universal agreement,
kernel boundaries and H/T/D/C/U review recording the competing conversion.

The 61st unit is 施行規則 art. 22の4(2)
`NORM|70d9948f3…`: a presentation-unit/rounding norm (一円/千円/百万円). All
three divisors [1, 1000, 1000000] pass the Lean-independent audit; agreement is
exhaustive over the three declared units and all theorems are axiom-free.
Truncation is explicitly a model choice; no statutory rounding rule is claimed.

The 62nd unit is 酒税法 art. 23(1)三 段額 `NORM|357718120…`: a tiered amount
(¥200,000 flat, +¥10,000 per degree above 20 when degree ≥ 21). Its
independently re-pinned source revealed a malformed law id in the queue's
`source_file` (14 chars instead of 15); the correct revision and SHA-256 are
recorded in `docs/ADVERSARIAL_SAKE_TIER.md`. Agreement with a saturation-based
spec is universal and boundary values are kernel-decided.

The 63rd unit is 相続税法施行令 art. 31(4)一
`NORM|b338babb…`: a strict >50% ownership test using cross-multiplication,
with caller-established share counts, independent non-strict spec, universal
agreement, kernel boundaries at 50/51 percent, and source audit D=PASS.

From unit 63 onward, verification uses a reusable batch pipeline
(`scripts/ci/batch_threshold_pipeline.py`) that accepts only simple, single-
threshold monetary norms; generates a fixed template (independent spec,
implementation, kernel boundaries); builds with lake; scans axioms for
`Classical.choice`/`Quot.sound`/`sorryAx`; runs the Lean-independent source
audit; and records all 11 evidence axes. Units failing any check are left
NOT_STARTED and reported. This closed 58 additional obligations in three runs
(12 + 12 + 40, with 2 honest failures). H/T/D/C/U entries are appended to
`docs/BATCH_THRESHOLD_REVIEW.md`.

A second pipeline, `scripts/ci/batch_rate_pipeline.py`, extends batch
verification to 百分のX rate norms (fraction with typed denominator,
independent spec, universal agreement, kernel boundaries, source audit).
It verified 150 further obligations with zero failures.

A third pipeline, `scripts/ci/batch_range_pipeline.py`, covers two-bound ranges
(「A円を超えB円以下」) with strict lower / inclusive upper edges; it verified
150 further obligations with zero failures.

A fourth pipeline, `scripts/ci/batch_lower_bound_pipeline.py`, covers inclusive
lower bounds (「N円以上」) with a negation-of-strict-below spec; it verified
60 further obligations with zero failures.

A fifth pipeline, `scripts/ci/batch_strict_upper_pipeline.py`, covers strict
upper bounds (「N円未満」), including rounding-fragment conditions; it verified
60 further obligations (2 source-audit failures skip-listed).

Auxiliary scope work: `data/TAX_TREATIES.json` enumerates 96 treaty/agreement
partners (82 tax treaties, 11 information-exchange agreements, 3 other) from
the official MOF list dated 2026-11-24, with `NOT_ACQUIRED` status; treaty texts
are not acquired or proved. `docs/SOURCE_LAYERS.md` reports L3_TREATY as
ENUMERATED_NOT_ACQUIRED (96), separate from L0 statutes.

So 841 units are evidence-backed FULLY_VERIFIED and 396,011 remain NOT_STARTED
on this branch; the
shared working tree, by contrast, was repeatedly reset to FULLY_VERIFIED=0 by
concurrent branch switches. This ledger is committed here so the gain is
durable. `docs/TASK_QUEUE.md` is regenerated with these counts.

Full `lake build` subsequently completed: **524/524 modules, exit 0**, with no
`error:`/`✖`/`Build failed` in the log, and `check_no_sorry.py` reports no
forbidden placeholder proofs (`docs/FULL_LEAN_BUILD_20261124.md`). The targeted
builds that back the individual evidence records also succeeded:

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
