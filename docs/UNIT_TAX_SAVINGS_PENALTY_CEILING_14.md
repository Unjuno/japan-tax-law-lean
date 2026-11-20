# Unit review — 納税貯蓄組合法 art.14（十万円以下の過料）

Normative unit id: `NORM|91349ec2d835e0fe4fdd63ea17f15c1ce9a98c22d91c36f03bea07410596f64e`

Law: 326AC1000000145 (納税貯蓄組合法, Tax Savings Association Act),
law number 昭和二十六年法律第百四十五号,
revision `326AC1000000145_20211122_503AC0000000046`,
snapshot `data/raw/326AC1000000145_20211122_503AC0000000046.law.json`,
sha256 `fc6c4ca152291c10c1218a62303a879195bfbbe95a056d0e264ee0315bbc4e2b`.

Law identity verified: INVENTORY `official_title = 納税貯蓄組合法`; raw JSON
`revision_info/law_title = 納税貯蓄組合法` (both checked, guarding against the
earlier wrong-law finding on a different unit).

Verbatim source text: 「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[14]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1`.
Norm kind: **CONDITION** (penalty ceiling; inclusive 「以下」).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.14(1) imposes a fine (過料) of at most ¥100,000 (十万円以下) on persons falling under the enumerated 各号. 「以下」 is inclusive. Unit 円; domain Nat. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「納税貯蓄組合法 art.14…↔ TaxSavingsPenaltyCeiling.lean」 pinned to law 326AC1000000145, article locator 第十四条, verbatim needle. Full-file count 1. Full audit: 184/184 checks passed. |
| D (decision) | PASS — audit reports `184/184 checks passed`. |
| C (competing interpretation) | The needle is a penalty frame whose actual conditions live in the 各号 subitems; only the numeric ceiling is modelled. The 各号 are explicitly out of scope. 「過料」 (administrative fine) is distinct from 「罰金」 (criminal fine); the model records only the amount ceiling. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/TaxSavingsPenaltyCeiling.lean` — `penaltyCeilingYen=100_000`, `withinPenaltyCeiling a := a ≤ penaltyCeilingYen`.
- Independent spec: `specWithinPenaltyCeiling a := a - penaltyCeilingYen = 0` (truncated subtraction) — different from `≤`; `agree_penalty_ceiling` universal over all amounts.
- Boundary theorems: `at_ceiling`, `one_over_fails`, `penalty_monotone`.
- Build: `lake build` → full build success (602 jobs); axiom profile `propext` + 3 axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The enumerated 各号 (who is liable), the fine-imposition procedure, other paragraphs and 政令 details. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_TAX_SAVINGS_PENALTY_CEILING_14.md` (H/T/D/C/U per finding).
