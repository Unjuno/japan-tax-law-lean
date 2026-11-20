# Independent adversarial review — 関税定率法 art.7(15) 読替え

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned JSON sha256, located the needle in
the raw tree, read the three Lean files and the transcription check, and
stressed the interpretation. No repository files were modified by the reviewer.

## Verdict: CONCRETE FINDINGS — all reproduced and fixed by the author

The reviewer found no soundness break, no wrong hash/pin, no transcription error,
and no forbidden constructs. It did find one real methodology defect and two
framing/scope issues, all addressed below before the evidence flag was set.

## Finding 1 — "independent spec" was a degenerate constant oracle (FIXED)

- **H (falsifiable):** `specReading` did not encode "original → substitute,
  else leave unchanged"; it returned `withinOneYearPromptly` in both branches,
  making `isOriginal` dead code and `agree_reading` a comparison of two constants.
- **T:** `CustomsReadingSubstitutionSpec.lean` defined
  `if isOriginal p then withinOneYearPromptly else withinOneYearPromptly` —
  both arms identical; `isOriginal` computed and ignored.
- **D: FAIL** against the genuine-independent-spec requirement.
- **C:** a 2-element domain makes a total function trivially determined, so a
  constant oracle still pins the implementation — but it does not independently
  re-derive the rewrite logic; it restates it.
- **U:** whether constant oracles are acceptable as specs. The author treats
  them as unacceptable here.
- **Fix:** the else branch now returns `p`
  (`if isOriginal p then withinOneYearPromptly else p`), so "leave unchanged" is
  real and `agree_reading` cross-checks both branches. Rebuild passed (5 jobs).

## Finding 2 — regime mislabel (NOT a repo defect)

- **H:** the unit was presented as the anti-dumping (反ダンピング関税) regime.
- **T:** the pinned JSON shows Article 7 caption （相殺関税） = countervailing
  duty; Article 6 is anti-dumping.
- **D:** the mislabel occurred only in the parent session's review prompt.
  A repository-wide grep of the Lean files and unit docs found **no** occurrence
  of `anti-dumping`/`反ダンピング`/`不当廉売`. No code/doc change needed.
- **C/U:** the two regimes are structurally parallel, which caused the confusion.

## Finding 3 — interpretive scope (scope caveat ADDED)

- 「一年以内において」 keeps the outer one-year bound; 「速やかに」 adds promptness —
  faithful to paragraph-7 main text (本文). The separate 6-month extension
  proviso is NOT part of the substituted string and is out of scope.
- **U:** a reader of `outerDeadlineMonths = 12` could wrongly infer a total
  12-month cap (statute permits up to 18 with extension).
- **Fix:** the module comment now states that `outerDeadlineMonths = 12` is a
  **main-text-only** value and the 6-month extension proviso is NOT MODELLED.

## Unchanged PASS items (no finding)

- sha256 `924a01d3…986ae9c` recomputed and matched; needle count 1, located in
  Article 7 / Paragraph 15 / Sentence 2, verbatim including terminal 「。」.
- CI check present and correct (`transcription_audit.py`); forbidden constructs
  absent; norm id consistent; boundary theorems correct; 2-constructor inductive
  sound; idempotent closure defensible and documented.

## Closing

One concrete methodology defect (degenerate spec) was reproduced and fixed
before the evidence flag was set. No claim of legal correctness; human legal
review remains `LEGAL_REVIEW_PENDING`.
