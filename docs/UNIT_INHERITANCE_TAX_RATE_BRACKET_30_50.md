# Unit review — 相続税法 第十六条 別表第一(1)（三千万円超五千万円以下）

Normative unit id: `NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b`

Law: 325AC0000000073 (相続税法, Inheritance Tax Act), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (derived from
INVENTORY `current_revision.law_revision_id`, matched raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「三千万円を超え五千万円以下の金額」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a table cell in MainProvision Article 第十六条. `find_article_text(...,"第十六条")` returns that article (len 437) containing the needle, so the audit uses the precise article-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (a taxable-value bracket in the inheritance tax rate table: 三千万円を超え = strict > ¥30,000,000; 五千万円以下 = ≤ ¥50,000,000).

Byte fidelity: the Lean 原文 quote and the audit needle were each compared byte-for-byte against the queue-authoritative needle (`json.dumps(..., ensure_ascii=True)`) and found equal.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This table cell defines a taxable-value bracket: > ¥30,000,000 and ≤ ¥50,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法 第十六条 別表第一(1)…↔ InheritanceTaxRateBracket30_50.lean」 pinned to law 325AC0000000073. Full audit: 201/201 checks passed. |
| D (decision) | PASS — audit reports `201/201 checks passed`. |
| C (competing interpretation) | The needle is one bracket cell of a tax rate table; this slice models the interval predicate only. The rate for this bracket, other brackets, base computation, deductions, the rest of 別表第一, and other paragraphs are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceTaxRateBracket30_50.lean` — `lowerBoundYen=30_000_000`, `upperBoundYen=50_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct formulation); `agree_bracket` universal over all taxable values.
- Boundary theorems: `lower_exclusive` (30,000,000 fails — 超え strict), `first_qualifying` (30,000,001), `upper_inclusive` (50,000,000 qualifies — 以下 inclusive), `above_upper` (50,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (653 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The rate for this bracket, other brackets of 別表第一, the base taxable-value computation, deductions, the rest of 別表第一, and other paragraphs. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_TAX_RATE_BRACKET_30_50.md` (H/T/D/C/U per finding).
