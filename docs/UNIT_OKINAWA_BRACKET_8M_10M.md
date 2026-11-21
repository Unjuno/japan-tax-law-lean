# Unit review — 沖縄特例政令 art.19(1)(3)（八百万円以上千万円未満の金額）

Normative unit id: `NORM|efdfff78b60a7d77191816bd395051878b7e92f4d65e99da141fd9208a1cc6f8`

Law: 347CO0000000151 (沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令),
CabinetOrder, revision `347CO0000000151_20251231_507CO0000000426`, snapshot
`data/raw/347CO0000000151_20251231_507CO0000000426.law.json`, sha256
`8c5521ffb74068dc5b6872a3748b53a6eec38afc3637ece878eb0ca9da74a437`.

Verbatim source text: 「八百万円以上千万円未満の金額」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1`.
The needle is verbatim-unique in the whole law (count = 1). Norm kind:
**CONDITION** — a numeric bracket 八百万円以上千万円未満 (8,000,000 <= amount
< 10,000,000): 以上 inclusive lower bound, 未満 exclusive upper bound.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This table cell defines a bracket: amount >= ¥8,000,000 (以上, inclusive) AND amount < ¥10,000,000 (未満, exclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pinned check 「沖縄特例政令 art.19(1)(3)（八百万円以上千万円未満）↔ OkinawaArt19Bracket8M10M.lean」 law 347CO0000000151, article 第十九条; verbatim needle unique. Full audit: 237/237 checks passed. |
| D (decision) | PASS — audit reports 237/237; needle located uniquely in the scoped Article 第十九条 main provision. |
| C (competing interpretation) | Reading 未満 as inclusive `<=` would admit exactly ¥10,000,000; the kernel theorem `upper_exclusive` rejects that. Reading 以上 as strict would reject exactly ¥8,000,000; `lower_inclusive` rejects that reading. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The substantive amount/rate that this bracket selects and the surrounding 政令 scheme require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Implementation: `lowerBound=8_000_000`, `upperBound=10_000_000`,
  `inBracket a := decide (lowerBound <= a && a < upperBound)`.
- Independent spec: `specInBracket a := decide (¬ a < specLowerBound && ¬ specUpperBound <= a)`
  (negated strict orders — distinct operators); universal `agree_bracket` over
  all Nat amounts, kernel-checked with `by omega`.
- Boundary theorems: `lower_inclusive` (8M qualifies), `upper_exclusive` (10M
  fails), `just_below_lower` (7,999,999 fails), `just_below_upper` (9,999,999
  qualifies).
- Tests: 14 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The other cells/rows of art.19(1)(3), the rate/amount selected by this bracket,
other items and paragraphs, and all enforcement rules. This is a computable
slice of one CONDITION norm unit, not an article-level or law-level claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/adversarial/reviews-okinawa-bracket-8m-10m.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
