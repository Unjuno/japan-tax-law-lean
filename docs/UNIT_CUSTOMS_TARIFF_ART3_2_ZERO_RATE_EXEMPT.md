# Unit review — 関税定率法 第3条の2(2) item1 REFERENCE

Normative unit id: `NORM|3860b04f653665e60dc8012064fa44884eddeb064ba1d0724372454c2946bb5a`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「この法律その他関税に関する法律の規定により関税の率が無税とされている貨物及び関税が免除される貨物」

Exact source position: `LawBody[1]/MainProvision/MainProvision[3]/Article:3_2/Article#3_2/Paragraph#2/Item#1/ItemSentence/Sentence#1`.

Norm kind: **REFERENCE** — the referenced class comprises zero-rate goods and duty-exempt goods. Computable slice: class selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Zero-rate and exempt goods are in scope; unrelated goods are not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt3_2ZeroRateAndExemptGoods.lean. |
| D | PASS — transcription audit 782/782. |
| C | Only class selection is modeled. Actual goods lists and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt3_2ZeroRateAndExemptGoods.lean` — `GoodClass`, `inScope`, three boundary theorems.
- Independent spec: `SpecInScope` Prop disequality, representationally distinct; all four unit theorems axiom-free (trivial, cases).
- Build: full lake build success (2644 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Actual goods lists, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART3_2_ZERO_RATE_EXEMPT.md`.
