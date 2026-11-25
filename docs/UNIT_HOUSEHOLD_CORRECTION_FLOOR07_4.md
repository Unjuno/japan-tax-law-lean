# Unit review — 航空機燃料譲与税法施行規則 art.4(8) (世帯数〇・七下限)

Law `347M50000008026` (航空機燃料譲与税法施行規則), Article 4 paragraph 8.
Pinned raw: `data/raw/347M50000008026_20250905_507M60000008091.law.json`.

原文: 「補正世帯数が、…前年度の世帯数に〇・七を乗じて得た数に満たず、かつ、当該前年度の世帯数から当該補正世帯数を控除して得た数が千を超える場合には、当該補正世帯数は、当該前年度の世帯数に〇・七を乗じて得た数とするものとする。」

| field | value |
|---|---|
| H | `below = 10c < 7p`; `gap = 1000 < p - c`; result scaled = `7p` if both else `10c`. Units: 0.1 世帯, domain Nat. |
| T | article-scoped pinned needle + kernel boundary examples + universal `agreeCorrected`. |
| D | PASS — needle 1/1; boundaries at 差=1000, 差=1001, c/p = 699/1000, 700/1000, 100/2000, 1500/2000. |
| C | The weight/passenger rate tables and 別表第三 airport rates are out of scope. |
| U | Fractional 〇・七 is represented exactly by scaling by 10; no rounding rule is stated in the source. |

Model: `JapanTaxLaw/HouseholdCorrectionFloor07{,Spec,Tests}.lean`. Universal kernel theorems `agreeCorrected` and `specCorrectionRaises`; `omega` bridges the independently written spec (reverse orientation, addition form of the gap). Human legal review `LEGAL_REVIEW_PENDING`.
