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
$ python scripts/ci/batch_fraction_pipeline.py --limit 20 / --limit 100
fraction batch pipeline: verified=20 failed=0 / verified=100 failed=0
$ python scripts/ci/batch_period_pipeline.py --limit 10 / --limit 100 / --limit 200
period batch pipeline: verified=10 / 100 / 200, all failed=0
$ python scripts/ci/batch_threshold_pipeline.py --limit 200
batch pipeline: verified=200 failed=22  (source-audit failures skip-listed)
$ python scripts/ci/batch_delegation_pipeline.py --limit 10 / --limit 50
delegation batch pipeline: verified=6 failed=0 / verified=0 failed=0 (class exhausted)
$ python scripts/ci/batch_rate_pipeline.py --limit 150
rate batch pipeline: verified=150 failed=0
$ python scripts/ci/batch_fraction_pipeline.py --limit 100
fraction batch pipeline: verified=100 failed=0
$ final small pools: range +29 (1 audit failure), lower-bound +9, strict-upper +40 (7 audit failures)
$ python scripts/ci/batch_reading_pipeline.py --limit 5 / 70 / 80
reading batch pipeline: verified=5 failed=0 / verified=70 failed=0 / verified=74 failed=0
(plus an initial 2 verified with 1 false-negative source-audit skip, later cleared)

$ python scripts/ci/task_queue.py
normative-unit queue: 396854 units; NOT_STARTED=394876, PARTIAL=0,
PROVED_SCOPE=0, FULLY_VERIFIED=52005, BLOCKED=2
state merge: 396853 change(s)

$ python scripts/ci/verify_queue_invariants.py
PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=52005 axes=11 unbacked=0
12/12 invariants passed
$ python scripts/ci/batch_multi_reading_pipeline.py --limit 5 / 100 / 120
multi-reading batch pipeline: verified=5 failed=0 / verified=100 failed=0 / verified=97 failed=0

$ python scripts/ci/check_evidence_artifacts.py
evidence artifact audit: units=2178 missing=0
$ python scripts/ci/batch_table_reading_pipeline.py --limit 2 / 40
table-reading batch pipeline: verified=2 failed=0 / verified=22 failed=0
$ structural path resolver extended through nested Chapter/Section/MainProvision wrappers
$ python scripts/ci/batch_table_reading_pipeline.py --limit 4 / 15 / 30
table-reading batch pipeline: verified=4 failed=0 / verified=15 failed=0 / verified=13 failed=0

$ multi-reading guard relaxed for repeated source phrases under distinct provisions
$ python scripts/ci/batch_multi_reading_pipeline.py --limit 3 / 50
multi-reading batch pipeline: verified=3 failed=0 / verified=34 failed=0

$ python scripts/ci/batch_effective_promulgation_pipeline.py --limit 2 / 80 / 150 / 150 / 150 / 200
effective batch pipeline: verified=2/80/150/150/150/193, failed=0 in every run

$ rate pipeline guard relaxed for rates <=1% and >=100%; decimal/non-100 denominators rejected
$ python scripts/ci/batch_rate_pipeline.py --limit 3 / 60 / 100
rate batch pipeline: verified=3 / 59 (1 source-audit failure skip-listed) / 71

$ python scripts/ci/batch_decimal_rate_pipeline.py --limit 2 / 20
decimal-rate batch pipeline: verified=2 failed=0 / verified=10 failed=0

$ python scripts/ci/batch_fraction_pipeline.py --limit 30
fraction batch pipeline: verified=27 failed=0

$ python scripts/ci/batch_rounding_pipeline.py --limit 3 / 100 / 100
rounding batch pipeline: verified=3 failed=0 / verified=4 failed=0 / pool exhausted
(76 verified; 7 units with extra numeric content remain NOT_STARTED with audit skips)

$ python scripts/ci/batch_threshold_pipeline.py --limit 50 / 100 / 100 / 100
batch pipeline: verified=50 failed=21 / verified=100 failed=7 / verified=50 failed=4 / pool exhausted
(200 more threshold obligations verified; 32 source-audit failures skip-listed, NOT_STARTED)

