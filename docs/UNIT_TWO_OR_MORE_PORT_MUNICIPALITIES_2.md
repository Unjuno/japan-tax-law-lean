# Unit review — 特別とん譲与税法施行規則 art. 2(1)（二以上の開港所在市町村 / CONDITION）

Normative unit id: `NORM|6d88a4e6ecbe918e329d10056884bbc867d8da77c28a12ef3c3e54354872b2e5`
Law: 特別とん譲与税法施行規則 (`332M50000002021`),
revision `332M50000002021_20010106_412M50000008044` (`CurrentEnforced`).
Source: `data/raw/332M50000002021_20010106_412M50000008044.law.json`
SHA-256 (CRLF→LF): `2ce4744265b50bdb5b62c0380575ca4b73fc7c92ee7f5125b97f74a90b384c7c`
Provision: `LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/ArticleCaption`

Verbatim (CONDITION): 「（二以上の開港所在市町村の区域が一の税関の管轄区域に属する場合の譲与の基準）」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | 「二以上」is a lower-bound count condition: at least two 開港所在市町村 in one customs district. `ports : Nat` is a count; `2 <= ports`. |
| T | Pin + `transcription_audit.py` needle scoped to `第二条` (MAIN). Independent audit: needle count whole law = 1, scoped (364 chars) = 1; 「二」 verified against `kanji_variants(2)`. |
| D | PASS — verbatim-unique needle, SHA/revision match INVENTORY, spec literal 2 found in the clause, no blocking transcription defect. |
| C | 附則 has no duplicate. This is an ArticleCaption: only the count condition is modelled, not the grant basis. |
| U | The substantive 本文「譲与の基準」needs its own unit. Human legal determination remains `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `TwoOrMorePortMunicipalities.lean` — `minimumPorts = 2`, `atLeastTwo ports = decide (2 <= ports)`; boundary theorems by `decide`.
- Independent spec: `TwoOrMorePortMunicipalitiesSpec.lean` — own `specMinimumPorts = 2` and `specAtLeastTwo ports = decide (¬ ports < 2)`, no impl definitions reused.
- Universal kernel proof: `agree_at_least_two (ports : Nat)` for every Nat (`by_cases` + `omega` + `simp`; no forbidden tokens).
- Tests: 12 kernel-decided examples; boundary categories `{zero, small_input, threshold_below, threshold_at, threshold_above, saturation}`.

Not modelled: 譲与の基準, the municipalities/customs district identities, other articles, and all other laws. Human legal review remains `LEGAL_REVIEW_PENDING`.
