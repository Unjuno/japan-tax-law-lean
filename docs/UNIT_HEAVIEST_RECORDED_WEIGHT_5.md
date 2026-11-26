# Unit review — 登録免許税法施行規則 art.5(2) (最重記録重量)

Law `346CO0000000275`, Article 5 §2. Pinned raw: `data/raw/346CO0000000275_20230101_504CO0000000195.law.json`.
原文: 「当該自動車検査証に記録される車両総重量が二以上あるときは、そのうちの最も重いものとする。」

| field | value |
|---|---|
| H | 選択値 = `max a b`; unit kg, domain Nat. |
| T | article-scoped pinned needle + kernel boundaries + universal `agreeHeaviest`. |
| D | PASS — 10000/9000, 9000/10000, 0/0; 3 universal lemmas; axioms `[propext, Quot.sound]`. |
| C | Determination of recorded weights, §1/§3/§4 out of scope. |
| U | Whole kilograms only. |

Model: `JapanTaxLaw/HeaviestRecordedWeight{,Spec,Tests}.lean`. Human legal review `LEGAL_REVIEW_PENDING`.
