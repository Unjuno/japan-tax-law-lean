# Normative units — 条番号ラベル（27,338 units, PROVED_SCOPE）

27,338 fragments whose 原文 is only an article-number label 第一条, 第二条, …
(647 variants, 第一条 … 第百十九条 and beyond; both MAIN and SUPPLEMENTARY).
The decomposer assigned `norm_kind=None` (no substantive norm), and each carries
a self-referential `law_article` dependency. Dependencies affect task selection,
not status derivation. Only the ordinal is kernel-proven; the substantive content
of the articles lives in separate units and is NOT MODELLED here. These units
therefore correctly derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | 「第X条」 is a structural label for article X; its full content in these units is the ordinal. |
| T | `lake build JapanTaxLaw.ArticleNumberLabelsTests`; `python scripts/ci/source_audit_artlabels.py` |
| D | Kernel checks of all 647 ordinal variants (第一条=1 … including 百/千 via a dedicated fold parser) by `decide`; independent spec; all 27,338 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating a bare label as the substantive article norm, or misreading the ordinal (e.g. 百十 as 1000). |
| U | The substantive article content, conditions/effects and cross-law relations NOT MODELLED. No cross-law proof is claimed for a bare label, so `cross_law_proof` is intentionally absent. Human legal review pending. Status remains `PROVED_SCOPE`. |
