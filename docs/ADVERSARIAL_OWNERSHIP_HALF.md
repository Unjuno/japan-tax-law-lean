# Adversarial review — 相続税法施行令 art. 31(4)一 >50% ownership

Unit: `NORM|b338babb5647936d561ccd8e4a53d660b56a474820cd86dbadcc18e7ef62686a`
Verbatim: 「…発行済株式等の百分の五十を超える株式等が同項の個人等により
所有されている場合」

- **H**: the comparison could be inclusive (≥50%) rather than the statute's
  strict 「超える」, or use division that fails for a zero total.
- **T**: re-extract art. 31(4)一; parse 百分の五十 → [50,100] (auditor D=PASS);
  inspect `exceedsHalf` (cross-multiplied strict test); boundaries
  50/100, 51/100, 1/2, 5,001/10,000; `#print axioms`.
- **D**: verbatim located; constants [50,100] present in spec and impl;
  boundaries kernel-decide false/true/false/true. `exactly_half` and
  `just_over_half` are axiom-free; `agree_spec_impl` uses standard `propext`.
  Share counts are caller-established; `totalShares = 0` is not a valid
  fraction and is caller-excluded. The shareholder identities and the preceding
  paragraph's conditions are out of scope.
- **C**: an inclusive reading is recorded as a competing interpretation.
- **U**: the actual share register and human legal review pending.
