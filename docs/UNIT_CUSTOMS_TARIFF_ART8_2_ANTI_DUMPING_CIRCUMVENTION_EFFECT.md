# Unit review — 関税定率法 第八条の二（ArticleCaption）EFFECT

Normative unit id: `NORM|8789ee655212d701703263bc001c3736ef358b2ecfcbb3cd68bb4a181dd709bd`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「（不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）」 (needle injected from the queue, never hand-typed) — a duty (課する関税) imposed on goods imported from a third country (第三国) for the purpose of circumventing the imposition of anti-dumping duty (不当廉売関税の課税の回避). Sub-terms are extracted programmatically from the caption. NOTE: a caption is a heading, NOT the operative provisions — substantive anti-dumping determinations, duty computation and legal effect mechanics are NOT MODELLED.

Exact source position: `LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/ArticleCaption` — the needle IS the ArticleCaption. `find_article_text(...,"第八条の二")` len 4324 with needle.

Norm kind: **EFFECT** — caption-level origin/purpose/effect discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The labeled duty effect applies to third-country imports with the anti-dumping-avoidance purpose; others are outside. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8_2AntiDumpingCircumventionEffect.lean. |
| D | PASS — transcription audit 441/441. |
| C | Only caption-level origin/purpose/effect discrimination modeled; operative text and duty computation out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8_2AntiDumpingCircumventionEffect.lean` — `ImportOrigin` (thirdCountry/other), `Purpose` (avoidAntiDumping/other), Bool `withinEffect` (nested match), boundary theorems.
- Independent spec: `SpecWithinEffect` Prop predicate, representationally distinct from the Bool function; `agree_within_effect` axiom-free (cases/rfl, no decide/simp/propext).
- Build: full lake build success (1354 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Development note
An initial regex for sub-term extraction omitted a character and failed; it was replaced with a fragment-based extraction validated against the needle. Sub-term values are never hand-typed into assertions (structural checks only). Nested `match` used to keep theorems axiom-free.

## Not modelled
Operative article text, anti-dumping determinations, duty computation, 等 extensions, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_2_ANTI_DUMPING_CIRCUMVENTION_EFFECT.md`.
