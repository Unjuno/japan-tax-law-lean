# scripts/law_audit/inventory — Phase A: statute inventory

Goal: enumerate the population of national statutes relevant to the Japanese
tax system, pin their **current revision as of 2026-11-15**, and record
fetch/verification status — *before* any audit or formalization happens.

Pipeline (offline unless noted):

1. Official source: `https://laws.e-gov.go.jp/api/1/lawlists/1`
   → `lawlists_1.xml` (committed, SHA-256 recorded in `data/INVENTORY.json`
   summary as `lawlist_sha256`).
2. Candidate rule (deterministic): `law_name` contains `税`
   → 327 candidates; stored in `data/INVENTORY.json`.
   Note: the mission's headline list is **not** assumed complete; this rule
   deliberately over-selects and lets the audit phase triage.
3. Per candidate, `GET {API}/law_revisions/{law_id}` selects the applicable
   revision under the rule in `build_inventory.select_revision`:
   - prefer the single revision whose `current_revision_status == "CurrentEnforced"`;
   - else the latest revision with `amendment_enforcement_date ≤ 2026-11-15`
     and status ≠ `UnEnforced` (recorded as `historical_fallback`);
   - else (all revisions future / none): recorded as `fully_unenforced` or
     `empty`, `audit_ready=False`, **never counted as verified**.
4. `--fetch-raw` additionally downloads `{API}/law_data/{law_revision_id}` for
   the core set (`CORE_IDS`) and stores `data/raw/<law_revision_id>.law.json`
   (SHA-256 recorded per law in `data/INVENTORY.json`).
5. `pin_revisions.py` stores `data/raw/<law_id>.revisions.json` and verifies it
   byte-for-byte against the manifest hashes.
6. `validate_inventory.py` checks the ledger offline against files on disk.

Commands:

```bash
python scripts/law_audit/inventory/build_inventory.py            # revisions only (network)
python scripts/law_audit/inventory/build_inventory.py --fetch-raw --raw-core-only   # + core raws (network)
python scripts/law_audit/inventory/pin_revisions.py              # pin & verify revisions JSONs
python scripts/law_audit/inventory/validate_inventory.py         # offline integrity check
```

Statuses and honesty rules:

- `fully_unenforced` (as of 2026-11-15): 508CO0000000106 and 508M60000040027
  （防衛特別所得税関連の政令・省令、いずれも施行日が未来） — registered,
  **not** audit-ready, **not** counted in any verified statistic.
- `historical_fallback` （復興特別所得税に関する政令 424CO0000000016,
  e-Gov reports current status `PreviousEnforced`): registered with that status,
  audit-ready=False; needs a human/legal review before any audit.
- Local tax ordinances (地方税条例) are **independent per-municipality law
  sources**; they are *not* present in the national law list and are tracked
  separately (out of scope of this inventory; recorded in README/METHODOLOGY).
- 租税条約／通達／裁判例 are an interpretive-auxiliary layer, not statutes;
  they are not counted in this inventory.
- `audit_ready` is True only when the raw law snapshot exists on disk **and**
  its SHA-256 matches the manifest.
