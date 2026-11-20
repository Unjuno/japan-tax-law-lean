### GiftSpecialDeduction.lean

- Module: `JapanTaxLaw/GiftSpecialDeduction.lean` (+ `Spec`, `Tests`)
- Law: 相続税法 (law id 325AC0000000073), revision
  `325AC0000000073_20260401_506AC0000000008`, art. 21の12(1)
- 一次資料: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  article `Num=21_12`.

**独立再抽出 (independent re-extraction).** 1項: 「…特定贈与者ごとの…控除後の
贈与税の課税価格からそれぞれ次に掲げる金額のうちいずれか低い金額を控除する。
一 二千五百万円（既にこの条の規定の適用を受けて控除した金額がある場合には、
その金額の合計額を控除した残額）二 …控除後の贈与税の課税価格」。

**照合 (comparison).** `specGiftSpecialDeduction price prev` computes
`remaining = 25_000_000 - prev` (saturating at 0 when `prev ≥ 25_000_000`) and
returns `min(price, remaining)`, matching 一号/二号の「いずれか低い金額」.
The implementation uses `Nat.min` and `giftSpecialDeductionLimit`, while the
spec uses a nested `if` with integer literals — an independent formulation.

**H (falsifiable).** If the `min` were replaced by `max`, the kernel-decided
example `30_000_000 → 25_000_000` would instead yield `30_000_000`.

**T (reproduction).** Re-extract article 21の12 from the pinned JSON; run
`lake build JapanTaxLaw.GiftSpecialDeductionSpec` and its Tests module.

**D (判定).** PASS for the modelled amount formula of 1項. Not a claim about
the whole article.

**C (competing interpretation).** 「残額」 cannot be negative; the saturating
branch at `prev ≥ 25M` is the only reading consistent with Nat amounts. The
test `(20M, 30M) → 0` pins this boundary.

**U (uncertainty).** 2項 (期限内申告書の記載要件・財務省令事項) and 3項
(やむを得ない事情がある場合の書類提出) are NOT MODELLED; the caller supplies
`price` and `prev` and the filing conditions are outside this slice. Human
legal review remains pending.

Reviewed independently of the implementer; no legal conclusion is drawn.

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

### NonpaymentSurcharge.lean

- Module: `JapanTaxLaw/NonpaymentSurcharge.lean` (+ `Spec`, `Tests`)
- Law: 国税通則法 (law id 337AC0000000066), revision
  `337AC0000000066_20261101_507AC0000000013`, art. 67(1)(2)
- 一次資料: `data/raw/337AC0000000066_20261101_507AC0000000013.law.json`,
  article `Num=67`.

**独立再抽出 (independent re-extraction).** 1項: 「…告知に係る税額又はその法定
納期限後に当該告知を受けることなく納付された税額に百分の十の割合を乗じて計算
した金額に相当する不納付加算税を徴収する」。2項: 「…当該国税についての調査が
あつたことにより…告知があるべきことを予知してされたものでないときは…当該納付
された税額に百分の五の割合を乗じて計算した金額とする」。

**照合 (comparison).** `specNonpaymentSurchargeBasic tax = tax * 10 / 100`
corresponds to 百分の十; `specNonpaymentSurchargeReduced tax = tax * 5 / 100`
corresponds to 百分の五. `reduced : Bool` selects 2項 only when the payer did
not foresee the assessment; the caller establishes that fact, as documented.
The implementation uses `TaxRate.applyFloor` while the spec uses an integer
expression — an independent formulation, not an alias.

**H (falsifiable).** If the two rates were swapped, the kernel-decided examples
`100_000 → 10_000` and `100_000 → 5_000` would fail.

**T (reproduction).** Re-extract article 67 from the pinned JSON; run
`lake build JapanTaxLaw.NonpaymentSurchargeSpec` and its Tests module.

**D (判定).** PASS for the modelled rate-selection slice of 1項/2項. This is
not a claim about the whole article.

**C (competing interpretation).** 「予知してされたものでない」 is a
caller-established legal judgement; the model does not decide it. That is a
documented scope boundary, not a rate error.

**U (uncertainty).** 1項但し書 (正当な理由 → この限りでない) and 3項 (政令で定める
場合 + 法定納期限から一月 → 適用しない) are NOT MODELLED; the corresponding
conditions are outside this slice. Human legal review remains pending.

Reviewed independently of the implementer; no legal conclusion is drawn.
