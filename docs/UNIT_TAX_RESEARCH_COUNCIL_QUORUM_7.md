# Unit review — 税制調査会組織規則 art.7 §1 (定足数)

Law `425CO0000000025`, Article 7 §1. Pinned raw:
`data/raw/425CO0000000025_20221202_504CO0000000367.law.json`.
原文: 「調査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

| field | value |
|---|---|
| H | 定足数 = `0 < total ∧ 3 * present >= total`; unit 人, domain Nat. |
| T | article-scoped pinned needle + kernel boundary examples + universal `agreeQuorum`. |
| D | PASS — 1/3, 2/6, 5/5 PASS; 0/3, 1/4, 0/0 FAIL. |
| C | Majority voting, chair tie-break, composition and procedure out of scope. |
| U | Whole persons only; no rounding rule is needed. |

Model: `JapanTaxLaw/TaxResearchCouncilQuorum{,Spec,Tests}.lean`. Universal omega bridge `agreeQuorum`. Human legal review `LEGAL_REVIEW_PENDING`.
