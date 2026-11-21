# Unit review — 相続税法 第二十一条の七（贈与税の税率, 上欄区分 二百万円を超え三百万円以下の金額）

Normative unit id: `NORM|a1c39d3977b9d2a68fc6dd7125b555369ca7e764597c9b9c4673c8d94ae83941`

Law: 325AC0000000073 (相続税法, Inheritance Tax Act), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「二百万円を超え三百万円以下の金額」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — MainProvision Article 第二十一条の七, caption （贈与税の税率）. `find_article_text(...,"第二十一条の七")` returns that article (len 253) containing the needle → article-kind locator used.

Statutory context: Article 21-7 is the **贈与税 (gift tax) rate table** (not the 相続税 rate table of art.16). The needle is an upper-column (上欄に掲げる金額 — a descriptive gloss, not a verbatim statutory label; the phrase 課税価格の区分 does not occur in this law) bracket; the paired lower-column rate (15% = 百分の十五) is a separate table cell / normative unit and is NOT modelled here.

Norm kind: **CONDITION** — bracket interval (¥2,000,000, ¥3,000,000]: lower EXCLUSIVE (を超え strict >), upper INCLUSIVE (以下 ≤).

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The bracket is 2,000,000 < amount ≤ 3,000,000 (exclusive lower, inclusive upper). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法 第二十一条の七 gift-tax rate bracket 2M-3M…↔ InheritanceGiftTaxRateBracket2M3M.lean」. Full audit: 223/223 checks passed. |
| D (decision) | PASS — audit reports `223/223 checks passed`. |
| C (competing interpretation) | Only the bracket interval is modeled. The paired 15% rate, other brackets, deduction rules (前二条), other paragraphs and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceGiftTaxRateBracket2M3M.lean` — `lowerExclusiveYen=2_000_000`, `upperInclusiveYen=3_000_000`, `inBracket amount := lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen`.
- Independent spec: `specInBracket amount := Nat.succ lowerExclusiveYen ≤ amount ∧ amount < Nat.succ upperInclusiveYen` (successor-based half-open interval, distinct); `agree_in_bracket` universal over all amounts, axiom-free.
- Boundary checks: 2,000,000 excluded; 2,000,001 included; 3,000,000 included; 3,000,001 excluded.
- Build: `lake build` → full build success (719 jobs); theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Paired 15% rate cell, other brackets, 前二条 deduction rules, other paragraphs and other articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_GIFT_TAX_BRACKET_2M_3M.md`.
