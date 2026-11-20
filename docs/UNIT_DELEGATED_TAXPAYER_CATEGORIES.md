# Normative units — 325AC0000000226 art.37 / art.314の6（委任）

Four DELEGATION units from the pinned revision `325AC0000000226_20261101_508AC0000000002`:

| law article | normative id (prefix) | 原文 |
|---|---|---|
| art.37 （３） | `NORM\|0620dc02…` | 寡婦又はひとり親で政令で定めるものである所得割の納税義務者 |
| art.37 （４） | `NORM\|a76247cc…` | ひとり親で政令で定めるものである所得割の納税義務者 |
| art.314の6 （３） | `NORM\|44ed5641…` | 寡婦又はひとり親で政令で定めるものである所得割の納税義務者 |
| art.314の6 （４） | `NORM\|f01303c4…` | ひとり親で政令で定めるものである所得割の納税義務者 |

| id | content |
|---|---|
| H | （４） is a narrowing of （３）: single-parent-and-delegated implies widow-or-single-parent-and-delegated. （３） splits into widow-only-or-（４）. The 道府県民税 and 市町村民税 versions have identical wording and are extensionally identical. |
| T | `lake build JapanTaxLaw.DelegatedTaxpayerCategoriesTests`; `python scripts/ci/source_audit_delegated_categories.py` |
| D | Kernel theorems `cat4_implies_cat3`, `cat3_split`, `cross_law_cat3/4`, `narrowing_both`, plus spec agreement and boundary examples; both distinct originals verbatim (3/3 checks, 2/2 distinct hits). |
| C | Competing reading rejected: treating 「政令で定める」 content as if it were in the statute — the cabinet-order determination is opaque and caller-supplied, NOT modelled. Merging （３） and （４） as interchangeable would lose the narrowing relation. |
| U | The actual cabinet-order criteria, widow/single-parent status determination, rates, computation, procedures and the rest of both articles are NOT MODELLED. No legal adequacy claim; human legal review pending. |

This verifies the *logical structure of delegated categories*, specifically a
§3 norm kind (DELEGATION) and the cross-law relation, not the delegated content.
