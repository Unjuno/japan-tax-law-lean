# Unit review — 災害被害者租税減免法 第三条(8)（政令委任）DELEGATION

Normative unit id: `NORM|461a25ff05dbe9b4341873be8a70db1f63f9c3199c5e93c95068a9ac567e4db7`

Law: 322AC0000000175, 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）, Act. Raw snapshot SHA-256 `c3bb5b0b…f5f4e7ef` (this unit is from a DIFFERENT law than the customs-tariff units).

Verbatim source text: 「前項に定めるもののほか、第一項から第六項までの規定の適用に関し必要な事項は、政令で定める。」 (needle injected from the queue). Source paragraph range 1..6 and the 政令 (Cabinet Order) authority are extracted structurally from the needle.

Exact source position: `LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#8/ParagraphSentence/Sentence#1`. Article 第三条 has no caption.

Norm kind: **DELEGATION** — matters necessary for applying paragraphs 1–6 are prescribed by Cabinet Order, supplementing the preceding paragraph.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The prescription authority is 政令 (Cabinet Order), not the Act or a ministerial ordinance; source range 1..6. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefArt3CabinetOrderDelegation.lean. |
| D | PASS — transcription audit 458/458. |
| C | Only the delegating structure modeled; ordinance content and substantive application out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefArt3CabinetOrderDelegation.lean` — `Authority` (act/cabinetOrder/ministerialOrdinance), `prescriptionAuthority=cabinetOrder`, `sourceParagraphLo=1`, `sourceParagraphHi=6`, `supplementsPrevParagraph=true`.
- Independent spec: `SpecDelegation` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (unfold + `⟨rfl,…⟩`).
- Build: full lake build success (1417 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Development failure records
1. Two `by decide` proofs failed with "failed to synthesize" — `DecidableEq Authority` was missing. Fix: `deriving instance DecidableEq for Authority`.
2. Spec's `implementation_satisfies_spec := by rfl` failed because the conjunction needs constructor application. Fix: `unfold SpecDelegation …; exact ⟨rfl, rfl, rfl, rfl⟩`.
Both fixed; no gate weakened.

## Not modelled
Ordinance content, substantive application of paragraphs 1–6, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ART3_CABINET_ORDER_DELEGATION.md`.
