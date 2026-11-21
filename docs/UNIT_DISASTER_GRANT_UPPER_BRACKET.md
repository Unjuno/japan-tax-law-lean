# Unit review — 災害被害者租税減免等施行令 附則第三条(5)第二号（七百五十万円超千万円以下）

Normative unit id: `NORM|288a1bc7b19ce5647fb2a5ace0f95f551be31c84058775e6ba7d297c6761a96a`

Law: 322CO0000000268 (災害被害者租税減免等施行令; official title
昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に
関する法律の施行に関する政令）), law number 昭和二十二年政令第二百六十八号,
law_type CabinetOrder (政令), revision `322CO0000000268_20251201_507CO0000000120`
(derived from INVENTORY `current_revision.law_revision_id`, matched raw
`revision_info.law_revision_id` — NOT guessed), snapshot
`data/raw/322CO0000000268_20251201_507CO0000000120.law.json`,
sha256 `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`.

Verbatim source text: 「災害時の合計所得金額の見積額が七百五十万円を超え千万円以下である被災給与所得者等」

Exact source position:
`LawBody[40]/SupplProvision/SupplProvision[3]/Article:3/Article#3/Paragraph#5/Item#2/ItemSentence/Column#1/Sentence#1` — an 附則 article. `find_article_text(...,"第三条")` returns a different 106-char main-provision article without the needle, so the audit uses a file-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (income interval: 七百五十万円を超え = strict > ¥7,500,000; 千万円以下 = ≤ ¥10,000,000; 被災給与所得者等 class). Distinct from other verified brackets in the same 附則第三条 (4.5M-6M 被災給与所得者, 6M-7.5M 被災給与所得者等, 4M-4.5M/4.5M-6M 報酬等).

Byte fidelity: all authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0 — correct 徴収 U+53CE and 滞 U+7D0D).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This clause defines a 被災給与所得者等 income bracket: > ¥7,500,000 and ≤ ¥10,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「災害被害者租税減免等施行令 附則第三条(5)第二号 bracket 7.5M-10M…↔ DisasterGrantUpperBracket.lean」. Full audit: 214/214 checks passed. |
| D (decision) | PASS — audit reports `214/214 checks passed`. |
| C (competing interpretation) | This slice models the income interval only; substantive law, gated benefit, other items, 「災害時」 timing and 省令 details out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/DisasterGrantUpperBracket.lean` — `lowerBoundYen=7_500_000`, `upperBoundYen=10_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct); `agree_bracket` universal over all incomes.
- Boundary theorems: `lower_exclusive` (7.5M fails — 超え strict), `first_qualifying` (7,500,001), `upper_inclusive` (10M — 以下 inclusive), `above_upper` (10,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (692 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive 災害被害者租税減免法, gated tax benefit, other items of the definition, 「災害時」 timing, other paragraphs and 省令 details. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_DISASTER_GRANT_UPPER_BRACKET.md`.