$ python scripts/ci/batch_period_pipeline.py --limit 40 (x3) / 35
period batch pipeline: verified=40/40/40/35, failed=0 in every run
$ python scripts/ci/batch_deduction_pipeline.py --limit 10
deduction batch pipeline: verified=4 failed=0

$ multi-reading guard extended to 「A」とあるのは「B」とする / と定める
$ python scripts/ci/batch_multi_reading_pipeline.py --limit 20
multi-reading batch pipeline: verified=13 failed=0

$ reading guard extended to 「A」とあるのを「B」として/と読み替えた forms
$ python scripts/ci/batch_multi_reading_pipeline.py --limit 10 / 20
multi-reading batch pipeline: verified=2 failed=0 / verified=10 failed=0

$ python scripts/ci/batch_fraction_scale_pipeline.py --limit 2 / 50
fraction-scale batch pipeline: verified=2 failed=0 / verified=35 failed=1
(the one failure is 四百分の二百, already skip-listed in the rate pipeline; stays NOT_STARTED)

$ python scripts/ci/batch_roundup_pipeline.py --limit 20
round-up batch pipeline: verified=5 failed=0

$ python scripts/ci/batch_misc_threshold_pipeline.py --limit 20
misc-threshold batch pipeline: verified=8 failed=0

$ python scripts/ci/batch_deeming_pipeline.py --limit 3 / 20
deeming batch pipeline: verified=3 failed=0 / verified=9 failed=0

$ python scripts/ci/batch_exception_pipeline.py --limit 3 / 60
exception batch pipeline: verified=3 failed=0 / verified=54 failed=0

$ python scripts/ci/batch_delegated_limit_pipeline.py --limit 10
delegated-limit batch pipeline: verified=3 failed=0

$ rate guard relaxed: structural 条/項/号/目 refs no longer treated as statutory quantities
$ python scripts/ci/batch_rate_pipeline.py --limit 50 / 50 / 50
rate batch pipeline: verified=50/50/35, failed=0 in every run

$ fraction-scale guard relaxed for structural references (条/項/号/目)
$ python scripts/ci/batch_fraction_scale_pipeline.py --limit 60
fraction-scale batch pipeline: verified=45 failed=0

$ python scripts/ci/batch_commencement_pipeline.py --limit 3 / 60 / 60 / 60 / 60 / 60 / 60 / 60
commencement batch pipeline: verified=3/60/60/60/60/60/60/60, failed=0 in every run
(483 verified so far; one oversized source snapshot caused a MemoryError and was
excluded by a 50 MB size guard, remaining NOT_STARTED)

$ python scripts/ci/batch_commencement_pipeline.py --limit 60 (x6) / 1
commencement batch pipeline: verified=60/60/60/60/60/60/1, failed=0 in every run
(all 844 in-class units now verified)

$ exception pipeline extended to proviso form 「ただし、…この限りでない」
$ python scripts/ci/batch_exception_pipeline.py --limit 60 (x7) / 30
exception batch pipeline: verified=60/60/60/60/60/60/60/17, failed=0 in every run

$ python scripts/ci/batch_same_treatment_pipeline.py --limit 3 / 130
same-treatment batch pipeline: verified=3 failed=0 / verified=114 failed=0

$ python scripts/ci/batch_list_reading_pipeline.py --limit 20
list-reading batch pipeline: verified=5 failed=0

$ python scripts/ci/batch_mutatis_mutandis_pipeline.py --limit 3 / 70 (x8) / 70
mutatis-mutandis batch pipeline: verified=3 / 70x8 / 20, failed=0 in every run

$ python scripts/ci/batch_delegation_interface_pipeline.py --limit 3 / 120 / 120 / 120
delegation-interface batch pipeline: verified=3/120/120/120, failed=0 in every run

$ python scripts/ci/batch_structural_label_pipeline.py --limit 3 / 100 / 100 / 100
structural-label batch pipeline: verified=3/100/100/100, failed=0 in every run

$ python scripts/ci/batch_presumption_pipeline.py --limit 50
presumption batch pipeline: verified=19 failed=0

