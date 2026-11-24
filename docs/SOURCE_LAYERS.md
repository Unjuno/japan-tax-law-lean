# Source layers (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/source_layers.py`.

The 327-law snapshot is a PROVISIONAL population. The following layers
are kept separate by legal nature and verification status; an auxiliary
layer is never folded into the statutory ledger.

- snapshot: 2026-11-15
- distinct unmatched reference names: 7526
- tax-name candidates outside ledger: 2873
- historical names / occurrences: 795 / 12977

| layer | label | legal nature | acquisition | scope | count | verification |
|---|---|---|---|---|---:|---|
| L0_STATUTE | 法律・政令・省令 | 国家法源（法律・政令・省令） | ACQUIRED_PARTIAL | PROVISIONAL_POPULATION | 327 | PARTIAL |
| L1_PROVISION | 附則・別表・経過措置 | L0 内の一部を構成する規範 | ACQUIRED_WITHIN_L0 | INCLUDED_IN_L0 | - | PARTIAL |
| L2_ORDINANCE | 地方税条例 | 自治体条例（地方自治法に基づく法源） | NOT_ACQUIRED | IN_SCOPE_BACKLOG | 1788 | BACKLOG_NOT_ACQUIRED |
| L3_TREATY | 租税条約 | 条約（国際法源）— 国内法とは効力発生の機構が異なる | NOT_ACQUIRED | IN_SCOPE_AUXILIARY_BACKLOG | - | BACKLOG_NOT_ACQUIRED |
| L4_CIRCULAR | 通達 | 行政通達（法的拘束力は条文ではなく行政内部） | NOT_ACQUIRED | IN_SCOPE_INTERPRETATION_BACKLOG | - | BACKLOG_NOT_ACQUIRED |
| L5_CASELAW | 裁判例 | 判決・裁定（法源ではなく判断例） | NOT_ACQUIRED | IN_SCOPE_INTERPRETATION_BACKLOG | - | BACKLOG_NOT_ACQUIRED |
| L6_HISTORICAL | 歴史的施行版 | 旧法・新法（同一法令の別施行版） | NOT_PINNED | HISTORICAL_LAYER | 795 | BACKLOG_NOT_PINNED |

## Obligation counts (separate denominators)

- normative_units_total: 396854
- fully_verified_units: 841
- proved_scope_units: 1
- not_started_units: 396010
- blocked_units: 2
- human_legal_reviews: 0

Separate denominators; unknown (None) means the input is absent, never zero.

No layer other than L0 has acquired content in this repository. No
completion claim is made for any layer.

## In-scope backlog (Sponsor Directive §1/§5)

Unacquired/unimplemented source families are NOT permanent exclusions.
Each remains a target and has a named next executable step:

| layer | task class | status | next action |
|---|---|---|---|
| L2_ORDINANCE | MUNICIPAL_ORDINANCE_ACQUISITION | NOT_ACQUIRED | 自治体ごとに版を固定した条例原文を取得し、規範単位に分解する |
| L3_TREATY | TREATY_ACQUISITION | NOT_ACQUIRED | 租税条約を版付きで取得し、国内法との効力発生の違いを別層で形式化する |
| L4_CIRCULAR | CIRCULAR_ACQUISITION | NOT_ACQUIRED | 通達を解釈資料レイヤーとして版付き収集し、本文規範と分離して記録する |
| L5_CASELAW | CASELAW_ACQUISITION | NOT_ACQUIRED | 裁判例を解釈資料レイヤーとして収集し、反例・対立解釈を規範と分離して記録する |
| L6_HISTORICAL | HISTORICAL_REVISION_PINNING | NOT_PINNED | 歴史的施行版を e-Gov 歴史情報から版付きで pin し、経過措置の参照を解決する |

Backlog placeholders are not evidence of acquisition, proof or legal review.
