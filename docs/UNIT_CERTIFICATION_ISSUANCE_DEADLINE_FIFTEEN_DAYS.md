# Unit review — 特定国等証明書発給省令 art.2(4)（十五日以内）

Normative unit id: `NORM|e3f96720f013bcbb5689c22af36d821a4342cd90bcb9a667f1bd983a7e93bbe1`

Law: 508M60000400060 (ニッケル系ステンレス冷延鋼帯及び冷延鋼板に対して課する不当廉売関税に関する政令第一条第三項に規定する特定国等において熱延鋼帯について冷間圧延をする工程を経て製造されていない旨の証明書の発給に関する省令), MinisterialOrdinance, revision
`508M60000400060_20261031_508M60000400078`, snapshot
`data/raw/508M60000400060_20261031_508M60000400078.law.json`, sha256
`b6e8cafa58a7ad7abefdaae2ae12dfb072104c3e69a18956fcf8759e35e9a901`.

Verbatim source text: 「第一項の規定による証明書の交付は、交付申請を経済産業大臣が受理した日から十五日以内にするものとする。」 (verbatim-unique).
Kind: **REFERENCE** — issuance deadline within 15 days of acceptance.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The certificate must be issued within fifteen days of the Minister's acceptance of the application. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/CertificationIssuanceDeadlineFifteenDays.json`: law 508M60000400060, article 第二条, verbatim needle unique. Generator checks pass; `spec_literals = {15}` verified against 原文. |
| D (decision) | PASS — needle located uniquely in scoped Article 第二条/Paragraph 4; 十五 = 15 verified. |
| C (competing interpretation) | Reading 以内 as strict `<` would reject exactly fifteen days; `fifteen_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The application requirements, the accepting authority, counting rules and other paragraphs require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `issuanceDeadlineDays=15`, `withinIssuanceDeadline d := decide (d <= 15)`.
- Independent spec: own constant, 以内 as negated strict order (`¬ 15 < d`); universal `agree_issuance_deadline` over all Nat by structural recursion, axiom-free.
- Boundary theorems: `fifteen_inclusive`, `sixteen_false`, `fourteen_true`.
- Tests: 10 kernel-decided examples; boundary categories with the statutory literal: `{zero, saturation, threshold_below, threshold_at, threshold_above}`.

## Not modelled (explicitly retained as unhandled scope)

Application requirements, the accepting authority, how days are counted,
other paragraphs and enforcement rules. This is a computable slice of one
REFERENCE norm unit.

## Adversarial review

See `docs/adversarial/reviews-certification-issuance-deadline-fifteen-days.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