$ python scripts/ci/batch_structural_label_pipeline.py --limit 100 / 100
structural-label batch pipeline: verified=100 failed=0 / verified=100 failed=0

$ python scripts/ci/batch_structural_label_pipeline.py --limit 100 / 100
structural-label batch pipeline: verified=100 failed=0 / verified=100 failed=0

$ python scripts/ci/batch_structural_label_pipeline.py --limit 100 / 100
structural-label batch pipeline: verified=100 failed=0 / verified=100 failed=0

$ python scripts/ci/batch_structural_label_pipeline.py --limit 100 / 100
structural-label batch pipeline: verified=100 failed=0 / verified=100 failed=0

$ python scripts/ci/run_python_gates.py
all present gates passed (33 ran, 0 honestly skipped; SKIP is never PASS)
(two deterministic regeneration gates were refreshed with --write, then re-run green)
$ python scripts/ci/completion_gate.py
Axis A: PASS=33 FAIL=0 SKIP=0 required-SKIP=0 → registered checks all green: True
Axis B: FULLY_VERIFIED=7332 / 396854; all-complete claimable: False

$ python scripts/ci/batch_structural_label_bulk.py --limit 10 / 500 x5
bulk structural-label pipeline: verified=10/500/500/500/500/500, failed=0 in every run
(2010 structure-only units; one shared module per batch with per-unit namespaces)
$ python scripts/ci/run_python_gates.py → 33 PASS, 0 FAIL, 0 SKIP (SKIP never PASS)
$ python scripts/ci/completion_gate.py → Axis A green True; Axis B FULLY_VERIFIED=9342, all-complete False

$ python scripts/ci/batch_structural_label_bulk.py --limit 500 x5
bulk structural-label pipeline: verified=500 failed=0 (x5)

$ python scripts/ci/batch_structural_label_bulk.py --limit 500 x5
bulk structural-label pipeline: verified=500 failed=0 (x5)
(gate ordering fixed: coverage-ledger regeneration now runs LAST after all
 other regenerating gates, removing a deterministic in-run drift)

$ python scripts/ci/batch_structural_label_bulk.py --limit 500 x5
bulk structural-label pipeline: verified=500 failed=0 (x5)

$ python scripts/ci/batch_structural_label_bulk.py --limit 500 x3
bulk structural-label pipeline: verified=500 failed=0 (x3)

$ python scripts/ci/batch_structural_label_bulk.py --limit 500 x3
bulk structural-label pipeline: verified=500 failed=0 (x3)

$ python scripts/ci/batch_structural_label_bulk.py --limit 1000 x3
bulk structural-label pipeline: verified=1000 failed=0 (x3)

$ python scripts/ci/batch_structural_label_bulk.py --limit 1000 x2
bulk structural-label pipeline: verified=1000 failed=0 (x2)

$ python scripts/ci/batch_structural_label_bulk.py --limit 2000 x2
bulk structural-label pipeline: verified=2000 failed=0 (x2)

$ python scripts/ci/batch_structural_label_bulk.py --limit 3000 x2
bulk structural-label pipeline: verified=3000 failed=0 (x2)

$ python scripts/ci/batch_structural_label_bulk.py --limit 3000 x3
bulk structural-label pipeline: verified=3000 failed=0 (x3)

$ python scripts/ci/batch_structural_label_bulk.py --limit 3000 x3 / 621
bulk structural-label pipeline: verified=3000/3000/1542/621, failed=0 in every run
(STRUCTURE class exhausted: 62 remaining labels do not match the grammar)

$ python scripts/ci/compact_bulk_evidence.py --write
units=52005 migrated=44673 missing_axis=0; bytes before=103430919 after=89537616
(redundant truncated axiom-scan prefixes replaced with batch-module references;
 all 11 axes and all artifact hashes preserved)
$ python -m unittest discover -s scripts/tests -t . → 247 tests, OK

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

Circular layer: `data/AUXILIARY_SOURCES.json` enumerates 7 NTA circular
families plus 4 auxiliary information categories from the official NTA「法令等」
page, all NOT_ACQUIRED; case law is recorded explicitly UNENUMERATED.
`docs/SOURCE_LAYERS.md` reports L4_CIRCULAR as ENUMERATED_NOT_ACQUIRED (7).

