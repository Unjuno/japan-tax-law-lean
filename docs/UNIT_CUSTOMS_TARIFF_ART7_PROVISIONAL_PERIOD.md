# Unit review — 関税定率法 第七条(3)（期間）REFERENCE

Normative unit id: `NORM|bc9ece29b2b61de2536a557c4d241b619e5f147f15451aad8242eaea7e175af5`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「暫定措置がとられた日の九十日前の日以後第一項の規定による指定がされた日の前日までの期間」 — the period from 九十日前の日以後 (on or after the day 90 days before the provisional-measure date) through 指定がされた日の前日まで (through the day before the 第一項 designation).

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#3/Item#3/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **REFERENCE** — a bounded date interval. The computable slice models inclusive interval membership `inPeriod lo hi t := lo ≤ t ∧ t ≤ hi`, with `lo = 九十日前の日 = measure - offsetDays` (offsetDays=90 from the verbatim 九十) and `hi = 指定がされた日の前日 = designation - 1`. Both boundary days are inclusive (以後 / まで). The exact calendar arithmetic of 九十日前 (months/leap years) is NOT MODELLED. All statutory terms/date components extracted structurally from the needle.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The defined period runs from the day 90 days before the provisional-measure date (inclusive 以後) through the day before the 第一項 designation (inclusive まで). |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 provisional period…↔ CustomsTariffArt7ProvisionalPeriod.lean」. Full audit: 322/322 checks passed. |
| D | PASS — audit reports `322/322 checks passed`. |
| C | Only inclusive interval membership is modeled. The provisional measure, the 第一項 designation, calendar arithmetic, and underflow are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7ProvisionalPeriod.lean` — offsetDays=90 (from verbatim 九十), lowerBound/upperBound, inPeriod (≤ conjunction), measure_day_in / designation_eve_in boundary theorems (axiom-free Nat.le_refl).
- Independent spec: `SpecInPeriod := ¬(t < lo) ∧ ¬(hi < t)` (contrapositive strict-inequality form, representationally distinct from impl's ≤ conjunction, equivalent for all Nat; critically adds no internal `lo ≤ hi` constraint). `agree_in_period` universal axiom-free via Nat.not_lt_of_ge / Nat.le_of_not_gt.
- Build: `lake build` → full build success (1016 jobs); unit build 5 jobs; all 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The provisional measure, the 第一項 designation mechanism, calendar day arithmetic (months/leap years), underflow (measure < 90 or designation = 0), and legal correctness. Callers must supply lo ≤ hi. Computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_PROVISIONAL_PERIOD.md`.
