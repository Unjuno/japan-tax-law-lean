# Unit review — 関税定率法 第七条(33)（委任）DELEGATION

Normative unit id: `NORM|e0b944b35e9349347a9ceecafce676e12456b363118f2bb1271a40efde92025b`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「前各項に定めるもののほか、相殺関税の適用に関し必要な事項は、政令で定める。」 — a residual delegation: matters necessary for the application of 相殺関税 are prescribed by 政令, in addition to matters in the preceding paragraphs.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#33/ParagraphSentence/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — residual delegation with non-overlap (ほか = "in addition to"): in-Act matters stay with the Act; matters necessary for applying 相殺関税 are delegated to 政令. The computable slice models which legal source determines each matter class (Matter: inAct | necessaryForApplication; LegalSource: act | cabinetOrder; determinedBy). Actual 政令 content NOT MODELLED. All statutory terms (相殺関税, 政令, residual clause) extracted structurally from the verbatim needle's own delimiters (、 / のほか / で定める / の適用) — no hand-typed strings.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | In-Act matters determined by the Act (not delegated); necessary application matters delegated to 政令. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 countervailing delegation…↔ CustomsTariffArt7CountervailingDelegation.lean」. Full audit: 313/313 checks passed. |
| D | PASS — audit reports `313/313 checks passed`. |
| C | Only the delegation structure is modeled. Actual 政令 content and other articles are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7CountervailingDelegation.lean` — Matter/LegalSource inductives, determinedBy, residual non-overlap theorems.
- Independent spec: `SpecDeterminedBy` propositional relation distinct from the function; `agree_determined_by` universal via exhaustive cases.
- BUILD FIX: `by decide` boundary proofs needed explicit `unfold SpecDeterminedBy` (instance synthesis cannot unfold defs) — fixed.
- Build: `lake build` → full build success (989 jobs); unit build 5 jobs; 4 theorems axiom-free, 1 `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Actual 政令 content, other articles, legal correctness. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_COUNTERVAILING_DELEGATION.md`.
