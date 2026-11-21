# Unit review — 東日本大震災特例法 art.38-2(2)(4)イ（工事費用百万円以上）

Normative unit id: `NORM|894f40b7793d3fa713c8a984bee8ac458702a9b16af5b9a67796ad467c38c776`

Law: 423AC0000000029 (東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律),
Act, revision `423AC0000000029_20260401_508AC0000000012`, snapshot
`data/raw/423AC0000000029_20260401_508AC0000000012.law.json`, sha256
`87125cf7c2562c5be34270498efc007cfd80abbec74aa372a9ffac93bec74c3f`.

Verbatim source text: 「当該工事に要した費用の額が百万円以上であること。」
(verbatim-unique in the whole law). Kind: **CONDITION** — construction expense
>= ¥1,000,000 (以上 inclusive lower bound).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This subitem defines an expense floor: 工事費用 >= ¥1,000,000 (以上, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「東日本大震災特例法 art.38-2(2)(4)イ…↔ QuakeReconstructionExpenseFloor1M.lean」 law 423AC0000000029, article 第三十八条の二; needle unique. Full audit: 257/257 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第三十八条の二. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly ¥1,000,000; kernel theorem `floor_inclusive` rejects that reading. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The gated tax measure, 当該工事 and 被災者等 definitions require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `expenseFloor=1_000_000`, `meetsExpenseFloor a := decide (expenseFloor <= a)`.
- Independent spec: `specMeetsExpense a := decide (¬ a < specExpenseFloor)` (negated strict order — distinct operator); universal `agree_expense_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_inclusive` (1M qualifies), `just_below` (999,999 fails), `zero_false`.
- Tests: 11 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The gated tax measure, 当該工事/被災者等 definitions, other subitems/items/
paragraphs and enforcement rules. This is a computable slice of one CONDITION
norm unit, not an article-level claim.

## Adversarial review

See `docs/adversarial/reviews-quake-expense-floor-1m.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
