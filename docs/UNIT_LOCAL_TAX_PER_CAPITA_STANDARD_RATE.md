# Unit review — 地方税法 第三百十条（個人の均等割 標準税率: ¥3,000）

Normative unit id: `NORM|6c043582d2da5058b6951c3490ea577d84a5afd9b21669f9a8c4c5d579a77f5e`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「個人の均等割の標準税率は、三千円とする。」 (三千円 = ¥3,000).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[2]/Article:310/Article#310/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第三百十条, caption （個人の均等割の税率）. `find_article_text(...,"第三百十条")` returns that article (len 36) containing the needle → article-kind locator used.

Norm kind: **EFFECT** — the standard rate (標準税率) for 個人の均等割 is ¥3,000 (三千円), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, the statutory term 個人の均等割, numeric rate) injected programmatically from authoritative sources — the term is extracted from the needle itself; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The standard rate is ¥3,000 per person (均等割). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「per capita flat tax standard rate 3000 yen…↔ LocalTaxPerCapitaStandardRate.lean」. Full audit: 254/254 checks passed. |
| D (decision) | PASS — audit reports `254/254 checks passed`. |
| C (competing interpretation) | Only the standard rate and linear extension are modeled. Local rate variation, tax base, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxPerCapitaStandardRate.lean` — `standardRateYen=3_000` (programmatically derived); `standardTaxYen persons := rate * persons`.
- Independent spec: `specTaxYen := Nat.rec 0 (fun _ acc => acc + rate) persons` (repeated addition, distinct); `agree_tax` & `mul_eq_accumulate` universal & axiom-free.
- Boundary checks: 1 person = 3,000; 2 persons = 6,000.
- Build: `lake build` → full build success (812 jobs); 2 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Local rate variation, tax base, other paragraphs and articles. Computable slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_PER_CAPITA_STANDARD_RATE.md`.
