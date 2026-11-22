# Independent adversarial review — 関税定率法 第七条(21)（準用）READING

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written outside the repo and deleted; no repository file
modified by the reviewer; no `lake build` run by reviewer.

Unit: NORM|bfcac1c4b65905e68d25b72571e490792faac1b89d59528e53f37f99f733fd64
Verbatim (injected from the authoritative queue task, not hand-typed):
「第八項及び第九項の規定は、第十九項の調査が開始された場合について準用する。」

## Verdict: CONCRETE FINDINGS (6) — all documentation/evidence-level; FIXED, confirming review pending

No H/T/C/U findings: the 準用-vs-読替え modeling is honest (cross-reference, not
string substitution), the `other` state is a reasonable extrapolation, and the
abstraction of substantive para 8/9/19 content is explicitly disclosed rather
than vacuous. All six findings were documentation/evidence-level and reproduced
and fixed:

1. **D1 — adversarial doc:3-4** said a pending-verdict placeholder with zero recorded
   findings (the only one of 77 `ADVERSARIAL_*.md` with this placeholder). Fixed
   by recording this verdict and findings.
2. **D2 — evidence:3747** had `"adversarial_review": "__ADVERSARIAL__"` placeholder.
   Fixed by recording the CONCRETE FINDINGS verdict (to be finalized to
   CONFIRMED_FIXED after confirming review).
3. **D3 — unit doc:22** cited the audit check with `…↔` (U+2026 U+2194) instead of
   the actual ` - ` separator. Fixed to the exact label
   `customs tariff art.7 reading application - CustomsTariffArt7ReadingApplication.lean`.
4. **D4 — spec doc comment:22** claimed `rfl`/`simp` "on decidable equality",
   contradicting the actual proof (no `simp`) and the file's own lines 36-37.
   Fixed to describe `cases` + constructor/`rfl`/`contradiction`, no
   `decide`/`simp`/`propext`.
5. **D5 — evidence:3739** wrote caption `相殺関税` without the authoritative
   fullwidth parens. Fixed to `（相殺関税）` (U+FF08/U+FF09) extracted from raw.
6. **D6 — impl:4 and unit doc:1** headers labeled the unit `（読替え・準用）` /
   `（準用・読替え）`; the norm is pure 準用. Fixed both to `（準用）`.

Because the impl and spec files changed, their hashes were recomputed
(impl `5da6d654…1b5e`, spec `58d24f01…f3f30`) and updated in the evidence ledger.

## Reviewer's core checks — all PASS

- SHA-256 of raw snapshot → `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` (match).
- Needle from queue: whole-law count 1; Article `Num=7`, `第七条`, `（相殺関税）`,
  Paragraph 21, Sentence 1 at stated source_path.
- Byte fidelity: impl:20, unit doc:10, adversarial doc, and audit `\u`-escaped
  needle all decode byte-identically to the queue text; no `ninth` anywhere.
- Law identity: 関税定率法 (NOT 関税法), 明治四十三年法律第五十四号, Act, real revision.
- Locator: `find_article_text(...,"第七条")` len 5989 with needle — article-kind honest.
- Proof/spec: `agree_applies_via_reading` uses `cases s <;> cases p`, `constructor`,
  `rfl`, `contradiction`, `rcases`; no `decide`/`simp`/`propext`. Axiom probe:
  "does not depend on any axioms"; global propext from unrelated units.
  `SpecApplies` representationally distinct and equivalent over all 2×2
  combos. No forbidden axioms/tokens in code.
- Audit/duplicates: check name English-only; `checks()` 327/327, 0 failures;
  no duplicate norm id/needle; evidence hashes matched on-disk pre-fix.

**U (non-blocking):** legal correctness remains `LEGAL_REVIEW_PENDING`.

## Closing

Six documentation findings fixed; confirming review pending before finalization.
No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.
