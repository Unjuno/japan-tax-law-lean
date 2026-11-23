# Unit review — 情報通信技術活用省令 art.5(2)(2)（二百五十六階調以上）

Normative unit id: `NORM|d74340473e54a94163ee5d61d028c0fa4379a44d178ca21a314441520806eaf6`

Law: 415M60000040071 (国税関係法令に係る情報通信技術を活用した行政の推進等に関する省令),
MinisterialOrdinance, revision `415M60000040071_20260924_506M60000040031`,
snapshot `data/raw/415M60000040071_20260924_506M60000040031.law.json`, sha256
`ee7ca0224460193ba599803eb2267eabf81eb00a30f36d5905cbb4cd355f9975`.

Verbatim source text: 「白色から黒色までの階調が二百五十六階調以上であること。」
(verbatim-unique). Kind: **CONDITION** — grayscale gradation levels >= 256.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item requires grayscale gradation from white to black of at least 256 levels. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「情報通信技術活用省令 art.5(2)(2)…↔ GrayscaleGradationFloor.lean」 law 415M60000040071, article 第五条; needle unique. Full audit: 456/456 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第五条. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly 256; kernel theorem `floor_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The gated imaging/record-keeping requirements and 白色/黒色 definitions require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `gradationFloor=256`, `meetsGrayscaleFloor g := decide (256 <= g)`.
- Independent spec: `specMeetsGrayscale g := decide (¬ g < 256)` (negated strict order — distinct operator); universal `agree_grayscale_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_inclusive` (256 qualifies), `just_below` (255 fails), `zero_false`.
- Tests: 11 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The gated imaging/record-keeping requirements, 白色/黒色 definitions, other
items/paragraphs and enforcement rules. This is a computable slice of one
CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-grayscale-gradlevel-floor.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
