# Source layers (machine-generated)

Do not hand-edit. Regenerate with `scripts/law_audit/inventory/source_layers.py`.

The 327-law ledger is a provisional subset, not the whole Japanese tax
universe. Every layer is kept separate; auxiliary layers are never counted
as statutory targets or as verified obligations (Objective §2/§5).

- snapshot: 2026-11-15
- historical-version reference occurrences (kept separate): unknown (discovery ledger absent on this branch)
- all-complete claimable: False

| layer | legal nature | enumeration | declared | enumerated | acquired | target | verified |
|---|---|---|---:|---:|---:|:--:|:--:|
| NATIONAL_TAX_STATUTE | 国法上の法源（法律・政令・省令・規則） | ENUMERATED_PINNED | 327 | 327 | 325 | yes | no |
| RELATED_STATUTE_DISCOVERED | 国法上の法源（名称に '税' を含まない関連法令） | ENUMERATED_PARTIAL | - | 217 | 217 | yes | no |
| LOCAL_TAX_ORDINANCE | 自治体ごとに独立した法源（条例） | UNENUMERATED | 1788 | - | 0 | yes | no |
| TAX_TREATY | 条約（国内法令とは法源の性質が異なる） | UNENUMERATED | - | - | 0 | no | no |
| ADMINISTRATIVE_CIRCULAR | 通達（解釈補助層、法源ではない） | UNENUMERATED | - | - | 0 | no | no |
| CASE_LAW | 裁判例（解釈補助層、法源ではない） | UNENUMERATED | - | - | 0 | no | no |

## Obligation counts (separate denominators)

- normative_units_total: unknown
- fully_verified_units: 46
- proved_scope_units: 0
- not_started_units: 396806
- blocked_units: 2
- unacquired_statutes: 0
- human_legal_reviews: 0

Separate denominators. Unknown means the input is absent on this branch; never zero.

## Finding (H/T/D/C/U)

- **H**: The 327-law ledger covers the whole Japanese tax-law universe.
- **T**: Compare INVENTORY, recursively discovered ids and the declared auxiliary layers.
- **D**: FAIL — the statutory ledger is a provisional subset; four layers remain separate/unenumerated.
- **C**: A discovered related statute may be merely a cross-reference rather than an independent norm source.
- **U**: Counts for unenumerated layers are unknown; no legal conclusion is drawn.
