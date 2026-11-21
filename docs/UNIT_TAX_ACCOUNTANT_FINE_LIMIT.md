# Unit review — 税理士法 第六十一条(1)（罰金: 百万円以下）

Normative unit id: `NORM|b184122a9d2a8592751ebeb1a6872fbc6be6328b78f6a6febe1119ff04f6dc67`

Law: 326AC1000000237 (税理士法, Tax Accountant Act), law number 昭和二十六年法律第二百三十七号,
law_type Act (法律), revision `326AC1000000237_20251001_505AC0000000053` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/326AC1000000237_20251001_505AC0000000053.law.json`,
sha256 `46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f`.

Verbatim source text: 「次の各号のいずれかに該当する場合には、その違反行為をした者は、百万円以下の罰金に処する。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[8]/Article:61/Article#61/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第六十一条 (no caption). `find_article_text(...,"第六十一条")` returns that article (len 109) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a FINE-ONLY penalty clause: fine ≤ ¥1,000,000 (百万円以下, inclusive). Items 1–3 reference 第五十三条 violations.

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0). The ¥1,000,000 constant was derived programmatically from the verbatim needle's kanji numeral 百万円 (not hand-typed).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The fine ceiling is ¥1,000,000 (百万円以下, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「税理士法 第六十一条(1) fine ceiling 100万円…↔ TaxAccountantFineLimit.lean」. Full audit: 227/227 checks passed. |
| D (decision) | PASS — audit reports `227/227 checks passed`. |
| C (competing interpretation) | Only the fine ceiling is modeled. Violation conditions (各号 / 第五十三条), sentencing, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/TaxAccountantFineLimit.lean` — `maxFineYen=1_000_000` (programmatically derived from 百万円), `withinFineLimit fine := fine ≤ maxFineYen`.
- Independent spec: `specWithinFineLimit fine := fine < Nat.succ maxFineYen` (successor-strict form, distinct); `agree_fine_limit` universal over all fines, axiom-free.
- Boundary theorems: `at_ceiling` (¥1,000,000 qualifies — 以下 inclusive), `above_ceiling` (¥1,000,001 fails), `ceiling_decoded`.
- Build: `lake build` → full build success (731 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Violation conditions (各号 / 第五十三条), imprisonment (none in this clause), actual sentencing, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_TAX_ACCOUNTANT_FINE_LIMIT.md`.
