# Unit review — 石油石炭税法施行令 art.13(3)（相続人が二人以上）

Normative unit id: `NORM|27ba36ac793253dc18c7e0d51b413a5554ceb6c5287167eb62ade42a81a59f3a`

Law: 353CO0000000132 (石油石炭税法施行令), CabinetOrder, revision
`353CO0000000132_20250401_507CO0000000006`, snapshot
`data/raw/353CO0000000132_20250401_507CO0000000006.law.json`, sha256
`a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d`.

Verbatim source text: 「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」
(verbatim-unique). Kind: **CONDITION** — heir count >= 2.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item sets the heir-count threshold at two or more for the joint-declaration requirement. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/JointHeirDeclarationThreshold.json`: law 353CO0000000132, article 第十三条, verbatim needle unique. Transcription audit 473/473 passed; generator checks pass. |
| D (decision) | PASS — needle located uniquely in scoped Article 第十三条; 二人 = 2 verified. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly two heirs; kernel theorem `floor_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The declaration content and 連署 procedure require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `heirFloor=2`, `needsJointDeclaration h := decide (2 <= h)`.
- Independent spec: `specNeedsJoint h := decide (¬ h < 2)` (negated strict order — distinct operator); universal `agree_heir_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_inclusive` (2 qualifies), `one_false`, `three_true`.
- Tests: 10 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The declaration content, 連署 procedure, preceding paragraph, other paragraphs
and enforcement rules. This is a computable slice of one CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-joint-heir-declaration-threshold.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
