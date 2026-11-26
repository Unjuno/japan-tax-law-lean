# FULL-COVERAGE adversarial review — DecimalMultipliers: FAIL on 4 source spans

Auditor: independent general subagent (session ses_de8e9f3aaffelcWrDYlbdlkO4f).
Read-only, non-sampled audit over all 70 units in mult.json.
Not legal advice; not a completeness claim.

## Verdict: FAIL (4 of 70) — source-span contiguity, not a model error
All 70 records pass: pinned SHA-256 70/70, multiplier phrase verbatim in
normalized source 70/70, phrase in norm_fragment 70/70, independent Kanji
decimal re-parse with the correct direction (一・五 = 15/10) 70/70.
Lean: no forbidden proof tokens; `scaledAmount_agrees` intact.

Four records fail `norm_fragment` containment in the pinned full text because
the fragment is a **non-contiguous join** (decomposition artifact):
- `7398dc52…`: missing item marker 「二」 at the junction.
- `fcbb9f9f…`: missing item marker 「五」 at the junction.
- `018898c3…`: tail taken from a different passage.
- `e2f641c7…`: tail taken from a different passage.

The multiplier value/direction for these four is nevertheless correct.

## H/T/D/C/U
H = the reported span equals the pinned text at those offsets.
T = normalized-source substring check on all 70 units.
D = FAIL for the 4 spans; the other 66 pass all checks.
C = adjacent items in a table were concatenated by the sentence splitter,
dropping an item marker or splicing a tail from another article.
U = repair requires re-decomposition of those provisions with exact offsets;
not attempted here.

## Root cause (code inspection, not a legal conclusion)
`task_queue.py:_collect` deliberately skips `LABEL_TAGS` (ArticleTitle,
ItemTitle, Subitem1Title, ...), then `norm_decomposer.decompose` is applied to
the concatenation of the remaining text nodes. A unit that spans two such
nodes therefore has a `unit.text` that is not a contiguous substring of the
source's flattened text — exactly the observed missing 二/五 markers and
cross-passage tails. Including label tags would restore contiguity but would
change text and normative IDs for many units across the queue, so that broad
policy change is deliberately NOT made for these four cases. They remain
BLOCKED with the precise blocker rather than being silently reformatted.

## Action
The 4 units are BLOCKED with `SOURCE_SPAN_NONCONTIGUOUS_ADVERSARIAL` and receive
no ADVERSARIAL_REVIEW axis. The other 66 receive the full-coverage axis (their
SHA, phrase, direction and span all verified). No claim that the model is wrong
for the 4; the defect is in the decomposition's source span.
