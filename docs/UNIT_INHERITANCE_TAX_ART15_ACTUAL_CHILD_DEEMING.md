# Unit review — 相続税法 第15条(3) DEEMING

Normative unit id: `NORM|3a29e9541c61aee3230a076944570965f9b95a0617d2d8dd3a8975ee05f475df`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…f275043a7.

Verbatim source text (injected from the queue, not hand-typed): 「前項の規定の適用については、次に掲げる者は実子とみなす。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#3/ParagraphSentence/Sentence#1`.

Norm kind: **DEEMING** — for the preceding paragraph's application, the enumerated persons are deemed actual children. Computable slice: the classification transformation over a three-way enumeration. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A listed person is transformed into the actual-child class; an unrelated person is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt15ActualChildDeeming.lean. |
| D | PASS — transcription audit 772/772. |
| C | Only the transformation is modeled. The identity of enumerated persons and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt15ActualChildDeeming.lean` — `PersonClass`, `deemAsActualChild` with fully explicit branches, `classifiedAsActualChild`, three boundary theorems.
- Independent spec: `SpecDeeming` implication, representationally distinct; all five unit theorems axiom-free (rfl, cases) with no `propext` from catch-all patterns.
- Build: full lake build success (2599 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Identity of enumerated persons, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART15_ACTUAL_CHILD_DEEMING.md`.
