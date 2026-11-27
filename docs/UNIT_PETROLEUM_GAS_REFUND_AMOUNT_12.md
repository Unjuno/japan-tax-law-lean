# Unit review — 石油ガス税法施行規則 art.12(3)(1) (販売代金領収不能の金額)

Law `341CO0000000005`, Article 12 §3 item 1.
原文: 「販売代金の領収をすることができなくなつた課税石油ガスの重量…につき、…石油ガス税の税率により計算した金額（…他の法律の規定により控除又は還付を受ける石油ガス税額に相当する金額を除く。）」

| field | value |
|---|---|
| H | 金額 = `weight * rate - credit` (円, Nat, saturating). |
| T | pinned needle + kernel boundaries + universal `agreeRefund`. |
| D | PASS — 4000 / 0 / 0 / 0; 3 universal lemmas; axioms `[propext, Quot.sound]`. |
| C | Approval procedure, exempt-weight determination, rate selection and credit basis out of scope. |
| U | Whole yen only. |

Model: `JapanTaxLaw/PetroleumGasRefundAmount{,Spec,Tests}.lean`. Human legal review `LEGAL_REVIEW_PENDING`.
