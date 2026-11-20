# Normative units — 罰則の上限構造（198 units）

198 units in 86 verbatim variants stating penal maxima (e.g. 一年以下の拘禁刑
又は五十万円以下の罰金 / 十年以下の拘禁刑若しくは千万円以下の罰金…併科).

| id | content |
|---|---|
| H | Each offence carries an upper bound on imprisonment months and on fine yen; an imposed sanction must stay within both. Both the 又/若しくは (alternative) and 併科 (concurrent) wordings express the same upper-bound structure. |
| T | `lake build JapanTaxLaw.PenaltyMaximaTests`; `python scripts/ci/source_audit_penalty.py` |
| D | Kernel proofs of bound entailment, within_of_bounds, cap monotonicity, zero case and wording-family identity; spec agreement; all 198 originals verbatim (4/4 checks). |
| C | Competing readings rejected: exceeding either stated maximum, or treating 併科 as removing the maxima. |
| U | Actual numerals, offence conditions, sentencing and all other provisions NOT MODELLED. Caps are caller-supplied Nat (months / yen). Human legal review pending. |
