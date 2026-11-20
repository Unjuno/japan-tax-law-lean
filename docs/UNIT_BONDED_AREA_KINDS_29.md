# Unit review — 関税法 art.29（保税地域は五種とする）

Normative unit id: `NORM|82181433a122f927ffe22c13314bc4aa5d5b3e8df17fd13c98f2a46c498b47b0`

Law: 329AC0000000061 (関税法, Customs Law), law number 昭和二十九年法律第六十一号,
revision `329AC0000000061_20260601_508AC0000000005`,
snapshot `data/raw/329AC0000000061_20260601_508AC0000000005.law.json`,
sha256 `1701272a2e4eaf434b6d953026c340efa4e15b2ca952fc941eeeb676d32204ea`.

Law identity verified: INVENTORY `official_title = 関税法`; raw JSON `law_title = 関税法`.

Verbatim source text: 「保税地域は、指定保税地域、保税蔵置場、保税工場、保税展示場及び総合保税地域の五種とする。」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[3]/Article:29/Article#29/Paragraph#1/ParagraphSentence/Sentence#1`.
Norm kind: **EFFECT** (enumeration / five-kind definition).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.29(1) enumerates five bonded-area kinds: 指定保税地域, 保税蔵置場, 保税工場, 保税展示場, 総合保税地域 (「五種」= 5). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「関税法 art.29…↔ BondedAreaKinds.lean」 pinned to law 329AC0000000061, article locator 第二十九条, verbatim needle. Full audit: 186/186 checks passed. |
| D (decision) | PASS — audit reports `186/186 checks passed`. |
| C (competing interpretation) | The needle is a definition/enumeration; the computable slice models the five named kinds and their cardinality. Substantive definitions of each kind are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/BondedAreaKinds.lean` — `BondedAreaKind` 5-constructor enum, `kindCount=5`, `allKinds` list.
- Independent spec: `specKindCount = allKinds.length` (count derived from list, distinct from the literal `kindCount=5`); `agree_kind_count`, `all_kinds_nodup`, `all_kinds_exhaustive` (universal over all 5 constructors).
- Build: `lake build` → full build success (608 jobs); axiom profile `propext` only for two theorems; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive definitions of each bonded area, the 関税法 provisions governing them, other paragraphs and 政令 details. This is a computable slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_BONDED_AREA_KINDS_29.md` (H/T/D/C/U per finding).
