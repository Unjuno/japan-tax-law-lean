# Normative units — 条の枝番号（4,025 units, PROVED_SCOPE）

4,025 bare article sub-item labels 第一条の二, 第百四条の二, … (2,138 variants),
each with a self-referential law_article dependency. Only the (article, sub)
ordinal pair is kernel-proven; the substantive article content is NOT MODELLED.
These derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | 「第X条のY」は（条番号 X, 枝番号 Y）の序数ラベル。 |
| T | `lake build JapanTaxLaw.ArticleSubItemsTests`; `python scripts/ci/source_audit_artsub.py` |
| D | Kernel checks of representative sub-item ordinals (including 第一条の二, 第百四条の二) via the verified article-number parser; independent spec; all 4,025 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong article/sub ordinal, or treating a bare label as the substantive article norm. |
| U | Substantive article content NOT MODELLED. No cross-law proof claimed for a bare label. Human legal review pending. Status remains `PROVED_SCOPE`. |
