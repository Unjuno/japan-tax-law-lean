# Normative units — 経過措置見出し・かな範囲・項参照（8,874 units, PROVED_SCOPE）

These 8,874 fragments have 原文 consisting only of a heading, a range, a
paragraph reference or a connector. The decomposer recorded them UNRESOLVED with
`unhandled_conditions = [fragment]`; only structural claims are proven, so all
derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| transitional_heading | 8,509 | 「（…に関する経過措置）」 — structural section declaration |
| kana_range | 241 | イからニまで / イ及びロ / イ、ロ — Iroha ordinal range [lo,hi] |
| replacement_marker | 63 | 」とあるのは「 — reading-replacement connector |
| paragraph_ref | 61 | 前項 / 第一項..第十項 — paragraph reference |

| id | content |
|---|---|
| H | A heading declares transitional provisions; a kana range selects Iroha ordinals in [lo,hi]; paragraph references and replacement connectors resolve to caller-supplied targets. |
| T | `lake build JapanTaxLaw.TransitionalHeadingsAndRefsTests`; `python scripts/ci/source_audit_transrefs.py` |
| D | Kernel proofs of Iroha range parsing (イからニまで, イ及びロ), range boundaries, paragraph/reference identity and heading declaration; independent spec; all 8,874 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a heading treated as carrying its own effect, an ordinal outside the Iroha range, and a reference resolved to a different target. |
| U | The provisions carrying these headings/ranges, their substantive conditions/effects and cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
