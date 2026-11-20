# Normative units — 332CO0000000043 art.27_12_5（六月の分岐）

Units:
- `NORM|ceaa310499e6aeb291c47fe5f84450e17ebf70b5d4e9ae154ce11794a834144e` — 当該前事業年度が六月に満たない場合
- `NORM|7176dc3cb4da9ce0a92f0b4cddd094cfaefb5fa95123009cacdad1501e5cc607` — 当該前事業年度が六月以上である場合

Both originals were independently extracted from the pinned raw snapshot
(Article 27_12_5, Paragraph 8, Item 2, Subitem1 #1 and #2).

| id | content |
|---|---|
| H | The two conditions partition the prior fiscal year's month count: <6 months and >=6 months. They are mutually exclusive and jointly exhaustive. |
| T | `lake build JapanTaxLaw.FiscalPeriodSixMonthSplitTests`; `python scripts/ci/source_audit_fiscal_split.py` |
| D | Kernel proofs of `exclusive` and `exhaustive`, plus agreement of each predicate with its independent spec; both originals found verbatim (4/4 audit checks). |
| C | Competing reading: "満たない" as "<= 6" or "以上" as "> 6" — both rejected by the original wording. A single shared model is used because the two units partition one variable; each keeps its own source coordinate and evidence record. |
| U | Month-count computation, rounding, other subitems and the rule's legal effect are NOT MODELLED. Human legal review pending. |

This verifies rule interaction (exclusivity/exhaustiveness) for one pair, not the article.
