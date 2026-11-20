# Independent adversarial review — 航空機燃料税法 art. 11 unit

Reviewer: an independent agent session (no shared working context with the
author). All checks were read-only; no files were edited by the reviewer. The
fixes below were applied by the author after the findings were reported.

## Defect 1 — fabricated provision 「免税点」 (HIGH, fixed)

- **H:** The scope lists 免税点 as a distinct unmodelled provision of this Act.
- **T:** Full-text keyword count over the pinned JSON and grep across artifacts.
- **D: FAIL.** 免税点 occurs **0 times** in the pinned file. The real provisions
  are 第八条（非課税）, 第十条（課税標準）, 第十四条 / 第十五条（申告・納付）,
  and 附則 経過措置 (8 `SupplProvision` blocks).
- **C:** Loose shorthand for art. 8 非課税, but as written it named a
  non-existent norm.
- **U:** Whether art. 8 is legally a de-facto 免税点 is interpretive.
- **Fix:** replaced 免税点 with the exact article references in
  `AviationFuelTaxRate.lean`, `AviationFuelTaxRateSpec.lean` and the unit doc.

## Defect 2 — referenced review artifact missing, evidence empty (HIGH, fixed)

- **H:** The unit doc claimed findings were in a dedicated adversarial file.
- **T:** Glob over `docs/*ADVERSARIAL*AVIATION*`; read the evidence ledger.
- **D: FAIL.** No such file existed and `adversarial_review` was `""`.
- **C:** The file was intended to be produced by this review.
- **U:** None.
- **Fix:** this document records the review with H/T/D/C/U; the evidence axis
  is set only after the fixes were applied.

## Defect 3 — transcription needle omitted terminal 「。」 (MEDIUM, fixed)

- **H:** The audit checked the exact verbatim sentence.
- **T:** Read the check literal; `contains()` only does whitespace-normalized
  substring matching.
- **D: FAIL (minor).** The needle lacked the final 「。」 present in the pinned
  source and the Lean header, so the gate would not detect punctuation drift.
- **C:** The shorter string was copied from the doc's own T line.
- **U:** None.
- **Fix:** needle now includes 「。」; the full needle occurs exactly once in
  the pinned file, in 第十一条.

## Defect 4 — completion claims not reproducible by reviewer (MEDIUM, qualified)

- **H:** Kernel build and axiom probe succeeded.
- **T:** Reviewer could not run `lake`/`lean` in its environment; the queue
  entry it read was generated before evidence was added.
- **D: UNVERIFIED by reviewer.** The author did run `lake build` (533 jobs,
  success), the axiom probe (`propext` only, no `sorryAx`/`Classical.choice`),
  `check_no_sorry.py`, and transcription audit (162/162). The evidence entry
  explicitly marks these as LOCAL results, not CI-attested: GitHub API rate
  limit prevents PR/CI creation.
- **C:** Honest provisional local results pending CI.
- **U:** Cannot be independently rebuilt by the reviewer in its environment.
- **Fix:** queue regenerated after evidence was recorded; status now derives
  from that evidence. CI attestation remains an explicit open item.

## What survived challenge

- Needle `…とする。` and 「二万六千円」 each occur exactly once in the pinned
  file, in 第十一条; `find_article_text` is MainProvision-confined with exact
  title equality; audit reports 162/162 including the art. 11 check.
- Pin consistent: law id 347AC0000000007, revision
  347AC0000000007_20250601_504AC0000000068, sha256
  de83a01b558cca9d07af779b71416c9d15d5e62ecabfefcb00eb9e1cd18dbbde.
- `agree_aviation_fuel_tax` is genuine structural induction over all `Nat`;
  no `sorry`/`admit`/`axiom` declarations.
- Cross-law claim is honestly qualified ("no cross-law relation declared in
  art.11").

## Verdict

Two high-severity defects (fabricated 免税点, missing review artifact) and one
medium (weak needle) were reproduced and fixed. The completion-attestation
limitation is recorded, not concealed. No claim of legal correctness; human
legal review remains pending.
