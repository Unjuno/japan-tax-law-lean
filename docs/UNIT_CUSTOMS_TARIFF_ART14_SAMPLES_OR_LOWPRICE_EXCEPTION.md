# Unit review — 関税定率法 第十四条(1)（ただし書）EXCEPTION

Normative unit id: `NORM|5730c2683082200288f2ec845009841a40eaab89c639586c3635625810b5edd3`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「ただし、見本用にのみ適すると認められるもの又は著しく価額の低いものとして政令で定めるものに限る。」 — a ただし書 proviso limiting a duty-free item to samples-only goods OR significantly-low-price goods prescribed by 政令 (に限る = "limited to").

Exact source position:
`LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/Item#6/ItemSentence/Sentence#2` — MainProvision Article 第十四条, caption （無条件免税）. `find_article_text(...,"第十四条")` returns that article (len 1655) containing the needle → article-kind locator used.

Norm kind: **EXCEPTION** — a scope-limiting proviso with a disjunction (「又は」). The computable slice models the two listed classes (samples-only, low-price-by-order) as inside the exception and `other` as outside (に限る scope restriction). All statutory CJK (samples clause, low-price clause, 政令, law identity, article title/caption) extracted structurally from the verbatim needle/INVENTORY/raw using the needle's own delimiters (、 / に限る / 又は) — no hand-typed statutory strings.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The duty-free item is limited to samples-only OR low-price-by-order; the two classes are alternatives; other classes are outside the exception. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.14 samples or low-price exception…↔ CustomsTariffArt14SamplesOrLowPriceException.lean」. Full audit: 303/303 checks passed. |
| D (decision) | PASS — audit reports `303/303 checks passed`. |
| C (competing interpretation) | Only the scope-limiting disjunction is modeled. The underlying duty-free item, how 政令 determines low price, other items/articles, and legal correctness are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt14SamplesOrLowPriceException.lean` — ItemClass (samplesOnly | lowPriceByOrder | other), withinException : ItemClass -> Bool, DecidableEq derived.
- Independent spec: `SpecWithinException` propositional disjunction distinct from the Bool function; `agree_within_exception` universal, `samples_inside`, `lowprice_inside`, `other_outside`, `classes_distinct`.
- Build: `lake build` → full build success (959 jobs); unit build 5 jobs; 4 theorems axiom-free, 1 with only permitted `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The underlying duty-free item, how 政令 determines low price, other items/paragraphs and articles. Computable slice of one EXCEPTION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART14_SAMPLES_OR_LOWPRICE_EXCEPTION.md`.
