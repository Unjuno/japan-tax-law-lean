# Unit review — 関税定率法 第四条の九(1)（政令への委任）DELEGATION

Normative unit id: `NORM|183467aae196b171afed87ed9853b9060bb48487f6da8c909d3dbe4f896bc1d4`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第四条から前条までに定めるもののほか、輸入貨物の課税価格の計算に関し必要な事項は、政令で定める。」 — besides matters prescribed in the Act, matters necessary for computing 課税価格 of imported goods are prescribed by 政令.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[13]/Article:4_9/Article#4_9/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第四条の九, caption （政令への委任）. `find_article_text(...,"第四条の九")` returns that article (len 61) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** (政令への委任) — a delegating structure: matters already prescribed in the Act (residual clause 「第四条から前条までに定めるもののほか」) stay with the Act; matters necessary for computing 課税価格 are determined by 政令. The computable slice models which legal source determines each matter class (Matter: inAct | necessaryForCustomsValue; LegalSource: act | cabinetOrder; determinedBy). The actual Cabinet Order content is NOT MODELED. All statutory CJK (政令/課税価格/residual clause, law title/number, article caption/title) extracted structurally from the verbatim needle/INVENTORY/raw — no hand-typed statutory strings.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | In-Act matters determined by the Act; delegated 課税価格 matters by 政令; the two sources are distinct and non-overlapping (residual ほか). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.4_9 delegation to cabinet order…↔ CustomsTariffArt4_9Delegation.lean」. Full audit: 300/300 checks passed. |
| D (decision) | PASS — audit reports `300/300 checks passed`. |
| C (competing interpretation) | Only the delegating structure is modeled. The actual Cabinet Order content, other articles and legal correctness are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt4_9Delegation.lean` — Matter (inAct | necessaryForCustomsValue), LegalSource (act | cabinetOrder), determinedBy; DecidableEq derived for both inductive types.
- Independent spec: `SpecDeterminedBy` propositional matter/source relation distinct from the function; `agree_determined_by` universal, `delegated_uses_cabinet_order`, `in_act_not_delegated`, `act_ne_cabinet_order`.
- Build: `lake build` → full build success (950 jobs); unit build 5 jobs; 3 theorems axiom-free, 1 with only permitted `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The actual Cabinet Order content, other articles, legal correctness. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART4_9_DELEGATION.md`.