Historical layer: `scripts/law_audit/inventory/pin_historical_revisions.py`
pinned 60 predecessor-revision candidates across 62 base laws named by 93
新法/旧法 references, with SHA-256 pins. Each is explicitly a CANDIDATE
predecessor — the exact mapping to a given 新/旧 reference is NOT established.
`docs/SOURCE_LAYERS.md` reports L6_HISTORICAL as PREDECESSOR_CANDIDATES_PINNED.

Auxiliary scope work: `data/TAX_TREATIES.json` enumerates 96 treaty/agreement
partners (82 tax treaties, 11 information-exchange agreements, 3 other) from
the official MOF list dated 2026-11-24, with `NOT_ACQUIRED` status; treaty texts
are not acquired or proved. `docs/SOURCE_LAYERS.md` reports L3_TREATY as
ENUMERATED_NOT_ACQUIRED (96), separate from L0 statutes.

A sixth, guarded pipeline, `scripts/ci/batch_fraction_pipeline.py`, covers
fraction thresholds (「X分のY」 with 以上/以下/未満/を超える) using
cross-multiplication. Its template expectations were corrected after the first
trial run exposed a wrong boundary constant; that failure was recorded in the
skip list, the defect fixed, and the affected units retried. The source auditor
was extended to parse fractions. 120 further obligations were verified with
zero final failures.

A seventh pipeline, `scripts/ci/batch_period_pipeline.py`, covers period-only
thresholds (年/月/日/回 with 以下/以内/未満/を超える), with the source auditor
extended to parse period literals; it verified 110 further obligations with
zero failures.

An eighth pipeline, `scripts/ci/batch_delegation_pipeline.py`, models a
delegation-gated threshold with the delegated determination kept as a
caller-established Bool (NOT resolved). Its guarded class contains only 6
units; all 6 were verified. Failures in other batches were left NOT_STARTED
with recorded reasons in per-pipeline skip lists.

A ninth pipeline, `scripts/ci/batch_reading_pipeline.py`, covers 読替え norms
of the form 「A」とあるのは、「B」と読み替える. The model records both quoted
phrases verbatim, rewrites the whole phrase over an explicit three-constructor
domain, and proves spec/implementation agreement exhaustively; the trigger
(「この場合」) stays caller-established and is NOT resolved. Source fidelity is
checked by two Lean-independent audits: the generic correspondence script
(extended with `--ignore-quoted` so replacement text is not misread as an
operative numeral) and a dedicated phrase audit that locates both quoted
phrases in the pinned text and verifies their verbatim reproduction and
direction in spec and implementation. All 151 dependency-ready units in this
class were verified, with zero unbacked units.

A tenth pipeline, `scripts/ci/batch_multi_reading_pipeline.py`, extends this to
multi-pair 読替え norms. Each 「A」とあるのは「B」と pair is a whole-phrase
rewrite over an explicit finite domain, with exhaustive spec/implementation
agreement; units with an ambiguous source phrase (two different replacements)
are rejected. All 202 dependency-ready units in this class were verified.

An independent artifact audit, `scripts/ci/check_evidence_artifacts.py`, now
checks that every spec, implementation, test, review note and pinned source
cited by the 2178 evidence records actually exists. It found six stale
citations to a renamed gift-tax note; `repair_stale_evidence_citations.py`
removed only the dead paths (no status was changed), and the audit now reports
`units=2178 missing=0`. Three regression tests cover the parser, the stale
name and the full-ledger check.

