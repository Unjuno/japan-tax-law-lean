# Unit review — 関税定率法 第二十一条 (ArticleCaption) DEEMING

Normative unit id: `NORM|abdefe5d8becbbaf72feb57bf8fe19255467b5f2872b4c2d030feff151188908`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…986ae9c3.

Verbatim source text (injected from the queue, not hand-typed): 「（外国とみなす地域）」

Exact source position: `LawBody[1]/MainProvision/MainProvision[38]/Article:21/Article#21/ArticleCaption` — the needle IS the ArticleCaption. Full Article 21 flat text (from raw JSON): 「（外国とみなす地域）第二十一条この法律の適用については、政令で定める本邦の地域は、当分の間、外国とみなす。」.

Norm kind: **DEEMING** — the caption labels the rule deeming designated domestic regions foreign for purposes of this Act. The computable slice models the region-status deeming discrimination. All statutory facts derived from the needle and raw article text; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A region designated by Cabinet Order (政令で定める本邦の地域) is deemed foreign; an ordinary domestic region and an already-foreign region are not the object of this deeming. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt21DeemedForeignRegion.lean. |
| D | PASS — transcription audit 489/489. |
| C | Only the region-status deeming discrimination is modeled. The Cabinet Order designation itself, the 当分の間 qualifier, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt21DeemedForeignRegion.lean` — `RegionStatus` (domestic/designatedDomestic/foreign), `isDeemedForeign` (true only for designatedDomestic), three boundary theorems.
- Independent spec: `SpecDeemedForeign` Prop equality, representationally distinct; `spec_designated`, `agree_designated`, `agree_domestic` axiom-free (rfl).
- Build: full lake build success (1603 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Cabinet Order designation, the 当分の間 qualifier, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The Cabinet Order designation is a structural fact only, NOT MODELLED.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART21_DEEMED_FOREIGN_REGION.md`.
