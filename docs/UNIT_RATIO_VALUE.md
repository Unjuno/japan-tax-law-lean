# Normative units — 割合比較・価額算入（815 units, FULLY_VERIFIED）

Whole norm = comparison/inclusion operator → `FULLY_VERIFIED`. Concrete ratios
and values caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| ratio_ge | 343 | 「割合が…以上」 — ratio at least threshold |
| ratio_le | 279 | 「割合が…以下」 — ratio at most threshold |
| value_include | 189 | 「価額は…課税価格に算入する」 — include value in base |
| acquired_property | 4 | 「取得した財産…税を課する」 — tax on acquired property |

| id | content |
|---|---|
| H | A ratio is compared to a threshold (≥ or ≤); a value is included in the tax base when flagged; tax on acquired property is value×rate. |
| T | `lake build JapanTaxLaw.RatioAndValueNormsTests`; `python scripts/ci/source_audit_ratio.py` |
| D | Kernel proofs of full-ratio ≥100, zero-total ≤, include/exclude and tax zero value; spec agreement; all 815 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a below-threshold ratio treated as ≥, an unflagged value included, and non-zero tax on zero value. |
| U | Concrete ratios/values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