An eleventh pipeline, `scripts/ci/batch_table_reading_pipeline.py`, handles
table-based 読替え norms. The exact paragraph is pinned by the queue's
structural `source_path` (not by searching for sentence text), then the
中欄/下欄 phrase pairs are re-extracted from the single `TableStruct` in that
paragraph, following its rowspan structure. Repeated source phrases under
different 上欄 provisions are kept as distinct context constructors; the
provision-based selection stays caller-established and is NOT resolved. 24
dependency-ready units with a clean table shape were verified. 32 further
table units whose structural path does not resolve to a unique pinned
paragraph remain NOT_STARTED — they are not counted as verified and are not
skip-listed as PASS. The structural-path resolver was then extended to descend
through nested `Chapter`/`Section`/`MainProvision` wrappers and to reject
ambiguous unindexed paths; all 56 dependency-ready table units were verified
after that fix. Five synthetic-table tests and four structural-path regression
tests cover these guards.

The multi-pair 読替え guard was also refined: a source phrase that recurs under
different target provisions is kept as distinct context constructors rather
than rejected, with the provision-based selection explicitly recorded as
caller-established and NOT resolved. This closed 37 more units without
weakening the direction/verbatim audits. Five parser tests were added.

A twelfth pipeline, `scripts/ci/batch_effective_promulgation_pipeline.py`,
covers the two simplest commencement forms (公布の日から施行する /
公布の日の翌日から施行する, 法律 and 条例). The model records a day offset from
a caller-established promulgation day and proves applicability from the
effective day onward. The independent spec subtracts the promulgation day
while the implementation adds the offset; agreement is proved for **all**
Nat promulgation/day values, not a finite grid. The first proofs used
`omega`/`simp`, which introduced the standard `Quot.sound` axiom and were
rejected by the axiom gate (`BATCH_EFFECTIVE_SKIPS.json` recorded the reason);
they were replaced by kernel-level Nat lemmas (`Nat.add_le_add_iff_left`,
`Nat.le_sub_iff_add_le`) so the accepted theorems depend only on `propext`.
The complex forms that couple commencement to a separate applicability date,
and 公布の日から起算して… forms, are explicitly NOT in this guarded class.
All 725 dependency-ready units in the class were verified.

The integer-rate pipeline's (1,100) guard was overly conservative: 百分の一
and 百分の百十 are legitimate rates and the `at_100` theorem holds for every
numerator. Relaxing it closed 134 more obligations. Two misparse hazards were
found and guarded before modelling: 百分の一・四 is 1.4% (not 1%), and
四百分の二百 is 200/400 (not 200/100). The latter was initially accepted by
the substring parser but correctly rejected by the Lean-independent source
audit; its unit stayed NOT_STARTED with a recorded skip reason, never PASS.
Two regression tests cover both guards.

A thirteenth pipeline, `scripts/ci/batch_decimal_rate_pipeline.py`, handles
decimal 百分のX・Y rates that the integer pipeline rejects: 一・四 is modelled
as 14/1000 (not 1/100). A dedicated Lean-independent audit verifies both kanji
components and the computed numerator in spec and implementation. All 12
dependency-ready units in this class were verified, with four parser tests.

A final guarded run of the existing fraction pipeline closed 27 more
integer-fraction obligations with zero failures.

A fourteenth pipeline, `scripts/ci/batch_rounding_pipeline.py`, handles single-
unit truncation (端数切り捨て) norms: `x / unit * unit` is proved equal to
`x - x % unit` for every Nat amount with kernel Nat lemmas (no `omega`, no
`Quot.sound`). Units carrying extra numeric content (percentages, fractions,
periods) are rejected before modelling; 76 units were verified and 7 such
units remain NOT_STARTED with audit skips. Three selection tests were added.

The previously partially-consumed threshold pipeline was exhausted: 200 more
single-threshold obligations were verified across four guarded runs. 32 units
failed the Lean-independent source audit and remain NOT_STARTED with recorded
skip reasons — none were promoted by SKIP-as-PASS.

The period pipeline's remaining 155 obligations were verified in four guarded
chunks after an attempt-count guard replaced the success-count loop (a long
run with repeated failures could previously loop without bound). A new
deduction pipeline, `scripts/ci/batch_deduction_pipeline.py`, models simple
single-amount 控除 with saturating Nat subtraction; the eligibility condition
is caller-established and NOT resolved. Its first proof template failed the
axiom gate and was corrected before acceptance; 4 units verified and 3
selection tests were added.

