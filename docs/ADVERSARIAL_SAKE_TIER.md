# Adversarial review — 酒税法 art. 23(1)三 tiered amount

Unit: `NORM|357718120dc5d73305dba5f4884ee941c800423843672b294650d98af017cc47`
Verbatim: 「二十万円（アルコール分が二十一度以上のものにあつては、二十万円に
アルコール分が二十度を超える一度ごとに一万円を加えた金額）」

- **H**: the tier could be miscomputed (e.g. +¥10,000 per degree above 21
  instead of above 20), or the trigger misread as exclusive.
- **T**: re-extract art. 23(1)三; parse 二十万円 → 200,000 and 一万円 → 10,000
  (auditor D=PASS); inspect `tieredAmount` (trigger 21 inclusive, increment per
  degree above 20); kernel boundaries 19/20/21/22/30; `#print axioms`.
- **D**: verbatim located; both constants present in spec and impl; boundaries
  kernel-decide 200,000 / 200,000 / 210,000 / 220,000 / 300,000. Agreement
  with the saturation-based spec is universal over all degrees. `at_20` /
  `at_21` are axiom-free; `agree_spec_impl` uses standard `propext`. The
  quantity to which the amount applies is caller-established and out of scope.
- **Source-path defect found**: the queue's `source_file` field spells the law
  id with 14 characters (`328AC000000006…`) while the e-Gov law id is 15
  (`328AC0000000006`). Fetching the former returns HTTP 400. This review
  re-pinned the correct revision
  `328AC0000000006_20260525_506AC0000000052`, SHA-256
  `01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70`,
  and the audit used that file. The queue defect is recorded, not hidden.
- **U**: the tax base (quantity) and human legal review remain open.
