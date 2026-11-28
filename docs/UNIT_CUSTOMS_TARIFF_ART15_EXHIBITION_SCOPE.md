# Unit review — 関税定率法 第15条(1) 第5号の2 EXCEPTION

Normative unit id: `NORM|b8c681082e69caab3f288bf5c824986816c4dde9fb96a4ff4338c23802a970a4`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「ただし、博覧会等の開催の期間及び規模、物品の種類及び価格その他の事情を勘案して相当と認められるものに限る。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#5_2/ItemSentence/Sentence#2`.

Norm kind: **EXCEPTION** — exhibition-goods relief is limited to what is recognized as reasonable given period/scale, kind/price and other circumstances. Computable slice: the three consideration gates. CJK is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Relief applies only if period/scale, kind/price and other circumstances are all reasonable. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt15ExhibitionGoodsScopeException.lean. |
| D | PASS — transcription audit 840/840. |
| C | Only the three-gate conjunction is modeled. What counts as reasonable, the exhibition itself, legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt15ExhibitionGoodsScopeException.lean` — `inScope` Bool conjunction, four boundary theorems.
- Independent spec: `SpecInScope` Prop conjunction of three equalities, representationally distinct; all five theorems axiom-free.
- Build: full lake build success (2842 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
What counts as reasonable, the exhibition itself, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART15_EXHIBITION_SCOPE.md`.
