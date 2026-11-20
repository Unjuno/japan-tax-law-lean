# Independent adversarial review — 地方揮発油税法 art. 4 unit

Reviewer: an independent agent session (no shared working context with the
author). All checks were read-only; no files were edited by the reviewer. The
fixes below were applied by the author after the findings were reported.

## Finding 1 — five fabricated scope citations (HIGH, fixed)

- **H:** The NOT MODELLED list named article titles that do not exist in the pinned law.
- **T:** Dumped every MainProvision ArticleTitle from the pinned JSON and compared each claim.
- **D: FAIL.** Actual captions: 第三条（課税標準）✓, 第五条（納税義務者）✓, but
  第六条 is （未納税移出等）not 免税点; 第七条 is （申告及び納付等）not
  課税標準の特例; 第八条 is （担保の提供）not 生産者の製造等;
  第九条 is （戻入れの場合の地方揮発油税の控除等）not 課税標準の特例;
  第十条 is （延滞税）not 徴収方法. 5 of 8 claims were wrong.
- **C:** Boilerplate copied from a different statute. Material because the real
  第七条 contains a rate-derived rule (納付額の二百八十七分の四十四) that the
  wrong label hid.
- **U:** Intent (copy error vs. boilerplate) unknown.
- **Fix:** all citations replaced with exact captions from the pinned law in
  `LocalGasolineTaxRate.lean`, `LocalGasolineTaxRateSpec.lean` and the unit doc;
  the 第七条 rate interaction is now explicitly named as unmodelled.

## Finding 2 — needle uniqueness / article localization: PASS

- **T:** whole-text needle count 1; 四千四百円 count 1; ten-fold errors 0.
  Single 第四条 under MainProvision; exact title equality; terminal 。 required.
- **D: PASS.**
- **C:** `contains()` normalizes whitespace but not punctuation — terminal 。 is real.
- **U:** None.

## Finding 3 — independent spec / universal induction: PASS

- **T:** multiplication vs primitive-recursive repeated addition; `induction kilolitres`
  over all Nat; finite Bool explicitly labelled a smoke check.
- **D: PASS.**
- **U:** Reviewer's environment had no `lean`/`lake`, so assessment was by inspection;
  the author did run `lake build` (566 jobs) and the axiom probe.

## Finding 4 — no sorry/admit/axiom: PASS

- **D: PASS** (only comment mentions).

## Finding 5 — pin correctness: PASS

- **T:** sha256 `c37f8a7…`, law id, revision, enforcement 2026-04-01, size 90853 all consistent.
- **D: PASS.**

## Finding 6 — transcription check locates 第四条 with terminal 。: PASS

- **T:** `find_article_text('第四条')` returns the sentence with 。; `contains` true;
  dispatch fails loudly for missing articles.
- **D: PASS.**

## Finding 7 — stale queue record (governance)

- **T:** reviewer read `build/task_queue.json` generated before evidence was added;
  status NOT_STARTED, artifacts empty.
- **C:** cadence mismatch between artifact creation and ledger regeneration.
- **D:** stale at review time. **Fix:** queue regenerated after evidence was
  recorded; status now derives from evidence.

## Verdict

All computation/transcription/proof claims survived challenge. One HIGH disclosure
defect (5 mis-cited provisions) was reproduced and fixed before the evidence flag
was set. No claim of legal correctness; human legal review remains pending.
