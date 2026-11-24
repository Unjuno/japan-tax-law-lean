# Unit review — 相続税法 第十条(1) 第一号 EXCEPTION

Normative unit id: `NORM|424b2bac8659abc04e9d8a1ad5d253983282371dfd1da0a4afcb881ca4e8072a`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「ただし、船舶又は航空機については、船籍又は航空機の登録をした機関の所在」

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:10/Article#10/Paragraph#1/Item#1/ItemSentence/Sentence#2` — the ただし proviso of item 1; Sentence#1 (the general location rule) is a separate norm and NOT MODELLED here.

Norm kind: **EXCEPTION** — for 船舶 or 航空機, location is 船籍又は航空機の登録をした機関の所在 (the location of the registration organ), instead of the ordinary asset location. Computable slice: the exception discriminator (which asset kinds take the registration-organ location). All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Ships and aircraft take the registration-organ location; ordinary assets do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt10ShipAircraftLocationException.lean. |
| D | PASS — transcription audit 582/582. |
| C | Only the exception discriminator is modeled. The substantive location determination, the Sentence#1 general rule, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt10ShipAircraftLocationException.lean` — `AssetKind` (ordinary/ship/aircraft), `isRegistrationLocated` (false/true/true), three boundary theorems.
- Independent spec: `SpecRegistrationLocated` Prop disjunction, representationally distinct; agreement theorems axiom-free (rfl/left/right/rcases).
- Build: full lake build success (1918 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive location determination, Sentence#1 general rule, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART10_SHIP_AIRCRAFT_LOCATION_EXCEPTION.md`.
