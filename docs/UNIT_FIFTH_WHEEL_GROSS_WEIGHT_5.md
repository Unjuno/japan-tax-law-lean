# Unit review — 登録免許税法施行規則 art.5(1) (牽引自動車の車両総重量)

Law `346CO0000000275`, Article 5 §1. Pinned raw: `data/raw/346CO0000000275_20230101_504CO0000000195.law.json`.
原文: 「当該牽けん引自動車にあつてはその自動車検査証に記録される車両総重量から第五輪荷重を控除し牽けん引重量を加えた重量とし」

| field | value |
|---|---|
| H | 車両総重量 = `(recorded - fifthWheel) + towing`; unit kg, domain Nat. |
| T | article-scoped pinned needle + kernel boundaries + universal `agreeGrossWeight`. |
| D | PASS — 9000 / 2000 / 2000 (saturation) / 0; 3 universal lemmas. |
| C | Fifth-wheel=max-load precondition, semi-trailer definition and towed-vehicle rule out of scope. |
| U | Whole kilograms only; no rounding rule in the source. |

Model: `JapanTaxLaw/FifthWheelGrossWeight{,Spec,Tests}.lean`. Human legal review `LEGAL_REVIEW_PENDING`.
