# Unit review — 関税定率法 第17条(1) 第11号 DELEGATION

Normative unit id: `NORM|7683650c1eee7e91e43bab06f869a0234b89d07aab791ea50dc7ebb7f077e00f`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「条約の規定により輸入の後一定の期間内に輸出されることを条件として関税を免除することとされている貨物で政令で定めるもの」

Exact source position: `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#1/Item#11/ItemSentence/Sentence#1`.

Norm kind: **DELEGATION** — treaty-based duty-exempt goods conditioned on export within a fixed period are further limited to those designated by cabinet order. Computable slice: the three-gate conjunction. CJK is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A good is in scope only if treaty basis, export-in-period and cabinet-order designation all hold. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt17ReexportGoodsDelegation.lean. |
| D | PASS — transcription audit 830/830. |
| C | Only the three-gate conjunction is modeled. Treaty content, period length, cabinet-order content, legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt17ReexportGoodsDelegation.lean` — `inScope` Bool conjunction, four boundary theorems.
- Independent spec: `SpecInScope` Prop conjunction of three equalities, representationally distinct; all five theorems axiom-free.
- Build: full lake build success (2785 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Treaty content, period length, cabinet-order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART17_REEXPORT_GOODS_DELEGATION.md`.
