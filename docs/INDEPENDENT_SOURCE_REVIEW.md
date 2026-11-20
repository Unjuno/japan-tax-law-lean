# Independent source-correspondence reviews (module-specific)

Each section is produced by an ADVERSARIAL reviewer who did not implement the
corresponding module. Reviews are recorded with H/T/D/C/U and are separate
from Lean proof and from human legal review.

### DeemedCapitalGainsCost.lean

- Module: `JapanTaxLaw/DeemedCapitalGainsCost.lean` (+ `Spec`, `Tests`)
- Law: 租税特別措置法 (law id 332AC0000000026), revision
  `332AC0000000026_20261101_507AC0000000013`, art. 31の4(1)
- 一次資料: `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`,
  article `Num=31_4`, SHA-256
  `E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE`.

**独立再抽出 (independent re-extraction from the pinned bytes).** The clause
reads: 「個人が昭和二十七年十二月三十一日以前から引き続き所有していた土地等又
は建物等を譲渡した場合…収入金額から控除する取得費は…当該収入金額の百分の五に
相当する金額とする。ただし、当該金額がそれぞれ次の各号に掲げる金額に満たない
ことが証明された場合には、当該各号に掲げる金額とする。」

**照合 (comparison with the independent spec).** `specDeemedCost` requires
`isIndividual && heldSince1952OrEarlier` (柱書), computes
`transferPrice * 5 / 100` (百分の五), and selects
`max(pct5, provenDocumentedCost)` only when `canProveDocumentedCost` is
established (ただし書). The strict inequality 「満たない」 and the equality
case are handled correctly: at equality both branches return the same amount.
`101 → 5` and `1,000,000 → 50,000` were re-checked as boundary/rounding cases.

**H (falsifiable hypothesis).** If the spec inverted the proviso, a proven cost
*below* 5% would be returned instead of 5%; the kernel-decided example at
`(true,true,100_000_000,1_000_000,true) = 5_000_000` would fail.

**T (reproduction).** Re-extract article `31_4` from the pinned JSON above;
run `lake build JapanTaxLaw.DeemedCapitalGainsCostSpec` and the Tests module.

**D (判定).** PASS for the modelled 1項 slice: 柱書要件, 百分の五, ただし書の
選択 and the non-applicable branches agree with 原文. This is not a claim about
the whole article.

**C (competing interpretation).** One could read 「満たない」 as `≤` rather
than `<`; at equality the implemented result is identical, so the
interpretation does not change the amount. 2項の読み替え (山林→土地建物等) is
a separate rule and is outside this slice.

**U (uncertainty).** 二号の「所得税法第三十八条第二項の規定を適用した場合…
取得費とされる金額」 is supplied by the caller (`provenDocumentedCost`) and
所得税法38(2) itself is NOT MODELLED. 2項の準用・読み替え is NOT MODELLED.
Human legal review of the statutory interpretation remains pending.

Reviewed independently of the implementer; no legal conclusion is drawn.
