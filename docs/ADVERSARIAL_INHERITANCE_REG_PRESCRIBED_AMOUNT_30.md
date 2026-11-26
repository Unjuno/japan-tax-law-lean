# Independent adversarial review — 相続税法施行規則 art.30（百万円）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pin hash, located the needle by structural
walk, verified law identity (incl. 省令 vs 法律), and read the three Lean files.
No repository files were modified by the reviewer.

## Verdict: NO CONCRETE FINDINGS on the four audited files

All five assigned tasks PASS: correct source transcription, correct 省令 identity,
universal equivalence proof, sound degenerate-interval spec, correct boundaries,
passing pinned audit, no forbidden constructs. Three adjacent draft-artifact
issues were flagged (below) and fixed by the author before completion.

## Findings register (H/T/D/C/U) — all PASS

| ID | H (hypothesis) | T (test) | D |
|---|---|---|---|
| F1 | pin hash wrong | hashlib over raw bytes | PASS — `a4e46e6e…e35b552f` exact; size 443,929 = INVENTORY |
| F2 | needle absent/mislocated | recursive path walk | PASS — count 1 whole law; 第三十条 / Paragraph 3（ParagraphNum "３"）/ Sentence#1; verbatim via codepoint dump |
| F3 | wrong law / wrong type | INVENTORY + raw law_info/law_num | PASS — both 相続税法施行規則; law_num 昭和二十五年大蔵省令第十七号; `law_info.law_type = MinisterialOrdinance` — a 省令, not 法律 |
| F4 | spec circular / unsound | read Lean files | PASS — equality `a=1M` vs degenerate interval `[1M,1M]`; `agree_prescribed_amount` universal via subst + Nat.le_refl / Nat.le_antisymm; no sorry/admit/axiom/Classical.choice |
| F5 | boundary theorems unsound | inspect proofs | PASS — at_prescribed rfl; below/above `by decide` on closed Nat-equality goals (kernel reduction, sound) |

## Interpretive objections (C/U) — not findings

- **Amount fidelity:** 「…百万円とする」 = definitional amount-fixing → equality
  faithful. 百万円 = 1,000,000 ✓.
- **C (scope):** `isPrescribedAmount` is pure amount-identity, not an applicability
  rule. Consumers must not read it as modelling the 相続税法 art.59(1) proviso's
  conditions; those are explicitly NOT MODELLED (Impl:30-32, Spec:20-21).
- **C (taxonomy):** queue kind=EXCEPTION is a keyword artifact (「ただし書」),
  semantically a definitional amount clause — consistent with the repo's own
  classifier, not a Lean error.
- **U:** spec reuses `prescribedAmountYen` from the implementation, so it cannot
  detect a wrong constant; that is covered by the pinned transcription audit.

## Adjacent draft-artifact issues (FIXED by author)

- F1: adversarial doc did not exist when the PR body claimed it → this file created.
- F2: evidence ledger entry was not yet added → `_add_evidence17.py` applied.
- F3: unit doc mistranslated 大蔵省令 as "justice-department-ordinance" → corrected
  to "Ministry-of-Finance-ordinance".

## Closing

No soundness break, wrong pin, transcription error, circular proof, or law-label
error. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
