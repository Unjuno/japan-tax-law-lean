# Unit review — 電子帳簿保存法施行規則 art.2(6)(2)（二百五十六階調以上）

Normative unit id: `NORM|f99be74c91690ed7e64d9df9919b260bb873b5750e0dc4574e67886b2e23416c`

Law: 410M50000040043 (電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則),
MinisterialOrdinance, revision `410M50000040043_20250401_507M60000040028`,
snapshot `data/raw/410M50000040043_20250401_507M60000040028.law.json`, sha256
`15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44`.

Verbatim source text: 「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。」
(verbatim-unique). Kind: **CONDITION** — gradation levels >= 256 (以上 inclusive).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item requires each RGB channel's gradation to be at least 256 levels. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「電子帳簿保存法施行規則 art.2(6)(2)…↔ Gradation256Floor.lean」 law 410M50000040043, article 第二条; needle unique. Full audit: 463/463 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第二条. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly 256; kernel theorem `floor_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The three-channel conjunction and the gated record-keeping requirements require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `gradationFloor=256`, `meetsGradationFloor g := decide (256 <= g)`.
- Independent spec: `specMeetsGradation g := decide (¬ g < 256)` (negated strict order — distinct operator); universal `agree_gradation_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_inclusive` (256 qualifies), `just_below` (255 fails), `zero_false`.
- Tests: 12 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The conjunction across 赤/緑/青 channels, the scanning and record-keeping
requirements, other items/subitems and enforcement rules. This is a computable
slice of one CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-gradation-256-floor.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
