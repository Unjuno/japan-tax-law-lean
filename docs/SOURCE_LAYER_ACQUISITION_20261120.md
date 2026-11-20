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

## H / T / D / C / U

| id | content |
|---|---|
| H | None of L2–L5 has acquired, pinned content in this repository; therefore no norm from those layers can be formalised or counted as verified. |
| T | Directory scan above plus regeneration of `data/SOURCE_LAYERS.json` by `scripts/ci/source_layers.py`; tests `scripts/tests/test_source_layers.py` (8/8). |
| D | H holds. L2–L5 remain `NOT_ACQUIRED`; zero raw files. No layer is folded into L0. L7 (statute candidates found by recursion) is pinned but still OUT_OF_SCOPE. |
| C | Competing interpretation: "present in a registry" means "acquired". Rejected: the registry fields distinguish `ACQUIRED_*` from `NOT_ACQUIRED`, and `count_acquired=0` is authoritative. Another reading: "0 files in data/raw means no such sources exist". Rejected: this only means *this repository* has not acquired them. |
| U | No acquisition pipeline from municipal websites, treaty databases, circular publications or case-law repositories has been implemented here; the e-Gov law API path used for L0 does not cover them. Acquisition is therefore recorded as NOT_ACQUIRED, not as a legal conclusion. Human legal review 0. |

## Consequence

No completion claim is made for L2–L5. Their denominators remain separate and
`all-complete claimable` stays False. The next technical work item is to define
and test acquisition adapters for each family; until then they stay explicit
gaps, not silently omitted scopes.
