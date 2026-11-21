# Unit review — 相続税法 第三十八条(4)（延滞税額百万円以下かつ延滞期間三年以下の例外）

Normative unit id: `NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156`

Law: 325AC0000000073 (相続税法, Inheritance Tax Act), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (derived from
INVENTORY `current_revision.law_revision_id`, matched raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「ただし、その延滞税額が百万円以下で、かつ、その延滞期間が三年以下である場合は、この限りでない」
(note: 滞 is U+7D0D, NOT 滯 U+6EDE — a byte-fidelity defect in the author's first typed quote
was caught by the pre-build check and corrected).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[5]/Article:38/Article#38/Paragraph#4/ParagraphSentence/Sentence#2` — MainProvision Article 第三十八条. `find_article_text(...,"第三十八条")` returns that article (len 1052) containing the needle, so the audit uses the precise article-kind locator (needle verbatim-unique in whole law).
Norm kind: **EXCEPTION** — conjunctive exception condition: 延滞税額 ≤ ¥1,000,000 (百万円以下, inclusive) AND 延滞期間 ≤ 3 years (三年以下, inclusive); 「この限りでない」 overrides a preceding rule (not modeled).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The exception applies iff 延滞税額 ≤ ¥1,000,000 AND 延滞期間 ≤ 3 years. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法 第三十八条(4)…↔ InheritanceTaxDelinquencyException.lean」 pinned to law 325AC0000000073. Full audit: 202/202 checks passed. |
| D (decision) | PASS — audit reports `202/202 checks passed`. |
| C (competing interpretation) | The needle is an EXCEPTION clause overriding a preceding rule; this slice models only the conjunctive condition. The overridden rule, computation of 延滞税額/延滞期間, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Byte-fidelity defect caught and fixed during development

The author's first typed quote and audit needle used `滯` (U+6EDE) instead of authoritative
`滞` (U+7D0D) at both 延滞税額 / 延滞期間 positions. A pre-build byte-fidelity check against
the queue-authoritative needle caught it. The Lean quote was fixed by codepoint replacement.
A global replacement in the audit script broke 3 unrelated checks; the script was restored
from HEAD and only this unit's check re-inserted with a byte-exact needle emitted via `\u`
escapes from the queue. Full audit then passed 202/202.

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceTaxDelinquencyException.lean` — `maxDelinquencyYen=1_000_000`, `maxPeriodYears=3`, `exceptionApplies y p := y ≤ maxDelinquencyYen ∧ p ≤ maxPeriodYears`.
- Independent spec: `specException y p := y < Nat.succ maxDelinquencyYen ∧ p < Nat.succ maxPeriodYears` (successor-based strict form, distinct); `agree_exception` universal over all amounts and periods.
- Boundary theorems: `at_limit` (both at limit qualify), `amount_above` (¥1,000,001 fails), `period_above` (4 years fails), `both_below` (qualify), `constants_decoded`.
- Build: `lake build` → full build success (656 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The preceding rule that 「この限りでない」 overrides, how 延滞税額 and 延滞期間 are computed,
other paragraphs and other articles. This is a computable slice of one EXCEPTION norm unit,
not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_TAX_DELINQUENCY_EXCEPTION.md` (H/T/D/C/U per finding).
