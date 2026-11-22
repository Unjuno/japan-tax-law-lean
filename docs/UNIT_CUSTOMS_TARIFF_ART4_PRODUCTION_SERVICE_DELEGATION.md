# Unit review — 関税定率法 第四条(1)（委任）DELEGATION

Normative unit id: `NORM|166d1cbfaa939eed4cc5e49d978dc9b3922b053d66b1a8f041261f79a072529d`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「技術、設計その他当該輸入貨物の生産に関する役務で政令で定めるもの」 — a class of production-related services (技術, design, others) prescribed by 政令 (Cabinet Order).

Exact source position:
`LawBody[1]/MainProvision/MainProvision[5]/Article:4/Article#4/Paragraph#1/Item#3/Subitem1#4/Subitem1Sentence/Sentence#1` — MainProvision Article 第四条, caption （課税価格の決定の原則）. `find_article_text(...,"第四条")` returns that article (len 2219) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — the subitem lists production-related services whose exact scope is prescribed by 政令. The computable slice models the delegation structure (ServiceClass: technical/otherProduction/outOfScope; cabinetDesignated; inDelegatedClass). The actual Cabinet Order content is NOT MODELLED. Statutory terms (技術, 政令) extracted structurally from the verbatim needle's own delimiters (、 / で定める / もの) — no hand-typed strings.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The two listed production services (技術, design/others) are 政令-designated and delegated; out-of-scope is not. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.4 production service delegation…↔ CustomsTariffArt4ProductionServiceDelegation.lean」. Full audit: 312/312 checks passed. |
| D (decision) | PASS — audit reports `312/312 checks passed`. |
| C (competing interpretation) | Only the delegation structure is modeled. Actual 政令 content, which concrete services are designated, and legal correctness are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt4ProductionServiceDelegation.lean` — ServiceClass inductive (technical/otherProduction/outOfScope), cabinetDesignated, inDelegatedClass, boundary theorems with explicit `unfold`.
- Independent spec: `SpecDelegated` propositional case-disjunction distinct from impl; `agree_delegated` universal via exhaustive cases; agreement theorems.
- BUILD FIX: `by decide` initially failed (instance synthesis can't unfold defs); fixed by forcing `unfold` in both impl and spec boundary theorems.
- Build: `lake build` → full build success (986 jobs); unit build 5 jobs; 6 theorems axiom-free, 1 `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Actual 政令 content, which concrete services are designated, other items/articles, legal correctness. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART4_PRODUCTION_SERVICE_DELEGATION.md`.
