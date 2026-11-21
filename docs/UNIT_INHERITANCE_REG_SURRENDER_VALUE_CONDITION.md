# Unit review — 相続税法施行規則 第三十条(6)第一号（解約返戻金相当額百万円以下）

Normative unit id: `NORM|3daed7032fbd5a44d506ecc932b48bce17af305cb0e6dbb9d5645a184086d483`

Law: 325M50000040017 (相続税法施行規則, Inheritance Tax Act Enforcement Regulations),
law number 昭和二十五年大蔵省令第十七号, law_type **MinisterialOrdinance (省令)** — a new
law type for coverage breadth (distinct from prior Acts/Cabinet Orders), revision
`325M50000040017_20260901_506M60000040016` (derived from INVENTORY `current_revision.law_revision_id`,
matched raw `revision_info.law_revision_id` — NOT guessed), snapshot
`data/raw/325M50000040017_20260901_506M60000040016.law.json`,
sha256 `a4e46e6eba52b6f8a47365590d34aff35e9eeea4bbc7186ecdace837e35b552f`.

Verbatim source text: 「解約返戻金相当額が百万円以下である生命保険契約又は損害保険契約」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[44]/Article:30/Article#30/Paragraph#6/Item#1/ItemSentence/Sentence#1` — MainProvision Article 第三十条. `find_article_text(...,"第三十条")` returns that article (len 6705) containing the needle, so the audit uses the precise article-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (a surrender-value ceiling: 解約返戻金相当額が百万円以下 = 解約返戻金相当額 ≤ ¥1,000,000, inclusive upper).

Byte fidelity: the Lean 原文 quote was injected programmatically from the queue-authoritative needle (`quote equal: True`) rather than typed, guarding against the CJK digit/kanji defect class seen in earlier turns.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This Item defines a surrender-value ceiling: 解約返戻金相当額 ≤ ¥1,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「相続税法施行規則 第三十条(6)第一号…↔ InheritanceRegSurrenderValueCondition.lean」 pinned to law 325M50000040017. Full audit: 204/204 checks passed. |
| D (decision) | PASS — audit reports `204/204 checks passed`. |
| C (competing interpretation) | The needle is one Item contributing to a surrounding definition of insurance contract class; this slice models only the surrender-value ceiling. The surrounding definition, other items/paragraphs, computation of 解約返戻金相当額, and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceRegSurrenderValueCondition.lean` — `thresholdYen=1_000_000`, `inScope x := x ≤ thresholdYen`.
- Independent spec: `specInScope x := x < Nat.succ thresholdYen` (strict-successor form, distinct); `agree_scope` universal over all surrender values.
- Boundary theorems: `at_limit` (¥1,000,000 qualifies — 以下 inclusive), `above_limit` (¥1,000,001 fails), `threshold_decoded`.
- Build: `lake build` → full build success (662 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The surrounding definition this Item contributes to, other items and paragraphs, computation of 解約返戻金相当額, and other articles. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_REG_SURRENDER_VALUE_CONDITION.md` (H/T/D/C/U per finding).
