# Unit review — 関税定率法 第16条(1) DELEGATION

Normative unit id: `NORM|6868ae3dc5dbd0c5012476e69b40a267ebccf7ed6abc90c7a3a695b3cec23df8`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「左の各号に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[29]/Article:16/Article#16/Paragraph#1/ParagraphSentence/Sentence#1`.

Norm kind: **DELEGATION** — for goods listed in the left columns, customs duty is exempted to the extent prescribed by Cabinet Order. Computable slice: delegation-target selection and exemption-effect selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Cabinet Order is the delegation target; exemption is the duty effect. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt16DelegatedExemption.lean. |
| D | PASS — transcription audit 741/741. |
| C | Only target/effect selection is modeled. Listed goods, Cabinet Order content, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt16DelegatedExemption.lean` — `DelegationTarget`, `DutyEffect`, four boundary theorems.
- Independent spec: `SpecTarget`/`SpecEffect` Prop equalities, representationally distinct; all eight unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2470 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Listed goods, Cabinet Order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART16_DELEGATED_EXEMPTION.md`.
