# Unit review — 関税暫定措置法 第十六条(1)（罰則: 拘禁刑 12月以下 又は 罰金 200万円以下）

Normative unit id: `NORM|73d5c75ef83e6b9a1c99a74d31835bff840a92e8813407f099b58a630c21ad9e`

Law: 335AC0000000036 (関税暫定措置法), law number 昭和三十五年法律第三十六号,
law_type Act (法律), revision `335AC0000000036_20260401_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/335AC0000000036_20260401_508AC0000000005.law.json`,
sha256 `5528f6f312c8afd280b926f766916a70b1683f071046ad88677370641291e938`.

Verbatim source text: 「次の各号のいずれかに該当する者は、一年以下の拘禁刑又は二百万円以下の罰金に処する。」

Exact source position:
`LawBody[1]/MainProvision/MainProvision[32]/Article:16/Article#16/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第十六条, caption （罰則）. `find_article_text(...,"第十六条")` returns that article (len 160) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a penalty clause with alternatives (「又は」): imprisonment ≤ 12 months (一年以下) OR fine ≤ ¥2,000,000 (二百万円以下). Both ceilings inclusive (以下); both derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric ceilings) injected programmatically from authoritative sources; descriptive prose is hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The penalty ceilings are imprisonment ≤ 12 months OR fine ≤ ¥2,000,000 (inclusive, alternative). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「penalty imprisonment 12mo OR fine 2M yen…↔ CustomsTemporaryMeasurePenalty.lean」. Full audit: 232/232 checks passed. |
| D (decision) | PASS — audit reports `232/232 checks passed`. |
| C (competing interpretation) | Only numeric ceilings + alternative relationship are modeled. The violation conditions (各号), sentencing, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTemporaryMeasurePenalty.lean` — inductive `Penalty` (imprisonment months / fine yen), `maxImprisonmentMonths=12`, `maxFineYen=2_000_000`, `withinLimits` Bool; 「又は」= alternative.
- Independent spec: `specWithinLimits : Penalty -> Prop` successor-strict form; `agree_within_limits` universal & axiom-free (`Nat.le_of_ble_eq_true`, `Nat.ble_eq_true_of_le`, `Nat.le_of_lt_succ`).
- Boundary checks: imprisonment 12 ok / 13 fails; fine 2,000,000 ok / 2,000,001 fails.
- Build: `lake build` → full build success (746 jobs); theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Violation conditions (各号), actual sentencing, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TEMPORARY_MEASURE_PENALTY.md`.
