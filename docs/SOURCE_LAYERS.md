# Source layers (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/source_layers.py`.

The 327-law snapshot is a PROVISIONAL population. The following layers
are kept separate by legal nature and verification status; an auxiliary
layer is never folded into the statutory ledger.

- snapshot: 2026-11-15
- distinct unmatched reference names: 7526
- tax-name candidates outside ledger: 2873
- historical names / occurrences: 795 / 12977
- discovered law candidates / pinned: 382 / 381

## Auxiliary index acquisition (index page only, not underlying sources)

- L4_CIRCULAR: https://www.nta.go.jp/law/tsutatsu/menu.htm
  pinned data/raw_circulars/nta_tsutatsu_menu.html sha256=efc91e471dd46fa3146bacf6dce32bbef0ed1f31dc3053ecfaef93593bafd55a bytes=18563 hrefs=91
  content_acquired=False (underlying circular texts NOT acquired)

## Historical revision acquisition

- revisions recorded: 149; ACQUIRED_PINNED: 146
- verification_status: OUT_OF_SCOPE (pinned only; NOT parsed, formalized, proved or legally reviewed)

## Case-law acquisition

- keyword: 租税; reported hits: 2000
- ACQUIRED_PINNED pages: 16 (15 judgments)
- verification_status: OUT_OF_SCOPE (pinned only; NOT parsed, formalized, proved, binding or legally reviewed)

## Ordinance acquisition

- index: Doshisha 条例Webアーカイブ (third-party academic aggregator, NOT an official original) (third-party aggregator, NOT an official original)
- index reported hits: 14611; ACQUIRED_PINNED official pages: 11
- verification_status: OUT_OF_SCOPE (pinned only; all-municipality coverage NOT claimed)

| layer | label | legal nature | acquisition | scope | count | verification |
|---|---|---|---|---|---:|---|
| L0_STATUTE | 法律・政令・省令 | 国家法源（法律・政令・省令） | ACQUIRED_PARTIAL | PROVISIONAL_POPULATION | 327 | PARTIAL |
| L1_PROVISION | 附則・別表・経過措置 | L0 内の一部を構成する規範 | ACQUIRED_WITHIN_L0 | INCLUDED_IN_L0 | - | PARTIAL |
| L2_ORDINANCE | 地方税条例 | 自治体条例（地方自治法に基づく法源） | ACQUIRED_PINNED_ONLY | DECLARED_UNSUPPORTED | 1788 | OUT_OF_SCOPE |
| L3_TREATY | 租税条約 | 条約（国際法源）— 国内法とは効力発生の機構が異なる | NOT_ACQUIRED | AUXILIARY_LAYER | - | OUT_OF_SCOPE |
| L4_CIRCULAR | 通達 | 行政通達（法的拘束力は条文ではなく行政内部） | ACQUIRED_PINNED_ONLY | AUXILIARY_LAYER | - | OUT_OF_SCOPE |
| L5_CASELAW | 裁判例 | 判決・裁定（法源ではなく判断例） | ACQUIRED_PINNED_ONLY | AUXILIARY_LAYER | - | OUT_OF_SCOPE |
| L6_HISTORICAL | 歴史的施行版 | 旧法・新法（同一法令の別施行版） | ACQUIRED_PINNED_ONLY | HISTORICAL_LAYER | 795 | OUT_OF_SCOPE |
| L7_DISCOVERED_SCOPE | 再帰的探索で発見された関連法令 | L0 外の参照・準用・委任から発見された国家法源（法令名に 税 を含まないものを含む） | ACQUIRED_PINNED_ONLY | DISCOVERED_CANDIDATE_LAYER | 382 | OUT_OF_SCOPE |

## Obligation counts (separate denominators)

- normative_units_total: unknown
- fully_verified_units: 55566
- proved_scope_units: 4
- not_started_units: 341282
- blocked_units: 2
- human_legal_reviews: 0

Separate denominators; unknown (None) means the input is absent, never zero.

No layer other than L0 has source texts PARSED, FORMALIZED or PROVED here.
The pinned L4 item is an index page plus one circular page; the pinned L6
items are historical revision snapshots. All are acquisition-only with
verification OUT_OF_SCOPE. No completion claim is made.
