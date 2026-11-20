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

Additionally, one actual circular provision page was pinned as a separate
acquired document:
```
https://www.nta.go.jp/law/tsutatsu/kihon/shotoku/01/01.htm
data/raw_circulars/nta_shotoku_01_01.html  6682 bytes
sha256: 6d7d6ba43294e00a…
title: 〔居住者、非永住者及び非居住者（第3、4、5号関係）〕｜国税庁
```
The remaining circular texts are still NOT_ACQUIRED. L4 is now
`ACQUIRED_PINNED_ONLY` with `count_acquired=1` and `verification_status=OUT_OF_SCOPE`
(no norm from it is modelled or proved). `data/SOURCE_LAYERS.json` records the
evidence in the separate `auxiliary_index_acquisition` block and 9/9
source-layer tests pass.

## H / T / D / C / U

| id | content |
|---|---|
| H | L2/L3/L5 have no acquired pinned content; L4 has one pinned index and one pinned provision page, but no norm from any of these layers is formalised or counted as verified. |
| T | Directory scan above plus regeneration of `data/SOURCE_LAYERS.json` by `scripts/ci/source_layers.py`; tests `scripts/tests/test_source_layers.py` (8/8). |
| D | H holds. L2/L3/L5 remain NOT_ACQUIRED. L4 has one real index (18563 bytes, 91 links) and one real circular page (6682 bytes) pinned with SHA-256; L4 status is ACQUIRED_PINNED_ONLY / count_acquired=1 / verification OUT_OF_SCOPE. No layer is folded into L0. L7 (statute candidates) is pinned but OUT_OF_SCOPE. |
| C | Competing interpretation: "present in a registry" means "acquired". Rejected: registry fields distinguish `ACQUIRED_*` from `NOT_ACQUIRED`. Another: "HTTP 200 proves content" — rejected after the first candidate pinned a 404 HTML template; the adapter now rejects error markers and small bodies. "0 files in data/raw means no such sources exist" is also rejected: it only describes this repository. |
| U | No acquisition pipeline from municipal websites, treaty databases, circular publications or case-law repositories has been implemented here; the e-Gov law API path used for L0 does not cover them. Acquisition is therefore recorded as NOT_ACQUIRED, not as a legal conclusion. Human legal review 0. |

## L3 treaty source probe (2026-11-21) — no accessible official original

A follow-up availability probe (certifi TLS, `User-Agent: Mozilla/5.0`) tested
further official candidate URLs for a real tax-treaty index/text. All failed to
yield an original; none was pinned (no false acquisition):

```
https://www.mofa.go.jp/mofaj/gaiko/treaty/index.html      -> HTTP 403 Forbidden
https://www.mof.go.jp/tax_policy/tax_treaty/index.htm     -> HTTP 404
https://www.mof.go.jp/tax_policy/tax_treaty/treaty_list.htm-> HTTP 404
https://www.mof.go.jp/international_policy/convention/
    tax_treaty/index.htm                                  -> HTTP 404
https://www.nta.go.jp/taxes/seisan/kokusai/index.htm      -> /error/404.htm
    (HTTP 200 but 2007-byte "指定されたページを表示できませんでした" template)
https://www.nta.go.jp/taxes/seisan/kokusai/zeiho_treaty.htm-> /error/404.htm (same template)
https://www.nta.go.jp/taxes/seisan/kokusai/kokusai.htm     -> /error/404.htm (same template)
https://www.nta.go.jp/publication/pamph/pdf/zeiho_treaty.pdf-> /error/404.htm (same template)
```

A MOF tax-reform outline page (`www.mof.go.jp/tax_policy/tax_reform/outline/fy2024/index.htm`,
21550 bytes) was reachable but is **not** a treaty original, so it was not
acquired for L3. Root causes recorded: (a) MOFA blocks automated treaty access
(403); (b) guessed NTA/MOF treaty URLs either 404 or return the NTA 404 HTML
template with HTTP 200 — exactly the false-acquisition trap already guarded
against in `acquire_auxiliary_index.py`. Competing hypothesis ("the sources
are reachable if the right URL is known") is not disproven, but no valid URL
was established in this probe. L3 therefore remains `NOT_ACQUIRED` /
`count_acquired=0` / `verification_status=OUT_OF_SCOPE`; no content claimed.

## Consequence

No completion claim is made for L2–L5. Their denominators remain separate and
`all-complete claimable` stays False. The next technical work item is to define
and test acquisition adapters for each family; until then they stay explicit
gaps, not silently omitted scopes.
