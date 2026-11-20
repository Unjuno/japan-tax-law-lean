# Independent adversarial review — 関税定率法 art.14 item-17 exception

Reviewer: an independent agent session (no shared working context with the
author). Read-only; the reviewer verified the pinned JSON directly (full-file
counts, node paths, sha256), ran `transcription_audit.py` (174/174 PASS), and
confirmed the Lean `.olean`s. Fixes below were applied by the author.

## Finding 1 — statute mislabelled 関税法 (HIGH, fixed)

- **H:** this unit is 関税法 (Customs Law) art.14 item 17.
- **T:** `INVENTORY.json`: law `143AC0000000054` = **関税定率法**;
  関税法 is law `329AC0000000061`, whose art.14 is a completely different
  provision (期間制限) and contains no instance of the needle.
- **D: FAIL** on the human-facing name; the law id and pin were correct.
- **C:** task-queue label typo. "Fixing" it by switching law id would break
  the valid audit — the label, not the pin, was changed.
- **U:** none material.
- **Fix:** all labels renamed to 関税定率法 in the implementation, spec,
  transcription check, unit doc and evidence ledger.

## Finding 2 — false premise in review prompt (not a defect)

The prompt mistakenly mentioned law `143AC0000000055`; no such law exists in
the inventory. The check correctly pins `143AC0000000054`. No code change.

## Finding 3 — needle uniqueness / exact location: PASS

Full-file count 1; node path `Article 第十四条 / Paragraph 1 / Item 17 /
Sentence 2`; terminal 。 present; 二本以内 count 1. The audit scopes to the
article; item-17 placement was verified independently here and by the author's
raw-path walk. **D: PASS.**

## Finding 4 — spec independence / universal proof: PASS

`count ≤ 2` vs structural pattern match `0/1/2 → true; _+3 → false`.
`agree_exception_scope` does nested case analysis over all Nat plus `simp`
for the `n+3` case — not a finite enumeration. The finite list is explicitly
a smoke check. **D: PASS.**

## Finding 5 — pin fidelity / scope honesty: PASS

sha256 `924a01d3…986ae9c` recomputed and matches; revision and source path
match; the model is an item-count cap (unit 本), not a yen cap; the main
無条件免税 rule, other items and 政令 procedure are explicitly NOT MODELLED.
Minor C: `Money` (documented as yen) is reused as a Nat count — the author
added an explicit module-doc note that the unit is 本 and `2` is not ¥2.
**D: PASS.**

## Verdict

One concrete defect (statute name) was reproduced and fixed before the
evidence flag was set. Needle, pin, spec independence, universal proof and
item-count semantics all survived challenge. No claim of legal correctness;
human legal review remains pending.
