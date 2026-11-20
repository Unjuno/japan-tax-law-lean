# Recursive discovery: official law-id resolution (Objective §2)

Date: 2026-11-20
Base: `main` @ `2eb3e38` (PR #186, task-queue/completion fix, CI green)
Scope: §2 target determination — collect related statutes whose names do NOT
contain 「税」 by resolving reference relations recursively.

> This is a discovery/tooling record. It does not claim legal correctness,
> coverage, acquisition of the discovered laws, or completion of the goal.

## Problem

`data/INVENTORY.json` enumerates candidates by the 「税」 keyword in the law
name only (327 laws; 325 pinned snapshots; 2 fully unenforced). The existing
`recursive_discovery.py` scans references such as 「会社法第二条」 and reports
unmatched *names*, but never resolves them to official law IDs and never uses
the full national law list. Therefore related non-tax statutes remained
unidentified as concrete target candidates.

## Change

`scripts/law_audit/inventory/recursive_discovery_resolve.py`:

1. parses the full official national law list (`lawlists_1.xml`, category 1);
2. indexes law names, era-prefixed law numbers and parenthetical short titles;
3. re-scans all pinned snapshots for 「〈name〉第N条」 references, excluding
   generic pronouns (この法律 / 同法 / …) and names already in the ledger;
4. resolves each name to an official law id by exact name, short name, law
   number, or a conservative unique long-prefix match;
5. classifies the result into NEW official law-id candidates, aliases of laws
   already in the ledger, and unresolved names;
6. emits `data/RECURSIVE_DISCOVERY_RESOLVED.json` and
   `docs/RECURSIVE_DISCOVERY_RESOLVED.md` deterministically.

Resolved candidates are NOT added to `INVENTORY.json`: adding a target requires
fetching its official revision and SHA-256 snapshot. They are NOT counted as
acquired, parsed, formalised, proved or reviewed. Historical/unenforced
revisions remain a separate layer.

## Measured results (real pinned snapshot, 2026-11-15)

```
full_law_list_entries:        9001
ledger laws:                   327
unmatched reference names:    7524
resolved NEW official law ids: 380     (all names without 「税」)
ledger aliases:                  0
unresolved names:             7144
```

Corrected after independent Codex review of PR #196 (three findings):
1. **Prefix matching removed** — a shared long prefix can map an Act to its
   ministerial ordinance (沖縄振興開発特別措置法 → 404M50000008008) or an
   enforcement order to its Act (企業合理化促進法施行令 → the Act). Such
   references now stay `unresolved`; only exact name, era-stripped short
   title and law-number matches are accepted.
2. **Occurrence grouping** — multiple reference names resolving to one law id
   are grouped with all names retained and occurrences summed, instead of a
   later name silently overwriting an earlier one.
3. **Gate checks both artifacts** — the regeneration gate now compares the
   JSON ledger as well as the Markdown; a tampered/missing JSON fails.

Highest-frequency new candidates: 金融商品取引法 (319), 会社法 (238),
福島復興再生特別措置法 (138), 都市計画法 (137), 農地法 (135), 保険業法 (135),
地方自治法 (128), 建築基準法 (105), 道路運送車両法 (93), 沖縄振興特別措置法 (84).

Code gates/unit tests added and executed locally:

```
python -m unittest scripts.tests.test_recursive_discovery_resolve -v
Ran 5 tests ... OK
python scripts/law_audit/inventory/recursive_discovery_resolve.py   (twice)
wrote ... / matches committed state (deterministic)
```

## H / T / D / C / U

- **H (falsifiable)**: if the reference-name scan were limited to the 「税」
  keyword ledger, zero non-tax statutes would be resolved to official ids.
- **T (test)**: `python scripts/law_audit/inventory/recursive_discovery_resolve.py`
  and inspect `data/RECURSIVE_DISCOVERY_RESOLVED.json`.
- **D (decision)**: 380 non-tax statutes resolved to official ids; H is refuted.
  This is discovery only, not scope closure.
- **C (competing interpretation)**: one could treat every name match as a new
  in-scope target and add it to the ledger. Rejected: addition requires an
  official revision + SHA-256 pin; otherwise the count would be unverifiable.
- **U (uncertainty)**: 7,144 names remain unresolved; some are abbreviations,
  repealed laws or typos. They are retained, not silently dropped. Resolving
  them and pinning the 380 candidates remains an open obligation.

## Follow-up: first related statute acquired in a separate layer

`scripts/law_audit/inventory/acquire_related_law.py` pins an official e-Gov
revision + raw snapshot for a nominated discovered law WITHOUT editing
`data/INVENTORY.json`. First acquisition (2026-11-15 snapshot):

```
ACQUIRED 322AC0000000067 地方自治法
  revision = 322AC0000000067_20261102_508AC0000000062  (current_enforced)
  raw      = data/related_raw/322AC0000000067_20261102_508AC0000000062.law.json
  sha256   = C37874F6F340AD23FCCD1AF91EEA5F400F4BCB9E7B0F0B01E7D0E7AAB0D62902
  bytes    = 2518200
```

`data/RELATED_LAW_LEDGER.json` records `source_layer=NATIONAL_NON_TAX_RELATED`
and `verification_status=ACQUIRED_NOT_PARSED_NOT_MODELLED_NOT_REVIEWED`.
4 unit tests (`scripts.tests.test_related_law_acquisition`) verify revision
selection, SHA integrity and that the acquired id is NOT in `INVENTORY.json`.
`docs/COVERAGE.md` reports acquired vs discovered as separate axes and lists
acquired-but-unparsed statutes under unaddressed obligations.

## Non-claims

- No law is said to be defective; no legal conclusion is drawn.
- No Lean proof was added, changed or weakened.
- Existing successful proofs are untouched.
- Human legal review remains pending and out of repo.
