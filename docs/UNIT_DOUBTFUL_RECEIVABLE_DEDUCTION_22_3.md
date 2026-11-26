# Unit review — 税理士法人会計帳簿省令 art.22-3(6) (取立不能債権の控除)

Law `326M50000040055`, Article 22-3 item 6. Pinned raw: `data/raw/326M50000040055_20260901_506M60000040025.law.json`.
原文: 「取立不能のおそれのある債権については、事業年度の末日においてその時に取り立てることができないと見込まれる額を控除しなければならない。」

| field | value |
|---|---|
| H | 帳簿価額 = `receivable - estimate` (Nat saturating), unit 円, domain Nat. |
| T | article-scoped pinned needle + kernel boundary examples + universal `agreeBookedAmount`. |
| D | PASS — 700 / 0 / 0 (saturation) / 0 boundaries; 3 universal lemmas. |
| C | Doubtful-receivable identification, valuation date and other items out of scope. |
| U | Whole yen only; no rounding rule in the source. |

Model: `JapanTaxLaw/DoubtfulReceivableDeduction{,Spec,Tests}.lean`. Independent spec uses an explicit conditional; `omega` proves the universal bridge. Human legal review `LEGAL_REVIEW_PENDING`.
