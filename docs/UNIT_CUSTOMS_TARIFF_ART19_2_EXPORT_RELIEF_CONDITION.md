# Unit review — 関税定率法 第十九条の二（ArticleCaption）CONDITION

Normative unit id: `NORM|94f8ac863c981996cb5c2c94d16ae32907d432241027cf14c7a43894887c873a`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「（課税原料品等による製品を輸出した場合の免税又は戻し税等）」 — this unit is the **article caption** (見出し) of 第十九条の二, labeling a CONDITION (exported products made from customs-duty raw materials) and two relief kinds (免税 / 戻し税, 等). The whole caption is the needle; sub-terms are extracted programmatically from it. NOTE: a caption is a heading, NOT the operative provisions — the substantive relief mechanics are NOT MODELLED.

Exact source position: `LawBody[1]/MainProvision/MainProvision[33]/Article:19_2/Article#19_2/ArticleCaption` — the needle IS the ArticleCaption. `find_article_text(...,"第十九条の二")` len 1574 with needle.

Norm kind: **CONDITION** — caption-level case/relief discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The export case with one of the two listed relief kinds is within the caption's condition; others are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt19_2ExportReliefCondition.lean. |
| D | PASS — transcription audit 436/436. |
| C | Only caption-level case/relief discrimination modeled; operative text and 等 extensions out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt19_2ExportReliefCondition.lean` — `ProductCase` (exportCase/other), `Relief` (exemption/drawback/otherRelief), Bool `withinCondition` (nested match), boundary theorems.
- Independent spec: `SpecWithinCondition` Prop predicate (case ∧ relief disjunction), representationally distinct from the Bool function; `agree_within_condition` axiom-free (cases/rfl/rcases, no decide/simp/propext).
- Build: full lake build success (1342 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Development failure records
1. **Hand-typed CJK defect**: a build-script assertion used hand-typed `關税`/`還税` variants, but the source uses `課税` (U+8AB2) and `戻し税` (U+623B); independently, the verbatim needle in both docs was hand-typed with the same wrong `還税` and was caught by the cross-check. Cause: transcribing statutory CJK by hand instead of extracting. Fix: build-script assertions replaced with structural ones (`endswith("場合")`, `"輸出" in …`, `"税" in …`), and the authoritative needle injected programmatically from the queue into both docs. Verified byte-for-byte in impl/spec/tests/docs. No gate weakened.
2. **`propext` axiom dependency**: the first axiom probe reported `propext` on all five theorems. Competing hypotheses: (a) multi-pattern `match` introduces propext; (b) stale `.olean`. Isolated with a minimal Lean file: nested `match` is axiom-free while multi-pattern `match` pulled in propext. Fix: rewrote `withinCondition` as nested match and rebuilt; all five theorems now "does not depend on any axioms". No gate weakened.

## Not modelled
Operative article text, substantive relief mechanics, 等 ("etc.") extensions, legal correctness. Computable slice of one caption-level CONDITION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART19_2_EXPORT_RELIEF_CONDITION.md`.
