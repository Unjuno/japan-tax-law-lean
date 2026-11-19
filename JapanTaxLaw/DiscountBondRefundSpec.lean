import JapanTaxLaw.DiscountBondRefund

/-!
# DiscountBondRefundSpec — 租税特別措置法施行令 art. 26の12 の独立定式

Sources (pinned; identical to DiscountBondRefund.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatements of the modelled computations in plain `Nat`,
**not** reusing the implementation's `TaxRate` / `TaxRate.applyFloor`:
the rate is passed as raw numerator/denominator and percentages are written
as `* num / den`, and every saturating subtraction / zero-denominator case is
spelled out with an explicit `if`.

  * 本則
      impl: `discountBondRefund f r rate = rate.applyFloor (f - r)`
      spec: `specDiscountBondRefund f r num den
               = if r ≤ f then (num * (f - r)) / den else 0`
    — 被乗数の順序を入れ替えた独立整数定式。

  * 一号・二号の金額（外国法人分の基盤）
      impl: `foreignBondBase f r disc dom = (f - r) * dom / disc`
      spec: `specForeignBondBase f r disc dom
               = if disc = 0 then 0
                 else if r ≤ f then (dom * (f - r)) / disc else 0`
    — 分母零・saturating を明示した独立定式。

  * 外国法人分の還付額
      impl: `foreignBondRefund f r disc dom rate = rate.applyFloor (foreignBondBase f r disc dom)`
      spec: `specForeignBondRefund f r disc dom num den
               = (num * specForeignBondBase f r disc dom) / den`
    — impl の税率適用を独立定式で書き直したもの。

各 `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
分母零・券面 = 償還・券面 < 償還・端数切り捨てをサンプルに含める。

Scope boundaries identical to the implementation. 券面金額・償還金額・買入金額・
税率・社債発行差金・国内帰属部分・一号／二号該当性はすべて caller-established。
**平成二十六年旧法人税法第百四十一条の外国法人の具体的認定は NOT MODELLED**
（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.DiscountBondRefund

open JapanTaxLaw.TaxFinance

-- ==== independent formulas（TaxRate / applyFloor を使わない） ====

/-- Spec: 本則の還付額（被乗数を入れ替え、saturating を明示）。 -/
def specDiscountBondRefund (faceAmount redemptionAmount num den : Money) : Money :=
  if redemptionAmount ≤ faceAmount then
    (num * (faceAmount - redemptionAmount)) / den
  else 0

/-- Spec: 一号・二号の金額（分母零・saturating を明示）。 -/
def specForeignBondBase (faceAmount redemptionAmount issuanceDiscount domesticPart : Money) : Money :=
  if issuanceDiscount = 0 then 0
  else if redemptionAmount ≤ faceAmount then
    (domesticPart * (faceAmount - redemptionAmount)) / issuanceDiscount
  else 0

/-- Spec: 外国法人分の還付額（税率適用を独立定式で）。 -/
def specForeignBondRefund (faceAmount redemptionAmount issuanceDiscount domesticPart num den : Money) : Money :=
  (num * specForeignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart) / den

-- ==== points（kernel-decided） ====

example : specDiscountBondRefund 1_000_000 900_000 10 100 = 10_000 := by decide
example : specDiscountBondRefund 1_000 1_000 10 100 = 0 := by decide
example : specDiscountBondRefund 500 1_000 10 100 = 0 := by decide
example : specDiscountBondRefund 1_001 1_000 20 100 = 0 := by decide
example : specDiscountBondRefund 1_050 1_000 3 10 = 15 := by decide

example : specForeignBondBase 1_000_000 900_000 100_000 25_000 = 25_000 := by decide
example : specForeignBondBase 1_000 900 0 100 = 0 := by decide
example : specForeignBondBase 1_000 1_000 100 50 = 0 := by decide
example : specForeignBondBase 1_000 900 100 100 = 100 := by decide
example : specForeignBondBase 1_000 991 7 3 = 3 := by decide

example : specForeignBondRefund 1_000_000 900_000 100_000 25_000 10 100 = 2_500 := by decide
example : specForeignBondRefund 1_000 1_000 100 50 10 100 = 0 := by decide
example : specForeignBondRefund 1_000 900 0 100 10 100 = 0 := by decide
example : specForeignBondRefund 1_000 900 100 100 3 10 = 30 := by decide

-- ==== agreement checks（impl ↔ spec、有限点の == 一致） ====

/-- 本則: impl ≡ spec。税率は `(num, succ dm)` で構成し、分母 > 0 を構成的に担保。 -/
def agreeDiscountBondRefund : Bool :=
  [ (0, 0, 0, 99), (1_000, 1_000, 10, 99), (1_000, 900, 10, 99),
    (500, 1_000, 10, 99), (1_001, 1_000, 20, 99), (1_050, 1_000, 3, 9),
    (1_000, 0, 0, 99), (1_000_000, 900_000, 20, 99), (123_457, 100_000, 7, 8) ].all
    fun (f, r, n, dm) =>
      discountBondRefund f r (⟨n, Nat.succ dm, Nat.succ_pos dm⟩ : TaxRate) ==
        specDiscountBondRefund f r n (Nat.succ dm)

/-- 一号・二号の金額: impl ≡ spec（分母零・券面 = 償還・端数を含む）。 -/
def agreeForeignBondBase : Bool :=
  [ (0, 0, 0, 0), (1_000, 900, 0, 100), (1_000, 1_000, 100, 50),
    (500, 1_000, 100, 50), (1_000_000, 900_000, 100_000, 25_000),
    (1_000, 900, 100, 100), (1_000, 999, 3, 1), (1_000, 991, 7, 3),
    (1_000, 900, 200, 150) ].all
    fun (f, r, disc, dom) =>
      foreignBondBase f r disc dom == specForeignBondBase f r disc dom

/-- 外国法人分の還付額: impl ≡ spec。 -/
def agreeForeignBondRefund : Bool :=
  [ (1_000_000, 900_000, 100_000, 25_000, 10, 99),
    (1_000, 1_000, 100, 50, 10, 99),
    (1_000, 900, 0, 100, 10, 99),
    (1_000, 900, 100, 100, 3, 9),
    (1_000, 999, 3, 1, 20, 99),
    (1_000, 991, 7, 3, 11, 9) ].all
    fun (f, r, disc, dom, n, dm) =>
      foreignBondRefund f r disc dom (⟨n, Nat.succ dm, Nat.succ_pos dm⟩ : TaxRate) ==
        specForeignBondRefund f r disc dom n (Nat.succ dm)

example : agreeDiscountBondRefund = true := by decide
example : agreeForeignBondBase = true := by decide
example : agreeForeignBondRefund = true := by decide

end JapanTaxLaw.DiscountBondRefund
