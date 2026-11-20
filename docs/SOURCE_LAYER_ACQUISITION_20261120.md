# L2–L5 source-layer acquisition status (2026-11-20) — measurement, not a completion claim

Objective §2 requires the four non-L0 source families to be tracked as separate
layers. `data/SOURCE_LAYERS.json` registers them; this record documents an
independent check of whether any content was actually acquired.

## Measured check

```
data/raw/                         681 files (L0 snapshots + revision metadata)
data/raw_ordinances/              ABSENT
data/raw_treaties/                ABSENT
data/raw_circulars/               ABSENT
data/raw_caselaw/                 ABSENT
raw filenames containing 条約/条例/通達/裁判: 0 / 0 / 0 / 0
```

`data/SOURCE_LAYERS.json` (8 layers) records, independently of this check:
- L2_ORDINANCE: ~1788 municipal ordinances, `count_acquired=0`, NOT_ACQUIRED / OUT_OF_SCOPE
- L3_TREATY: `count=null`, 0 acquired, auxiliary, OUT_OF_SCOPE
- L4_CIRCULAR: `count=null`, 0 acquired, auxiliary, OUT_OF_SCOPE
- L5_CASELAW: `count=null`, 0 acquired, auxiliary, OUT_OF_SCOPE
- L7_DISCOVERED_SCOPE: 382 candidates, 381 pinned, auxiliary, OUT_OF_SCOPE

## First real index acquisition (L4, separate denominator)

A network-backed adapter `scripts/ci/acquire_auxiliary_index.py` now pins the
NTA circular index page using certifi-backed TLS:

```
RETRACTED: https://www.nta.go.jp/law/tsutatsu/kobetsu/index.htm
  returned an HTML "指定されたページを表示できませんでした" 404 template with
  HTTP 200; the previously pinned 2007-byte file was a false acquisition and
  was deleted. Recorded as `retracted_source` in the metadata.

ACCEPTED: https://www.nta.go.jp/law/tsutatsu/menu.htm
data/raw_circulars/nta_tsutatsu_menu.html  18563 bytes
sha256: efc91e471dd46fa3146bacf6dce32bbef0ed1f31dc3053ecfaef93593bafd55a
index_href_count: 91
error_page_rejected: true
content_acquired: false
```

This is an **index page only**. The underlying circular texts are still
NOT_ACQUIRED; `data/SOURCE_LAYERS.json` records this in the separate
`auxiliary_index_acquisition` block and 9/9 source-layer tests pass.

## H / T / D / C / U

| id | content |
|---|---|
| H | None of L2–L5 has acquired, pinned content in this repository; therefore no norm from those layers can be formalised or counted as verified. |
| T | Directory scan above plus regeneration of `data/SOURCE_LAYERS.json` by `scripts/ci/source_layers.py`; tests `scripts/tests/test_source_layers.py` (8/8). |
| D | H holds for source *texts*. L2–L5 texts remain NOT_ACQUIRED. One L4 index page was really acquired and pinned (SHA-256 recorded), with `content_acquired=false`; no layer is folded into L0. L7 (statute candidates found by recursion) is pinned but still OUT_OF_SCOPE. |
| C | Competing interpretation: "present in a registry" means "acquired". Rejected: registry fields distinguish `ACQUIRED_*` from `NOT_ACQUIRED`. Another: "HTTP 200 proves content" — rejected after the first candidate pinned a 404 HTML template; the adapter now rejects error markers and small bodies. "0 files in data/raw means no such sources exist" is also rejected: it only describes this repository. |
| U | No acquisition pipeline from municipal websites, treaty databases, circular publications or case-law repositories has been implemented here; the e-Gov law API path used for L0 does not cover them. Acquisition is therefore recorded as NOT_ACQUIRED, not as a legal conclusion. Human legal review 0. |

## Consequence

No completion claim is made for L2–L5. Their denominators remain separate and
`all-complete claimable` stays False. The next technical work item is to define
and test acquisition adapters for each family; until then they stay explicit
gaps, not silently omitted scopes.
