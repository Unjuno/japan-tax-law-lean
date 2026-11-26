# Unit review — 経済連携協定緊急措置政令 art.2(1)(1)（関税制度地域の「国」包含 / CONDITION）

Normative unit id: `NORM|e0b9627e8d1b6301081a5fa5f27500c0119196700f23f9775c514dce0ab9034d`
Law: `414CO0000000116`, revision `414CO0000000116_20181230_429CO0000000006` (`CurrentEnforced`).
Source: `data/raw/414CO0000000116_20181230_429CO0000000006.law.json`
SHA-256 (CRLF→LF): `84ab2f2186bf018a05e3d90d804314f08bd2cc5873778820e1e2ff59c966a77a`
Provision: `LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/Item#1/ItemSentence/Sentence#1`

Verbatim (CONDITION): 「当該調査の対象となる国（固有の関税及び貿易に関する制度を有する地域を含む。以下同じ。）」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | A territory with its own customs and trade system is included in the "country" subject to investigation. Entity codes 0 (such territory) → 1 (country); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第二条`. Independent audit: needle whole law = 1, scoped (385 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the inclusion is modelled, not the investigation procedure. |
| U | Investigation procedure and agreement substance need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `CustomsTerritoryCountryInclusion.lean` — `asCountry : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `CustomsTerritoryCountryInclusionSpec.lean` — `specAsCountry c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_country (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: investigation procedure, agreement, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