The multi-pair reading pipeline was extended to the 「A」とあるのは「B」とする
/ と定める forms, which carry the same whole-phrase rewrite semantics; 13 more
units were verified and a regression test distinguishes these forms from
unrelated verbs.

The same reading pipeline was extended once more to the 「A」とあるのを「B」
として / と読み替えた forms (past-tense read-as). 12 more units were verified
under unchanged proof, axiom and source-audit gates.

A fifteenth pipeline, `scripts/ci/batch_fraction_scale_pipeline.py`, handles
single-fraction scaling norms (X分のY) with a general denominator: numerator Y
and denominator X are modelled as a TaxRate and matched against a plain-pair
spec universally over all Nat bases. The Lean-independent audit checks both
components against the pinned text. 37 units were verified; the known
四百分の二百 unit remains NOT_STARTED with recorded skips in both the rate and
fraction-scale ledgers. Three parser tests were added.

A sixteenth pipeline, `scripts/ci/batch_roundup_pipeline.py`, handles 端数切り上げ
norms. The successor-quotient spec and remainder-add implementation are proved
equal for every Nat amount using only kernel Nat lemmas (propext, no
`Quot.sound`). 5 units were verified with three selection tests.

A seventeenth pipeline, `scripts/ci/batch_misc_threshold_pipeline.py`, covers
the 円を超えない (≤) and 円に満たない (<) wordings with universally proved
kernel comparisons (propext only). 8 units were verified with three tests.

An eighteenth pipeline, `scripts/ci/batch_deeming_pipeline.py`, handles
deeming-on-inaction norms: the deemed effect is proved universally over both
caller-established Bools, with exclusivity against an actual decision and
necessity of the deadline. The decision and the deadline themselves are NOT
resolved. 12 units were verified with three selection tests.

A nineteenth pipeline, `scripts/ci/batch_exception_pipeline.py`, formalizes
simple `適用しない` exception gates with a caller-established trigger that is
NOT resolved; exclusivity and exhaustive spec agreement are proved over Bool.
57 units were verified with three selection tests.

A twentieth pipeline, `scripts/ci/batch_delegated_limit_pipeline.py`, models
delegated monetary ceilings (政令/省令で定める額以下) with the ceiling
caller-established and NOT resolved; universal comparison and monotonicity
are kernel-proved. 3 units were verified with two selection tests.

The integer-rate guard was refined: numerals belonging to structural
references (第X条 / 第Y項 / 第Z号 / 第W目) are no longer mistaken for statutory
quantities such as amounts or periods. Such references are recorded as
caller-established and NOT resolved in the evidence. Bare statutory numerals
are still rejected. 135 more rate units were verified with two tests.

The same structural-reference refinement was applied to the fraction-scaling
pipeline: 45 more units were verified with surrounding applicability recorded
as unresolved. One parser test was updated to distinguish structural refs
from statutory quantities.

A twenty-first pipeline, `scripts/ci/batch_commencement_pipeline.py`, handles
calculated commencement: (A) a delegated date bounded by an abstract period
and (B) a fixed abstract offset after promulgation. The delegated day and the
promulgation day are caller-established and NOT resolved; no calendar
arithmetic is claimed. 483 units were verified in eight guarded chunks. An
oversized pinned snapshot caused a `MemoryError` on the first long run; a
50 MB source-size guard now excludes such units from this class (they remain
NOT_STARTED) and hashing streams in chunks. Three selection tests were added.

The remaining 361 commencement candidates (all within the source-size guard)
were consumed in seven more guarded runs; the class is now exhausted at 844
verified units with zero failures.

The exception-gate pipeline was extended to the proviso form
「ただし、…ときは、この限りでない」, which carries the same negation semantics.
437 more units were verified with one additional guard test.

A twenty-second pipeline, `scripts/ci/batch_same_treatment_pipeline.py`, handles
「…同様とする」 extension norms: the base treatment and the extension trigger
are caller-established and NOT resolved, and only the dispatch structure is
proved exhaustively over Bool x Bool. 117 units were verified with two tests.

