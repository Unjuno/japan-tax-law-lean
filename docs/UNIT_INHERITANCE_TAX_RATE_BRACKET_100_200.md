# Unit review — 相続税法 第十六条の表(1)（一億円超二億円以下）

Normative unit id: `NORM|ef39cde900972f597087b478ee9eb39ed5f8ec37898a750094d49e1cba127582`

Law: 325AC0000000073 (相続税法, Inheritance Tax Act), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (derived from
INVENTORY `current_revision.law_revision_id`, matched raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「一億円を超え二億円以下の金額」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a table cell in MainProvision Article 第十六条. `find_article_text(...,"第十六条")` returns that article (len 437) containing the needle, so the audit uses the precise article-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (a taxable-value bracket in the inheritance-tax rate table: 一億円を超え = strict > ¥100,000,000; 二億円以下 = ≤ ¥200,000,000).

Byte fidelity: all authoritative CJK strings (law title, law number, verbatim quote) were injected programmatically from INVENTORY/queue rather than typed; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE count 0). This guards against the CJK label defects found in earlier turns.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This table cell defines a taxable-value bracket: > ¥100,000,000 and ≤ ¥200,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法 第十六条の表(1) bracket 100M-200M…↔ InheritanceTaxRateBracket100_200.lean」 pinned to law 325AC0000000073. Full audit: 205/205 checks passed. |
| D (decision) | PASS — audit reports `205/205 checks passed`. |
| C (competing interpretation) | The needle is one bracket cell of a tax rate table; this slice models the interval predicate only. The rate, other brackets, base computation, deductions, rest of 別表第一, and other paragraphs are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceTaxRateBracket100_200.lean` — `lowerBoundYen=100_000_000`, `upperBoundYen=200_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct); `agree_bracket` universal over all taxable values.
- Boundary theorems: `lower_exclusive` (¥100M fails — 超え strict), `first_qualifying` (100,000,001), `upper_inclusive` (¥200M qualifies — 以下 inclusive), `above_upper` (200,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (665 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The rate for this bracket, other brackets of 別表第一, the base taxable-value computation, deductions, the rest of 別表第一, and other paragraphs. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_TAX_RATE_BRACKET_100_200.md` (H/T/D/C/U per finding).
