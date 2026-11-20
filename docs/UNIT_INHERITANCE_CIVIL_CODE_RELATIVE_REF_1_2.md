# Unit review — 相続税法 art.1_2(1) item 1（民法877条の親族を参照する定義）

Normative unit id: `NORM|12e21a0a9f20bff1db674861bd44ab88a5ad29f22d750c0042c85775e51414cb`

Law: 325AC0000000073 (相続税法), revision
`325AC0000000073_20260401_506AC0000000008`,
snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「配偶者及び民法（明治二十九年法律第八十九号）第八百七十七条（扶養義務者）に規定する親族をいう。」

Exact source position (from the generated queue):
`LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/Item#1/ItemSentence/Column#2/Sentence#1`.
Norm kind: **REFERENCE** (cross-law definition by reference to 民法 art.877).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.1_2(1) item 1 defines a term as the union of 配偶者 (spouse, stated in this law) and 民法第八百七十七条（扶養義務者）に規定する親族 (relatives prescribed in Civil Code art.877, by cross-reference). Reference target: 民法, law number 89 (明治二十九年法律第八十九号), article 877. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「相続税法 art.1_2(1)…↔ InheritanceCivilCodeRelativeRef.lean」 pinned to law 325AC0000000073, article locator 第一条の二, verbatim needle. Full-file count 1, located in Article 1_2 / Paragraph 1 / Item 1 / Column 2. |
| D (decision) | PASS — audit reports `181/181 checks passed`. |
| C (competing interpretation) | The clause is a definition fragment (「…をいう」). Only its two disjuncts and the reference target identity are modelled; the substantive 民法877 content and tax consequences are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceCivilCodeRelativeRef.lean` — `referenceLawNumber=89`, `referenceArticle=877`, `PersonKind` (spouse/civilCode877Relative/other), `inDefinedTerm` (equality disjunction).
- Independent spec: `specInDefinedTerm` uses a structural pattern match — different from the implementation's `==` disjunction; `agree_in_defined_term` universal over all 3 inhabitants.
- Boundary theorems: `spouse_in_term`, `civil_relative_in_term`, `other_not_in_term`, `reference_law_number`, `reference_article`.
- Build: `lake build` → full build success (593 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of 民法877 (who counts as a support-obligor relative), the other items of art.1_2, and all tax consequences. This is a computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_CIVIL_CODE_RELATIVE_REF_1_2.md` (H/T/D/C/U per finding).
