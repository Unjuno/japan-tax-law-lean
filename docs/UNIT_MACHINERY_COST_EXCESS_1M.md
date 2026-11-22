# Unit review — 沖縄振興省令 art.4(1)(3)ロ（機械装置取得価額百万円超）

Normative unit id: `NORM|c04fbcd7afdfbd2789ed292aed888fce9110f73ce74c9c5ced62c87e82924d41`

Law: 414M60000008042 (沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令),
MinisterialOrdinance, revision `414M60000008042_20250401_507M60000008028`,
snapshot `data/raw/414M60000008042_20250401_507M60000008028.law.json`, sha256
`5aca579dacd513116533f1a62abe88320dd4fdf5200b57d45973f41cd6fa1182`.

Verbatim source text: 「イに掲げるもののほか、機械及び装置で、これらの取得価額の合計額が百万円を超えるもの」
(verbatim-unique in the whole law). Kind: **CONDITION** — sum of acquisition
costs > ¥1,000,000 (超える strict lower bound).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This subitem defines a cost threshold: 取得価額の合計額 > ¥1,000,000 (超える, strict). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「沖縄振興省令 art.4(1)(3)イ…↔ MachineryCostExcess1M.lean」 law 414M60000008042, article 第四条; needle unique. Full audit: 395/395 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第四条. |
| C (competing interpretation) | Reading 超える as inclusive 以上 would admit exactly ¥1,000,000; the kernel theorem `floor_exclusive` rejects that reading. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The ロ category, gated tax exemption and 機械及び装置 definition require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `costFloor=1_000_000`, `exceedsCostFloor t := decide (costFloor < t)`.
- Independent spec: `specExceedsCost t := decide (Nat.succ specCostFloor <= t)` (successor-based strict bound — distinct operator); universal `agree_cost_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_exclusive` (1M fails — strict), `first_above` (1,000,001 qualifies), `zero_false`.
- Tests: 11 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The ロ category, the gated tax exemption/non-uniform taxation, 機械及び装置
definitions, other items/subitems and enforcement rules. This is a computable
slice of one CONDITION norm unit, not an article-level claim.

## Adversarial review

See `docs/adversarial/reviews-machinery-cost-excess-1m.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
