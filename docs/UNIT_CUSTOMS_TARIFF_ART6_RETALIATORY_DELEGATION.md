# Unit review — 関税定率法 第六条(3)（委任）DELEGATION

Normative unit id: `NORM|1a84e6b4b4acb58de9110434621a70c324c0533ac262ff85390749f0ed48a56e`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「前二項に定めるもののほか、これらの規定の適用に関し必要な事項は、政令で定める。」 — besides matters in the preceding two paragraphs (前二項に定めるもののほか), matters necessary for the application of these provisions (これらの規定の適用に関し必要な事項) are prescribed by Cabinet Order (政令で定める).

Exact source position:
`LawBody[1]/MainProvision/MainProvision[15]/Article:6/Article#6/Paragraph#3/ParagraphSentence/Sentence#1` — MainProvision Article 第六条, caption （報復関税等）. `find_article_text(...,"第六条")` returns that article (len 878) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — a residual delegation. The computable slice models which legal source determines each matter class: `Matter` (inAct / necessaryForApplication), `LegalSource` (act / cabinetOrder), `determinedBy : Matter -> LegalSource`. The residual ほか encodes non-overlap with the Act-prescribed matters. All statutory terms (前二項, のほか, 政令, これらの規定の適用) extracted structurally from the verbatim needle.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | Matters necessary for applying these provisions are prescribed by 政令; in-Act matters (前二項) are not delegated. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.6 retaliatory delegation…↔ CustomsTariffArt6RetaliatoryDelegation.lean」. Full audit: 325/325 checks passed. |
| D | PASS — audit reports `325/325 checks passed`. |
| C | Only the delegating structure is modeled. The actual 政令 content and the substance of the preceding two paragraphs are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt6RetaliatoryDelegation.lean` — `Matter`/`LegalSource` inductive types, `determinedBy` function, residual theorems (inAct→act, necessaryForApplication→cabinetOrder), all `rfl`.
- Independent spec: `SpecDeterminedBy` propositional matter/source relation (disjunction of equalities), representationally distinct from the function form. `agree_determined_by` proved axiom-free via explicit `cases`/`rfl` (no `simp`, no `propext`), after an initial `simp` version was replaced to avoid `[propext]`.
- Build: `lake build` → full build success (1025 jobs); unit build 5 jobs; all 5 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The actual 政令 content, the substance of the preceding two paragraphs, other articles, and legal correctness. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART6_RETALIATORY_DELEGATION.md`.
