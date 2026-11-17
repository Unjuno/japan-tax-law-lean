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


-- ============================================================
-- art. 30(2) — 課税売上割合による按分（独立定式）
namespace ApportionmentSpec

open JapanTaxLaw.TaxFinance

def specNeedsApportionment (sales : Money) (num den : Money) : Bool :=
  decide (sales > 500_000_000 || num * 100 < 95 * den)

def specCommonPortion (common num den : Money) : Money := common * num / den

def specApportionedSeparated (excl common num den : Money) : Money :=
  excl + common * num / den

def specApportionedUnseparated (total num den : Money) : Money := total * num / den

example : specNeedsApportionment 100_000_000 95 100 = false := by decide
example : specNeedsApportionment 500_000_001 95 100 = true := by decide
example : specNeedsApportionment 100_000_000 90 100 = true := by decide
example : specCommonPortion 200_000 95 100 = 190_000 := by decide
example : specApportionedSeparated 100_000 200_000 95 100 = 290_000 := by decide
example : specApportionedUnseparated 300_000 90 100 = 270_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeApportionment : Bool :=
  let r95 : TaxRate := ⟨95, 100, by decide⟩
  let r90 : TaxRate := ⟨90, 100, by decide⟩
  Apportionment.needsApportionment 100_000_000 r95 == specNeedsApportionment 100_000_000 95 100
  && Apportionment.needsApportionment 500_000_001 r95 == specNeedsApportionment 500_000_001 95 100
  && Apportionment.needsApportionment 100_000_000 r90 == specNeedsApportionment 100_000_000 90 100
  && Apportionment.commonPortion 200_000 r95 == specCommonPortion 200_000 95 100
  && Apportionment.apportionedIfSeparated 100_000 200_000 r95 == specApportionedSeparated 100_000 200_000 95 100
  && Apportionment.apportionedIfUnseparated 300_000 r90 == specApportionedUnseparated 300_000 90 100

example : agreeApportionment = true := by decide

end ApportionmentSpec

end JapanTaxLaw