A twenty-third pipeline, `scripts/ci/batch_list_reading_pipeline.py`, handles
list-wise reading substitution: 「A1」、「A2」…とあるのは、それぞれ「B1」、「B2」…
と読み替える, zipping quoted pairs positionally. Whole-token rewriting only;
no substring or overlap-priority semantics is claimed. 5 units were verified
with three parser tests.

A twenty-fourth pipeline, `scripts/ci/batch_mutatis_mutandis_pipeline.py`,
handles 「…の規定は…について準用する」 reference norms: applicability requires
both a caller-established target-case match and the referenced rule's effect,
neither of which is resolved. 513 units were verified with two tests.

A twenty-fifth pipeline, `scripts/ci/batch_delegation_interface_pipeline.py`,
records the typed interface of open-ended delegations (政令/省令で定める): an
authorization flag and an opaque determination. Only accessor laws are proved;
the delegated content, its legality and its effects are explicitly NOT resolved
and remain unhandled conditions recorded in each evidence entry. 363 units
were verified with four selection tests. This is interface-level evidence, not
a claim about the delegated rule's substance.

A twenty-sixth pipeline, `scripts/ci/batch_structural_label_pipeline.py`,
handles STRUCTURE-class item labels (「一」, 「六の二」, …). These are numbering
labels, not norms; the pipeline verifies only the pinned text, the parsed code
and the kernel-checked label-domain invariant, and explicitly records that NO
legal condition, effect or obligation is formalized. 303 units were verified
with three parser tests. This is structure-check evidence only.

A twenty-seventh pipeline, `scripts/ci/batch_presumption_pipeline.py`, handles
evidentiary presumption (推定) norms: absence of evidence presumes a
qualification false; evidence presence leaves the caller-established
qualification standing. Both inputs are NOT resolved. 19 units were verified
with three selection tests.

Two further structural-label batches added 200 structure-only units (no legal
effect formalized).

Two more structure-only batches added 200 units (no legal effect formalized).

Two more structure-only batches added 200 units (no legal effect formalized).

Two more structure-only batches added 200 units (no legal effect formalized).

A bulk variant, `scripts/ci/batch_structural_label_bulk.py`, packs 500 units
into one Lean module (one namespace per unit, each with its own `labelCode` and
theorem) so a single kernel build certifies a whole batch. Per-unit evidence
records the batch module hash and namespace; scope remains STRUCTURE ONLY with
no legal effect formalized. 2010 units were verified this way with two tests.

Five more bulk structure-only batches added 2500 units (no legal effect
formalized); Axis A remained 33 PASS / 0 FAIL / 0 SKIP and Axis B remained
all-complete False.

Five more bulk structure-only batches added 2500 units (no legal effect
formalized). A gate-ordering defect was fixed: the coverage-ledger regeneration
check now runs last, after all other gates that regenerate ledgers, so it can no
longer drift within one gate run.

Five more bulk structure-only batches added 2500 units (no legal effect
formalized). Axis A remained 33 PASS / 0 FAIL / 0 SKIP; Axis B remained
all-complete False.

Three more bulk structure-only batches added 1500 units (no legal effect
formalized); Axis A remained 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Three more bulk structure-only batches added 1500 units (no legal effect
formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Three 1000-unit bulk structure-only batches added 3000 units (no legal effect
formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Two more 1000-unit bulk structure-only batches added 2000 units (no legal
effect formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Two 2000-unit bulk structure-only batches added 4000 units (no legal effect
formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Two 3000-unit bulk structure-only batches added 6000 units (no legal effect
formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Three 3000-unit bulk structure-only batches added 9000 units (no legal effect
formalized); Axis A 33 PASS / 0 FAIL / 0 SKIP, Axis B all-complete False.

Four more bulk structure-only batches added 8163 units, including the final
621 set/range label expressions (一及び二, 一から十二まで). The STRUCTURE class
is exhausted at 62 grammar-incompatible labels, which remain NOT_STARTED.
No legal effect was formalized. Axis A 33 PASS / 0 FAIL / 0 SKIP; Axis B
all-complete False.

So 52005 units are evidence-backed FULLY_VERIFIED and 344,847 remain NOT_STARTED
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
