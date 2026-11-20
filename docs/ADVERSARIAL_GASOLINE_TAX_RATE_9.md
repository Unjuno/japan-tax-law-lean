# Independent adversarial review — 揮発油税法 art. 9 unit

Reviewer: an independent agent session (no shared working context with the
author). Read-only; no files were edited by the reviewer. Fixes below were
applied by the author afterwards. The reviewer could not run some shell checks
in its environment; the author supplied the executed reproductions.

## F-1 Needle uniqueness / article localization — PASS (author reproduction)

- **H:** needle might occur more than once or outside 第九条.
- **T (reviewer):** audit 173/173 PASS; `find_article_text` is MainProvision-confined
  with exact title equality (important because 附則 also contains 第九条 articles).
- **T (author):** full-file count of 「揮発油税の税率は、揮発油一キロリットルにつき二万四千三百円とする。」
  = **1**; 「二万四千三百円」 = **1**; both in MainProvision 第九条. Needle includes terminal 「。」.
- **D: PASS.**
- **C:** `contains()` only tests substring presence; uniqueness is checked by the
  author's separate reproduction, not by the audit gate itself.
- **U:** none.

## F-2 Independent spec / universal induction — PASS

Recursive repeated addition vs multiplication; `agree_gasoline_tax` is induction
over all `Nat`. Finite Bool explicitly labelled a smoke check.
**D: PASS.** Reviewer did not re-run Lean; author ran `lake build` (569 jobs).

## F-3 No sorry/admit/axiom — PASS

Full read found none. Author additionally ran `check_no_sorry.py` and the axiom
probe: `propext` only for the induction theorem, all others axiom-free, no
`sorryAx`/`Classical.choice`.

## F-4 Scope citations — reviewer UNVERIFIED; author verified, then tightened

- **H:** grouped captions (第十条/第十一条「申告」, 第十四条〜第十六条「免除」)
  might hide a fabricated caption.
- **T (author):** dumped every MainProvision ArticleTitle from the pinned JSON
  (18 articles). Actual captions: 第三条（納税義務者）, 第八条（課税標準）,
  第十条（移出に係る揮発油についての課税標準及び税額の申告）,
  第十一条（引取りに係る揮発油についての課税標準及び税額の申告等）,
  第十四条（未納税移出）, 第十五条（輸出免税）,
  第十六条（移出に係る灯油の免税）,
  第十七条（戻入れの場合の揮発油税の控除等）, 第十八条（保全担保）.
- **D:** all claims were accurate; **fix applied** — grouped labels replaced with
  individual exact captions so no future reader must reconstruct the grouping.
- **C:** grouping was a shorthand, not a fabrication.
- **U:** reviewer could not complete its own dump due to shell restrictions.

## F-5 Cross-law theorem and caption defect — FIXED

- **H:** sum is a legal combined rate; caption matches 243,000.
- **D:** arithmetic PASS (24,300 + 4,400 = 28,700, kernel `decide`).
  **Defect found:** `rate_not_scaled` was documented as rejecting 二十四万円
  (=240,000) but checks 243,000 = 二十四万三千円. **Fixed** the caption.
  **Softened** cross-law commentary: the theorem is a RATE-SUM of two pinned
  statutory constants, NOT a modelled tax liability (quantity, exemptions,
  collection out of scope).
- **C:** both taxes apply to gasoline, so the rate-sum is meaningful, but it
  is not a liability claim.

## F-6 Pin correctness — author verified

sha256 `e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a`
recomputed from the pinned file; matches Lean header and INVENTORY (uppercase
in inventory). Source path `LawBody[3]/MainProvision/…/Article:9` confirmed.
**D: PASS.**

## Verdict

One concrete defect (mis-caption 二十四万円 vs 二十四万三千円) and one overclaim
risk (rate-sum vs liability) were fixed. Scope citations were independently
dumped and tightened; needle uniqueness and pin hash were reproduced by the
author. No claim of legal correctness; human legal review remains pending.
