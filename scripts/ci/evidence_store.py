#!/usr/bin/env python3
"""Shared access to the verification evidence ledger.

The original monolithic ledger (data/verification_evidence.json) is frozen near
GitHub's file-size limit. New evidence is appended to small JSON shards under
data/evidence_shards/. `load_ledger` presents the union of the frozen main
ledger and every shard as a single read-only view, so downstream gates keep
seeing one authoritative corpus. Shard ids must not collide with the main
ledger or with each other; `append_shard` refuses a colliding write.

The JSON contract returned by `load_ledger` is exactly
{"note": ..., "schema": ..., "units": {...}} — unchanged for all callers.
"""
from __future__ import annotations

import json
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MAIN = REPO / "data" / "verification_evidence.json"
SHARD_DIR = REPO / "data" / "evidence_shards"


def _read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def shard_paths(repo: Path = REPO) -> list[Path]:
    d = Path(repo) / "data" / "evidence_shards"
    return sorted(d.glob("*.json")) if d.exists() else []


def load_units(repo: Path = REPO) -> dict:
    """Return the merged unit map from the frozen main ledger plus all shards."""
    main = Path(repo) / "data" / "verification_evidence.json"
    units = dict((_read_json(main).get("units", {}) if main.exists() else {}))
    for p in shard_paths(repo):
        part = _read_json(p).get("units", {})
        for uid, record in part.items():
            if uid in units:
                raise ValueError(f"duplicate normative id {uid} in shard {p.name}")
            units[uid] = record
    return units


def load_ledger(repo: Path = REPO) -> dict:
    """Return the full ledger dict with the merged unit map."""
    main = Path(repo) / "data" / "verification_evidence.json"
    data = _read_json(main) if main.exists() else {"note": "", "schema": "", "units": {}}
    result = dict(data)
    result["units"] = load_units(repo)
    return result


def append_shard(new_units: dict, name: str, repo: Path = REPO) -> Path:
    """Atomically append new evidence units as one shard.

    Refuses if any id already exists in the merged ledger (no silent overwrite).
    The caller must pass a unique, stable shard name (usually a batch hash).
    """
    if not new_units:
        raise ValueError("refusing to write an empty shard")
    if not name or not all(c.isalnum() or c in "-_" for c in name):
        raise ValueError(f"invalid shard name: {name!r}")
    existing = load_units(repo)
    collisions = sorted(set(new_units) & set(existing))
    if collisions:
        raise ValueError(f"refusing shard {name}: {len(collisions)} id collision(s), "
                         f"e.g. {collisions[0][:24]}")
    d = Path(repo) / "data" / "evidence_shards"
    d.mkdir(parents=True, exist_ok=True)
    target = d / f"{name}.json"
    if target.exists():
        raise ValueError(f"shard already exists: {target}")
    text = json.dumps({"units": new_units}, ensure_ascii=False,
                      separators=(",", ":"), sort_keys=True) + "\n"
    tmp = target.with_suffix(".json.tmp")
    tmp.write_text(text, encoding="utf-8")
    tmp.replace(target)
    return target
