# Unit review — 相続税法 第十六条の表(1)（二億円超三億円以下）

Normative unit id: `NORM|c3d2149ef0b13b932aab3cea60cf22e9f8ed6a661e1e8660186fb6a35cf5fabc`

Law: 325AC0000000073 (相続税法, Inheritance Tax Act), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (derived from
INVENTORY `current_revision.law_revision_id`, matched raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「二億円を超え三億円以下の金額」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a table cell in MainProvision Article 第十六条. `find_article_text(...,"第十六条")` returns that article (len 437) containing the needle, so the audit uses the precise article-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (a taxable-value bracket in the inheritance tax rate table: 二億円を超え = strict > ¥200,000,000; 三億円以下 = ≤ ¥300,000,000).

Label note: the rate table is 「第十六条の表」 (an Article 16 `TableStruct`), NOT 別表第一. A prior unit (NORM|ef39cde9) carried a false 別表第一 label, reproduced and fixed in turn28. This unit uses the correct label from the start.

Byte fidelity: all authoritative CJK strings (law title, law number, verbatim quote) were injected programmatically from INVENTORY/queue rather than typed; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, 別表第一=0, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This table cell defines a taxable-value bracket: > ¥200,000,000 and ≤ ¥300,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法 第十六条の表(1) bracket 200M-300M…↔ InheritanceTaxRateBracket200_300.lean」 pinned to law 325AC0000000073. Full audit: 206/206 checks passed. |
| D (decision) | PASS — audit reports `206/206 checks passed`. |
| C (competing interpretation) | The needle is one bracket cell of a tax rate table; this slice models the interval predicate only. The rate, other brackets, base computation, deductions, the rest of 第十六条の表, and other paragraphs are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceTaxRateBracket200_300.lean` — `lowerBoundYen=200_000_000`, `upperBoundYen=300_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct); `agree_bracket` universal over all taxable values.
- Boundary theorems: `lower_exclusive` (¥200M fails — 超え strict), `first_qualifying` (200,000,001), `upper_inclusive` (¥300M qualifies — 以下 inclusive), `above_upper` (300,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (668 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The rate for this bracket, other brackets of 第十六条の表, the base taxable-value computation, deductions, the rest of the table, and other paragraphs. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_TAX_RATE_BRACKET_200_300.md` (H/T/D/C/U per finding).
