# Unit review — 国際観光旅客税法施行規則 art.3(2) ホ (課税旅客数)

Law `430M60000040039`, Article 3 item 2 ホ. Pinned raw:
`data/raw/430M60000040039_20250401_507M60000040024.law.json`.

原文: 「ホ　イに掲げる数からロからニまでに掲げる数の合計数を控除した数」
(イ 旅客の数 / ロ 国際観光旅客等でない者の数 / ハ 法第六条各号に掲げる者の数 /
 ニ 他の法律の規定により出国につき国際観光旅客税を免除される者の数)

| field | value |
|---|---|
| H | 課税旅客数 = `i - (ro + ha + ni)`, Nat saturating subtraction; unit 人. |
| T | article-scoped pinned needle + kernel boundary examples + universal `agreeTaxablePassengers`. |
| D | PASS — needle 1/1; 40 / 0 / 0 (saturation) / 250 boundaries; 3 universal lemmas. |
| C | The determination of the four counts from source documents and the ヘ tax amount are out of scope. |
| U | No rounding issue arises (whole persons); overlapping categories are caller-established. |

Model: `JapanTaxLaw/TouristTaxTaxablePassengers{,Spec,Tests}.lean`. The independent spec uses iterated subtraction; `omega` proves the universal bridge. Human legal review `LEGAL_REVIEW_PENDING`.
