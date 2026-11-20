# Normative units — たばこ税の準用範囲（READING）

Eleven READING units from two pinned snapshots:

| group | count | 原文（要旨） | 区間 |
|---|---|---|---|
| 道府県たばこ税 (325AC art.12) | 3 | 第四項から第八項までの規定は…道府県たばこ税を課する場合について準用する | [4,8] |
| 市町村たばこ税 (325AC art.20) | 3 | 第四項から第八項までの規定は…市町村たばこ税を課する場合について準用する | [4,8] |
| たばこ税 (359AC art.52) | 3 | 第二項から第七項までの規定は…たばこ税を課する場合について準用する | [2,7] |
| たばこ税 (359AC art.51) | 2 | 第二項から第八項までの規定は…たばこ税を課する場合について準用する | [2,8] |

| id | content |
|---|---|
| H | 「lo から hi まで」 incorporates an inclusive paragraph range [lo,hi]. The prefectural and municipal ranges are identical; art.52 [2,7] is contained in art.51 [2,8]; their overlap is [4,7]. |
| T | `lake build JapanTaxLaw.TobaccoTaxReadingRangesTests`; `python scripts/ci/source_audit_reading_ranges.py` |
| D | Kernel proofs of inclusive endpoints, range monotonicity, pref=city identity, art.52⊆art.51 and overlap computation, plus spec agreement; all 11 originals verbatim (4/4 checks, 11/11 hits). |
| C | Competing readings rejected: treating 「から…まで」 as half-open excludes paragraph 8/7 wrongly; assuming the incorporated paragraphs' substantive rules are modelled here — only the range is. |
| U | The substantive content of the incorporated paragraphs, the preceding-case conditions and legal effects are NOT MODELLED. Human legal review pending. |

This verifies which paragraphs are incorporated (§3 cross-reference structure), not their content.
