# Unit review — 登録免許税法 art.17(2) (船舶仮登記の税率減額)

Law `342AC0000000035`, Article 17 §2. Pinned raw: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`.
原文: 「同号（二）の税率欄に掲げる割合から千分の四を控除した割合とする。」

| field | value |
|---|---|
| H | 軽減後税率 = `basePerMille - 4`; unit 千分率, domain Nat. |
| T | article-scoped pinned needle + kernel boundaries + universal `agreeReducedRate`. |
| D | PASS — 4→0, 10→6, 0→0, 3→0; 3 universal lemmas; axioms `[propext, Quot.sound]`. |
| C | Provisional-registration identification, tax base and other paragraphs out of scope. |
| U | Whole per-mille units only. |

Model: `JapanTaxLaw/ShipProvisionalRateReduction{,Spec,Tests}.lean`. Human legal review `LEGAL_REVIEW_PENDING`.
