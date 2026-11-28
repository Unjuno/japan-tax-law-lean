# Unit review — 不当廉売関税政令 art.1 第一号ロ(1) (ほう素含有量区間)

Law `504CO0000000372`, Article 1 item 1 ロ(1).
原文: 「ほう素の含有量が全重量の〇・〇〇〇八パーセント以上〇・〇〇七パーセント以下のもの。」

| field | value |
|---|---|
| H | 区間 = `80 <= s ∧ s <= 700` (scaled by 10^7; unit 1/10^7 of total weight). |
| T | pinned needle + kernel boundary examples + axiom-free bridge `agreeRange`. |
| D | PASS — 80/700 included, 79/701/0 excluded; `#print axioms` reports none. |
| C | Certification, other elements, carbon, cross-section and zinc plating out of scope. |
| U | Exact scaled representation; whole units only. |

Model: `JapanTaxLaw/BoronContentInterval{,Spec,Tests}.lean`. Human legal review `LEGAL_REVIEW_PENDING`.
