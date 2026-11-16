import JapanTaxLaw.ConsumptionTaxInputCredit

/-!
# ConsumptionTaxInputCredit spec — 消費税法 art. 30(1)（仕入れに係る消費税額の控除）

Sources (pinned; identical to ConsumptionTaxInputCredit.lean):

  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82

Independent restatement of:
  * 特定課税仕入れ税額 = 支払対価 × 7.8%（切り捨て）— impl が standardRate.applyFloor を使うのに対し、
    spec は整数式 `paid * 78 / 1000` で独立に定式化。
  * 控除する合計 = 課税仕入れ税額 + 特定課税仕入れ税額 + 保税貨物税額
  * 控除後 = 課税標準額に対する消費税額 − 合計（saturating Nat 減算）

Scope boundaries identical to the implementation. Underflow（還付）は射程外。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 特定課税仕入れ税額（独立定式: 整数掛け算と切り捨て）。 -/
def specSpecifiedPurchaseTax (paid : Money) : Money := paid * 78 / 1000

/-- Spec: 控除する合計額（独立定式: 要素の順序を変えて加算）。 -/
def specTotalInputTax (dom imp paid : Money) : Money :=
  imp + dom + specSpecifiedPurchaseTax paid

/-- Spec: 控除後税額（saturating Nat 減算）。 -/
def specTaxAfterCredit (output dom paid imp : Money) : Money :=
  output - specTotalInputTax dom imp paid

-- ==== points (kernel-decided) ====

example : specSpecifiedPurchaseTax 100_000 = 7_800 := by decide
example : specSpecifiedPurchaseTax 0 = 0 := by decide
example : specSpecifiedPurchaseTax 1 = 0 := by decide
example : specTotalInputTax 20_000 12_000 100_000 = 39_800 := by decide
example : specTaxAfterCredit 100_000 20_000 100_000 12_000 = 60_200 := by decide
example : specTaxAfterCredit 10_000 20_000 100_000 12_000 = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeConsumptionTaxInputCredit : Bool :=
  [0, 1, 10, 999, 1_000, 100_000, 1_000_000].all fun paid =>
    specifiedPurchaseTax paid == specSpecifiedPurchaseTax paid
  && [ (100_000, 20_000, 12_000, 100_000),
       (10_000, 20_000, 12_000, 100_000),
       (500_000, 50_000, 30_000, 200_000),
       (0, 0, 0, 0) ].all fun (output, dom, imp, paid) =>
       totalInputTax dom imp paid == specTotalInputTax dom imp paid
    && taxAfterCredit output dom paid imp == specTaxAfterCredit output dom paid imp

example : agreeConsumptionTaxInputCredit = true := by decide

end JapanTaxLaw
