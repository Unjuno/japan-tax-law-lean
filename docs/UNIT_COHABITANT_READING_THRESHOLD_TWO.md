# Unit review — 能登半島地震臨時特例法等施行令 art.2(2)（二人以上）

Normative unit id: `NORM|e713fefceeb078384dd5e386ecdeab7c8fa82cb5b85adb34fb8e9028deb1bdbe`

Law: 506CO0000000033 (令和六年能登半島地震災害の被災者に係る所得税法及び災害被害者に対する租税の減免、徴収猶予等に関する法律の臨時特例に関する法律施行令), CabinetOrder, revision
`506CO0000000033_20240221_000000000000000`, snapshot
`data/raw/506CO0000000033_20240221_000000000000000.law.json`, sha256
`f3a109796defc2d4af7372e2b174c464ee905eee92a73bc0df84a92e70a1df53`.

Verbatim source text: 「所得税法施行令第二百五条第二項の規定は、前項に規定する親族と生計を一にする居住者が二人以上ある場合について準用する。」 (verbatim-unique).
Kind: **READING** — a 準用 (reading-in) triggered by a cohabitant count of at least two.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The cross-law reading-in applies when two or more cohabiting relatives reside together. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/CohabitantReadingThresholdTwo.json`: law 506CO0000000033, article 第二条, verbatim needle unique. Generator checks pass; `spec_literals = {2}` verified against 原文. |
| D (decision) | PASS — needle located uniquely in scoped Article 第二条/Paragraph 2; 二 = 2 verified. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly two; `two_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The content of 所得税法施行令第二百五条第二項, the definition of cohabiting relatives and other paragraphs require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `cohabitantFloor=2`, `appliesReading n := decide (2 <= n)`.
- Independent spec: own constant, 以上 as negated strict order (`¬ n < 2`); universal `agree_cohabitant_floor` over all Nat by structural recursion, axiom-free.
- Boundary theorems: `two_inclusive`, `one_false`, `three_true`.
- Tests: 10 kernel-decided examples; 6 boundary categories including threshold_below/at/above.

## Not modelled (explicitly retained as unhandled scope)

The cross-law provision read in, the definition of 生計を一にする居住者, the
preceding paragraph, other paragraphs and enforcement rules. This is a
computable slice of one READING norm unit's count condition.

## Adversarial review

See `docs/adversarial/reviews-cohabitant-reading-threshold-two.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
