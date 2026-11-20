# Unit review — 災害被害者租税減免等施行令 附則第三条（四百五十万円超六百万円以下）

Normative unit id: `NORM|8746221ba19978635b4364ecd7d12d09b01c13aea26958c14ab66b4f027ec141`

Law: 322CO0000000268 (災害被害者租税減免等施行令; verbatim official title
昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴税猶予等に
関する法律の施行に関する政令）), law number 昭和二十二年政令第二百六十八号,
law_type CabinetOrder (政令), revision `322CO0000000268_20251201_507CO0000000120`
(derived from INVENTORY `current_revision.law_revision_id`, matched against the
raw snapshot's `revision_info.law_revision_id` — NOT guessed),
snapshot `data/raw/322CO0000000268_20251201_507CO0000000120.law.json`,
sha256 `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`.

Verbatim source text: 「災害時の合計所得金額の見積額が四百五十万円を超え六百万円以下である被災給与所得者」

Exact source position:
`LawBody[32]/SupplProvision/SupplProvision[3]/Article:3/Article#3/Paragraph#5/Item#2/ItemSentence/Column#1/Sentence#1` — an 附則 (supplementary provision) article, so the transcription audit uses a file-kind locator (needle verbatim-unique in the whole pinned law).
Norm kind: **CONDITION** (a class-defining income interval: 四百五十万円を超え = strict > ¥4,500,000; 六百万円以下 = ≤ ¥6,000,000).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This supplementary-provision clause defines disaster salary-income earners whose estimated total income at disaster time is > ¥4,500,000 and ≤ ¥6,000,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「災害被害者租税減免等施行令 附則第三条…↔ DisasterVictimIncomeBracket.lean」 pinned to law 322CO0000000268, verbatim needle (verbatim-unique in whole law). Full audit: 191/191 checks passed. |
| D (decision) | PASS — audit reports `191/191 checks passed`. |
| C (competing interpretation) | The needle is one Item of a class definition; this slice models the income interval only. The substantive 災害被害者租税減免法, the gated tax benefit, 「災害時」 timing, other items and 省令 details are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/DisasterVictimIncomeBracket.lean` — `lowerBoundYen=4_500_000`, `upperBoundYen=6_000_000`, `inBracket x := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- Independent spec: `specInBracket x := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` — successor-based lower bound (equivalent via `Nat.succ_le_iff`, but a distinct formulation); `agree_bracket` universal over all incomes.
- Boundary theorems: `lower_exclusive` (4,500,000 fails — 超え strict), `first_qualifying` (4,500,001 qualifies), `upper_inclusive` (6,000,000 qualifies — 以下 inclusive), `above_upper` (6,000,001 fails), `bounds_decoded` (amounts decoded correctly).
- Build: `lake build` → full build success (623 jobs); all 6 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive 災害被害者租税減免法, the tax benefit this class gates, the other items of the definition, 「災害時」 timing, other paragraphs and 省令 details. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_DISASTER_VICTIM_INCOME_BRACKET.md` (H/T/D/C/U per finding).
