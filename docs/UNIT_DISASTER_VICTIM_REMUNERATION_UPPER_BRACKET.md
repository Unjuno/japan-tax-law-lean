# Unit review — 災害被害者租税減免等施行令 附則第三条(5)第四号（四百五十万円超六百万円以下）

Normative unit id: `NORM|15ab667908d0c90131769e67aca475da403c9dd4f7b020c2bb2a96865ca48ffb`

Law: 322CO0000000268 (災害被害者租税減免等施行令; authoritative official title
昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に
関する法律の施行に関する政令） — note 徴収 U+53CE, not 徴税 U+7A0E),
law number 昭和二十二年政令第二百六十八号, law_type CabinetOrder (政令),
revision `322CO0000000268_20251201_507CO0000000120` (derived from INVENTORY
`current_revision.law_revision_id`, matched raw `revision_info.law_revision_id` — NOT guessed),
snapshot `data/raw/322CO0000000268_20251201_507CO0000000120.law.json`,
sha256 `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`.

Verbatim source text: 「災害時の合計所得金額の見積額が四百五十万円を超え六百万円以下である報酬等の支払を受ける者」

Exact source position:
`LawBody[32]/SupplProvision/SupplProvision[3]/Article:3/Article#3/Paragraph#5/Item#4/ItemSentence/Column#1/Sentence#1` — an 附則 (supplementary provision) article. Verified: `find_article_text(...,"第三条")` returns a different 106-char main-provision article without the needle, so the audit uses a file-kind locator (needle verbatim-unique in whole law).
Norm kind: **CONDITION** (an income interval: 四百五十万円を超え = strict > ¥4,500,000; 六百万円以下 = ≤ ¥6,000,000; for the 報酬等の支払を受ける者 class). Distinct norm unit from NORM|8746221ba199 (被災給与所得者 Item 2) and NORM|8fb64d19e (報酬等 Item 3, 4M–4.5M).

Byte fidelity: the Lean 原文 quote and the audit needle were each compared byte-for-byte against the queue-authoritative needle (`json.dumps(..., ensure_ascii=True)`) and found equal; the law-title label uses the correct 徴収 U+53CE (the prior 徴税 U+7A0E defect class is guarded against).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This supplementary-provision clause defines 報酬等 recipients whose estimated total income at disaster time is > ¥4,500,000 and ≤ ¥6,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「災害被害者租税減免等施行令 附則第三条(5)第四号…↔ DisasterVictimRemunerationUpperBracket.lean」 pinned to law 322CO0000000268. Full audit: 197/197 checks passed. |
| D (decision) | PASS — audit reports `197/197 checks passed`. |
| C (competing interpretation) | The needle is one Item of a class definition; this slice models the income interval only. The substantive 災害被害者租税減免法, the gated tax benefit, 「災害時」 timing, other items and 省令 details are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/DisasterVictimRemunerationUpperBracket.lean` — `lowerBoundYen=4_500_000`, `upperBoundYen=6_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (successor-based lower bound, distinct formulation); `agree_bracket` universal over all incomes.
- Boundary theorems: `lower_exclusive` (4,500,000 fails — 超え strict), `first_qualifying` (4,500,001), `upper_inclusive` (6,000,000 qualifies — 以下 inclusive), `above_upper` (6,000,001 fails), `bounds_decoded`.
- Build: `lake build` → full build success (641 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive 災害被害者租税減免法, the tax benefit this class gates, the other items of the definition, 「災害時」 timing, other paragraphs and 省令 details. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_DISASTER_VICTIM_REMUNERATION_UPPER_BRACKET.md` (H/T/D/C/U per finding).
