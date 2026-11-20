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

## L6 historical revision acquisition (2026-11-21) — first real pin

`scripts/ci/acquire_historical_revisions.py` now pins non-current e-Gov revisions
of laws already in the L0 inventory, as a **separate L6 denominator**. Two runs
were made: an initial depth run (4 revisions of one law) and a breadth run
(`--limit 12 --per-law 1`). Current state:

```
346 ACQUIRED_PINNED revisions across 16 distinct laws (3 FETCH_FAILED recorded):
  143AC0000000054 (関税定率法)
  322AC0000000175 (災害被害者租税減免)
  322CO0000000268 (災害被害者租税減免政令)
  325AC0000000073 (相続税法)
```
Each response was validated as real law-data JSON (`law_full_text` present, so
HTML 404 templates are rejected) and its SHA-256 re-verified against the on-disk
bytes under `data/raw_historical/` (346/346 verified). `data/HISTORICAL_PINNED.json`
and `docs/HISTORICAL_PINNED.md` record the result. `data/SOURCE_LAYERS.json` now
reports `L6_HISTORICAL = ACQUIRED_PINNED_ONLY`, `count_acquired=346`, still
`verification_status=OUT_OF_SCOPE` and NOT merged into L0. 15/15 source-layer
tests pass, including hash re-verification and status-honesty checks. The
remaining ~449 discovered historical names stay unacquired; no parse,
formalization, proof or human review is claimed for the pinned snapshots.

## L5 case-law acquisition (2026-11-21) — first real pins

`scripts/ci/acquire_caselaw.py` queries the Supreme Court public case-law search
(`courts.go.jp`, keyword 租税, 2000 reported hits) and pins the result page plus
thirty real judgment detail pages (case ids 96975, 96536, 96174, 96019,
95412, 95315, 95346, 96937, 96930, 95686, 95758, 94302, 95364, 95323, 95309,
95397, 93789, 93790, 93791, 93927, 97002, 93763, 94350, 95300, 93346, 93220,
93333, 93684, 93082, 92950). Each page was validated as genuine content (title 裁判例結果詳細 +
事件番号 + 裁判年月日), and SHA-256 re-verified against disk (31/31). Dynamic-page
re-fetches are handled by reusing already-validated on-disk bytes rather than
overwriting the pin. `data/SOURCE_LAYERS.json` now reports
`L5_CASELAW = ACQUIRED_PINNED_ONLY`, `count_acquired=31`,
`verification_status=OUT_OF_SCOPE`, never merged into L0.
These HTML pages are auxiliary material only — NOT parsed, formalized, proved,
binding or legally reviewed. 15/15 source-layer tests pass, including two new
L5 honesty/hash tests.

## L2 ordinance acquisition (2026-11-21) — first official municipal pins

`scripts/ci/acquire_ordinances.py` queries the Doshisha 条例Webアーカイブ
cross-municipality **third-party academic index** for `title:市税条例`
(14,611 reported hits — an index count, NOT an acquisition count), then fetches
official municipal sites from the index's `original_url` fields. Eleven real
市税条例 pages were pinned (勝山市, 藤井寺市, 伊丹市, 旭市, 燕市, 萩市, 光市, 関市,
呉市, 小樽市, 留萌市 — 0.9–2.5 MB each), validated by presence of 市税条例 and substantial length,
with SHA-256 re-verified 11/11. One candidate (東金市) returned HTTP 404 and was
recorded as FETCH_FAILED, not counted as acquired. `data/SOURCE_LAYERS.json` now reports
`L2_ORDINANCE = ACQUIRED_PINNED_ONLY`, `count_acquired=11`, still
`verification_status=OUT_OF_SCOPE`, never merged into L0. The index is explicitly
labelled a third-party aggregator, NOT an official original; all-municipality
coverage (~1,788) is NOT claimed. 15/15 source-layer tests pass, including two
new L2 honesty/hash tests.

## L3 treaty — further negative evidence (2026-11-21)

Two additional routes were checked and yield no treaty original:
- e-Gov `https://laws.e-gov.go.jp/treaty` is a 696-byte JS SPA shell; the
  bundled JS exposes law APIs (`/api/2/law_revisions/...`, `/api/2/law_data/...`)
  but **no treaty endpoint** (`/api/2/treaties`, `/treaty_list`, `/treaties/search`
  all HTTP 404).
- The pinned e-Gov law list (`lawlists_1.xml`) contains only domestic acts
  *implementing* treaties (e.g. 租税条約等の実施に伴う所得税法…の特例等に関する法律),
  not the treaty texts themselves.

Combined with MOFA 403 and JETRO 403, L3 remains `NOT_ACQUIRED` with no original
pinned. This is recorded as an access/discovery limitation, not a legal conclusion.

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


## L3 treaty — third availability probe (2026-11-21)

Four further routes were checked; none yielded a Japanese tax-treaty original,
and nothing was pinned for L3:

```
https://www.oecd.org/en/topics/sub-issues/tax-treaties.html        -> HTTP 403
https://www.jetro.go.jp/en/invest/setting_up/treaties/             -> HTTP 403
https://www.ndl.go.jp/jp/access/list/treaty.html                   -> HTTP 404
https://treaties.un.org/Pages/Home.aspx?clang=_en                  -> reachable (HTML)
```

The UN Treaty Collection is reachable, but it is the depositary register for
**multilateral** treaties. It does not provide the Japanese authoritative texts
of the bilateral income-tax treaties that L3 requires, so it is **not** counted
as an L3 acquisition (no false acquisition from mere reachability). Competing
hypothesis ("another official mirror may exist") is not disproven, but none was
established. L3 remains `NOT_ACQUIRED`, `count_acquired=0`, `OUT_OF_SCOPE`,
a separate denominator never merged into L0. This is an access/discovery
limitation, not a legal conclusion; human legal review 0.
