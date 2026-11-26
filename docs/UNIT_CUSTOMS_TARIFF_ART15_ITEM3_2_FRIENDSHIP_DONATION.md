# Unit review — 関税定率法 第15条(1) item3の2 EXCEPTION

Normative unit id: `NORM|d011e614a03497e2c28ed8b22911fe049188cc6a019accc9f787be24f45373bc`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「前三号に該当するものを除き、国際親善のため、国又は地方公共団体にその用に供するものとして寄贈される物品」

Exact source position: `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#3_2/ItemSentence/Sentence#1`.

Norm kind: **EXCEPTION** (with CONDITION aspect) — goods donated to the State or a local public body for international friendship qualify, excluding goods under the preceding three items. Computable slice: item selection with the three-item carve-out and donee-class selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Item3の2 with a public-body donee qualifies; items 1–3 and other donees do not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt15Item3_2FriendshipDonationException.lean. |
| D | PASS — transcription audit 761/761. |
| C | Only the classification slice is modeled. Actual donation eligibility and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt15Item3_2FriendshipDonationException.lean` — `Item` (1/2/3/3_2/other), `Donee`, `qualifies`, five boundary theorems.
- Independent spec: `SpecQualifies` with equality to the public-body class, proved equivalent by cases; seven unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2557 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Actual donation eligibility, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART15_ITEM3_2_FRIENDSHIP_DONATION.md`.
