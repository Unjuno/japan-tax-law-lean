# Unit review — 相続税法 第一条の二 第6号（定義・例外）EXCEPTION

Normative unit id: `NORM|a272ba5227e609d49ff344bf1f6a7aee167ba66f8fba72b65dc48fca6e30bb39`

Law: 325AC0000000073 (相続税法, 昭和二十五年法律第七十三号), Act. SHA-256 `c01bb9be…75043a7`.

Verbatim source text: 「第三十三条の二の場合を除き、国税通則法第二十五条（決定）の規定による決定をいう。」 — a definition clause defining "決定" by reference to 国税通則法 art.25, **excluding** the case of art.33-2. Article numbers and the carve-out extracted programmatically from the needle.

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/Item#6/ItemSentence/Column#2/Sentence#1` — article flat length 350 with needle.

Norm kind: **EXCEPTION** — definition with an explicit carve-out and a resolved cross-law reference.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The 決定 concept applies outside 第三十三条の二; it is excluded in that case. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxDecisionException.lean. |
| D | PASS — transcription audit 454/454. |
| C | Only carve-out structure and referenced article numbers modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Cross-law dependencies
Both dependencies are **resolved by name with enforcement version** in the queue: 国税通則法 art. 第三十三条 and art. 第二十五条 — note the queue's `ARTICLE_RE` truncates 第三十三条の二 to 第三十三条 (a systematic parser limitation in normative_core.py, not a hand-typed value; the opcode needle itself preserves 第三十三条の二 verbatim) (enforcement 2026-11-01), `sufficient=true`. This satisfies the §1.6 dependency-resolution requirement — no bare 15-digit ID treated as resolved.

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxDecisionException.lean` — `CaseKind` (exceptedCase/other), Bool `isDecision` (carve-out), `referencedArticle=25`, `exceptedArticle=33`.
- Independent spec: `SpecDecision` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (cases / `And.intro`, no simp/propext).
- Build: full lake build success (1459 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Development failure records
1. Spec used `simp at h` — forbidden by the no-simp rule. Replaced with direct `cases h` on the reduced false equality.
2. Spec used nested `⟨fun h => by cases h, rfl, rfl⟩` which Lean parsed incorrectly. Replaced with explicit `And.intro`.
Both fixed; no gate weakened.

## Not modelled
Substantive content of 国税通則法 art.25/art.33-2, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_DECISION_EXCEPTION.md`.
