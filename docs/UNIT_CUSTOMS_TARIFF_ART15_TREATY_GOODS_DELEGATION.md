# Unit review — 関税定率法 第15条(1) 第10号 DELEGATION

Normative unit id: `NORM|e88e79c160c4c7a008abfc095e601ed439e9cbeefd112e183044f3c2e2a8a57c`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「条約の規定により輸入の後特定の用途に供されることを条件として関税を免除することとされている貨物で政令で定めるもの」

Exact source position: `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#10/ItemSentence/Sentence#1`.

Norm kind: **DELEGATION** — treaty-based duty-exempt goods are further limited to those designated by cabinet order. Computable slice: the two-gate conjunction. CJK is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A good is in scope only if both treaty basis and cabinet-order designation hold. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt15TreatyGoodsDelegation.lean. |
| D | PASS — transcription audit 828/828. |
| C | Only the two-gate conjunction is modeled. Treaty content, cabinet-order content, legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt15TreatyGoodsDelegation.lean` — `inScope` Bool conjunction, three boundary theorems.
- Independent spec: `SpecInScope` Prop conjunction of two equalities, representationally distinct; all four theorems axiom-free.
- Build: full lake build success (2782 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Treaty content, cabinet-order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART15_TREATY_GOODS_DELEGATION.md`.
