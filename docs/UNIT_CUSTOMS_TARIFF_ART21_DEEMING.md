# Unit review — 関税定率法 第二十一条(1)（外国とみなす地域）DEEMING

Normative unit id: `NORM|1171722dae792afda3c164ba383e239e77bbd936df4f4d007090778db64ea0dc`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「この法律の適用については、政令で定める本邦の地域は、当分の間、外国とみなす。」 — for this Act's application, a 政令で定める本邦の地域 is, 当分の間, 外国とみなす (deemed foreign).

Exact source position:
`LawBody[1]/MainProvision/MainProvision[38]/Article:21/Article#21/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第二十一条, caption （外国とみなす地域）. `find_article_text(...,"第二十一条")` returns that article (len 53) containing the needle → article-kind locator used.

Norm kind: **DEEMING** — a scoped legal fiction with three conjunctive conditions: (1) 本邦の地域 (domestic region, actual status domestic), (2) 政令で定める (Cabinet-order designated), (3) 当分の間 (within the provisional period). Effect: 外国とみなす for this Act's application only. Faithfulness: the fiction changes only the for-this-Act *treatment*, never the region's actual status field — scoped, not identity-changing. 「当分の間」 precise temporal bounds NOT MODELLED (explicit Bool parameter; statute fixes no dates). All statutory terms (本邦の地域/政令で定める/当分の間/外国とみなす/この法律の適用については) extracted programmatically from the needle; title/number/caption/quote from INVENTORY/raw.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | For this Act: (domestic ∧ designated ∧ provisional) → treated foreign; the fiction changes treatment only under these conditions, scoped (never mutates actual status). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.21 region deemed foreign…↔ CustomsTariffArt21Deeming.lean」. Full audit: 287/287 checks passed. |
| D (decision) | PASS — audit reports `287/287 checks passed`. |
| C (competing interpretation) | Only this deeming rule is modeled. Designated-region identity, 当分の間 temporal bounds, other paragraphs/articles, and legal correctness are out of scope. An actually-foreign region is treated foreign trivially, NOT via the fiction — the invariant is about the status CHANGE. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt21Deeming.lean` — `RegionStatus` (domestic | foreign), `Region` (actualStatus + designatedByCabinetOrder Bool), `treatedAsForThisAct r p` (if domestic && designated && provisional then foreign else actual).
- Independent spec: `specTreatedAs` (pattern-match on RegionStatus, no && chain) + `SpecDeemingConditions` (propositional conjunction); `agree_treated_as`, `deeming_changes_status_iff_conditions`, `deeming_only_changes_domestic`, `domestic_deemed_iff_conditions` all universal & axiom-free.
- Kernel-caught correction: initial spec theorems (`treated_foreign_iff_conditions`, `actual_status_preserved`) were FALSE in the actually-foreign case (a foreign region is treated foreign trivially); Lean rejected them; replaced with correct status-change invariants.
- Build: `lake build` → full build success (911 jobs); unit build 5 jobs. 1 theorem axiom-free, 3 with only permitted `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Designated-region identity, 当分の間 temporal bounds (statute fixes no dates), other paragraphs, other articles. Computable slice of one DEEMING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART21_DEEMING.md`.
