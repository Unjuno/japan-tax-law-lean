# FULL-COVERAGE adversarial source fidelity — TariffSpecificFloor (93 units)

Auditor: independent general subagent (session ses_de9f0a220ffe6MZhRJRaOfRUJc).
Read-only mechanical check over EVERY one of the 93 tariff units. Reproduce
with `data/evidence_audits/full_coverage_tariff_audit.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage of the mechanical checks)

| Check | Result |
|---|---:|
| records | 93 |
| pinned SHA-256 matches `source_sha256` | 93 / 93 |
| full `norm_fragment` verbatim in normalized source | 93 / 93 |
| `一キログラムにつき` token present | 93 / 93 |
| floor amount + 円 present | 93 / 93 |
| rate kanji + ％ present (e.g. 二・八％, 二五％) | 93 / 93 |
| independent kanji re-parse == stored rate fraction / floor | 93 / 93 |
| `norm_fragment` contains rate kanji | 93 / 93 |

All failure lists empty. Lean scan: no forbidden proof tokens in the three
`TariffSpecificFloor*.lean` files; `tariffDuty_agrees` header unchanged and
the spec file byte-identical to git HEAD.

## Scope
Full coverage applies to SHA, verbatim phrase presence and independent
rate/floor parsing only. Semantic context beyond the exact phrase (e.g.
classification codes, surrounding tariff conditions) is out of scope.
ADVERSARIAL_REVIEW is recorded for all 93 units on this basis; this is not a
claim that every target-version norm is complete.
