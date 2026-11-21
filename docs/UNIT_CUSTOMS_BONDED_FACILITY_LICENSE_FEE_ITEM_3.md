# Unit review — 税関関係手数料令 第二条(1)第三号（保税蔵置場又は保税展示場の許可手数料: 16,400円 / 指定者 16,200円）

Normative unit id: `NORM|2b2b4b2f039318d1fabf1c656b5ba6ccba76ede0d7ef62de11a59a2a6a66c0ef`

Law: 329CO0000000164 (税関関係手数料令, Customs Fees Order), law number 昭和二十九年政令第百六十四号,
law_type **CabinetOrder (政令)**, revision `329CO0000000164_20250401_507CO0000000141` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/329CO0000000164_20250401_507CO0000000141.law.json`,
sha256 `9ded2444572b362dfbadac27e0b9167f771fd6de961817bb0ced10f9110f83e8`.

Verbatim source text: 「一万六千四百円（当該許可を受ける者が指定者である場合にあつては、一万六千二百円）」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/Item#3/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第二条, caption （保税蔵置場又は保税展示場の許可手数料）. `find_article_text(...,"第二条")` returns that article (len 2048) containing the needle → article-kind locator used. (Three articles titled 第二条 exist; the main-provision one contains the needle.)

Norm kind: **CONDITION** — monthly license fee by floor-area bracket; this Item 3 gives ¥16,400 (general) and ¥16,200 (指定者 reduced), alternative by applicant status. Both amounts derived programmatically from the verbatim needle's kanji numerals. Historical kana あつて (U+3064) preserved.

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The two amounts are ¥16,400 (general) and ¥16,200 (designated person,Difference ¥200). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「税関関係手数料令 第二条(1)3 bonded facility license fee 16400/16200円…↔ CustomsBondedFacilityLicenseFeeItem3.lean」. Full audit: 228/228 checks passed. |
| D (decision) | PASS — audit reports `228/228 checks passed`. |
| C (competing interpretation) | Only the two amounts are modeled. Floor-area bracket boundaries, license period/daily proration, other 号, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsBondedFacilityLicenseFeeItem3.lean` — `generalFeeYen=16_400`, `designatedFeeYen=16_200` (both programmatically derived); `designated_lt_general` (by decide).
- Independent spec: `specDifferenceYen=200` with `agree_fee_difference` (general = designated + 200), a decomposition claim distinct from the inequality; axiom-free.
- Build: `lake build` → full build success (734 jobs); both theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Floor-area bracket boundaries, license period and daily proration, other 号, other paragraphs and articles. Computable slice of one CONDITION norm unit in a CabinetOrder, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_BONDED_FACILITY_LICENSE_FEE_ITEM_3.md`.
