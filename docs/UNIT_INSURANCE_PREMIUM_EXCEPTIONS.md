# Normative units — 325AC0000000226 art.34 / art.314の2（保険料控除区分）

Eight EXCEPTION units from the pinned revision `325AC0000000226_20261101_508AC0000000002`,
four in each of art.34 (道府県民税) and art.314の2 (市町村民税):

- 新生命保険料 / 旧生命保険料 / 新個人年金保険料 / 旧個人年金保険料 —
  each 「（３）に掲げる場合を除く。」

| id | content |
|---|---|
| H | Four premium categories (新/旧 × 生命/個人年金) are mutually exclusive; every one is subject to the common exclusion 「（３）に掲げる場合」. The two articles share the same structure. |
| T | `lake build JapanTaxLaw.InsurancePremiumExceptionsTests`; `python scripts/ci/source_audit_insurance_premiums.py` |
| D | Kernel proofs for the four categories, out-of-range rejection, exclusion overriding all categories, category-axis decomposition and cross-article identity; spec agreement; all eight originals verbatim (4/4 checks, 8/8 hits). |
| C | Competing readings rejected: ignoring the common exclusion, or treating 新/旧 (or 生命/年金) as interchangeable categories. The content of case （３） is NOT in these fragments. |
| U | Premium amounts, the content of case （３）, deduction computation and legal effect NOT MODELLED. Human legal review pending. |
