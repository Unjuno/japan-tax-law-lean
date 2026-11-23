# Unit review — 租税条約等実施特例法施行令 art.6-3(16)(3)（特定取引契約資産額十万円以下）

Normative unit id: `NORM|7e12ccd9d760be2c3ed177e4d172b5eea5ff1d350aa8eb4a23ee7313025e8ce8`

Law: 362CO0000000335 (租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令),
CabinetOrder, revision `362CO0000000335_20260521_506CO0000000150`, snapshot
`data/raw/362CO0000000335_20260521_506CO0000000150.law.json`, sha256
`8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18`.

Verbatim source text: 「令和七年十二月三十一日における対象特定取引に係る特定取引契約資産額が十万円以下であること。」
(verbatim-unique in the whole law). Kind: **CONDITION** — asset amount <= ¥100,000
(以下 inclusive upper bound), evaluated at the specified date.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item defines an asset ceiling: 特定取引契約資産額 <= ¥100,000 (以下, inclusive) at 令和七年十二月三十一日. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「租税条約等実施特例法施行令 art.6-3(16)(3)…↔ TreatyAssetCeiling100K.lean」 law 362CO0000000335, article 第六条の三; needle unique. Full audit: 430/430 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第六条の三. |
| C (competing interpretation) | Reading 以下 as strict `<` would reject exactly ¥100,000; the kernel theorem `ceiling_inclusive` rejects that reading. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The reference date, 対象特定取引/特定取引契約資産額 identification and the gated effect require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `assetCeiling=100_000`, `withinAssetCeiling a := decide (a <= assetCeiling)`.
- Independent spec: `specWithinAsset a := decide (¬ specAssetCeiling < a)` (negated strict order — distinct operator); universal `agree_asset_ceiling` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `ceiling_inclusive` (100,000 qualifies), `first_above` (100,001 fails), `zero_true`.
- Tests: 11 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The reference date 令和七年十二月三十一日, 対象特定取引/特定取引契約資産額
definitions, the gated legal effect, other items/paragraphs, and enforcement
rules. This is a computable slice of one CONDITION norm unit, not an
article-level claim.

## Adversarial review

See `docs/adversarial/reviews-treaty-asset-ceiling-100k.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
