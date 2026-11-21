# Unit review — 地方税法 第七十二条の二十四の七(1)第三号（年四百万円超年八百万円以下）

Normative unit id: `NORM|5fabf587efefedb1bf83283e26ba09486268120cb013adc7cf04d058d359c414`

Law: 325AC0000000226 (地方税法, Local Tax Act), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (derived from
INVENTORY `current_revision.law_revision_id`, matched raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「各事業年度の所得のうち年四百万円を超え年八百万円以下の金額」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:72_24_7/Article#72_24_7/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a table cell in MainProvision Article 第七十二条の二十四の七. `find_article_text(...,"第七十二条の二十四の七")` returns that article (len 2821) containing the needle — the exact full title is essential (the shorter 第七十二条の二十四 returns a different 209-char article without the needle). Article-kind locator used.
Norm kind: **CONDITION** (income bracket: 四百万円を超え = strict > ¥4,000,000; 八百万円以下 = ≤ ¥8,000,000).

Byte fidelity: all authoritative CJK strings (title, law number, quote) injected programmatically; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This table cell defines an income bracket: > ¥4,000,000 and ≤ ¥8,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「地方税法 第七十二条の二十四の七(1)第三号 bracket 4M-8M…↔ LocalTaxIncomeBracket4_8.lean」. Full audit: 215/215 checks passed. |
| D (decision) | PASS — audit reports `215/215 checks passed`. |
| C (competing interpretation) | This slice models the interval predicate only; the rate, other brackets, surrounding computation, other items/paragraphs and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxIncomeBracket4_8.lean` — `lowerBoundYen=4_000_000`, `upperBoundYen=8_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct); `agree_bracket` universal.
- Boundary theorems: `lower_exclusive` (4M fails — 超え strict), `first_qualifying` (4,000,001), `upper_inclusive` (8M — 以下 inclusive), `above_upper` (8,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (695 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The rate for this bracket, other brackets, the surrounding computation, other items/paragraphs and other articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_INCOME_BRACKET_4_8.md`.
