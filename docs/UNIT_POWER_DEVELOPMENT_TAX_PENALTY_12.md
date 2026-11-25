# Unit review — 電源開発促進税法 art.12 (罰金上限)

Law `349AC0000000079`, article 12. Source: pinned raw snapshot in `data/raw/`.
Verbatim: 「…五十万円を超え当該電源開発促進税に相当する金額の三倍以下とすることができる。」

| field | value |
|---|---|
| H | Fine ceiling = max(¥500,000, equivalent tax); unit 円, domain Nat. |
| T | article-scoped pinned needle + kernel boundary examples. |
| D | PASS — needle located; 499,999/500,000/500,001/1,000,000 boundaries agree. |
| C | The base offence and judicial sentencing discretion are out of scope. |
| U | Legal determination of the equivalent tax is caller-established. |

Model: `JapanTaxLaw/PowerDevelopmentTaxPenalty{,Spec,Tests}.lean`, universal theorem `agreeUpper`, 10 boundary examples. Human legal review `LEGAL_REVIEW_PENDING`.
