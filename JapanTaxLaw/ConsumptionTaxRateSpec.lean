import JapanTaxLaw.ConsumptionTaxRate

/-!
# ConsumptionTaxRate spec — independent statement of 消費税法 art. 29

Source (pinned):
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82

Independent restatement of 消費税法 art. 29 (税率):

  一 課税資産の譲渡等（軽減対象課税資産の譲渡等を除く）、特定課税仕入れ、
      保税地域引取課税貨物 — 百分の七・八 (7.8%)
  二 軽減対象課税資産の譲渡等、保税地域引取軽減対象課税貨物 —
      百分の六・二四 (6.24%)
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Independent form of art. 29. -/
def specConsumptionTax (base : Money) (reduced : Bool) : Money :=
  if reduced then base * 624 / 10000 else base * 78 / 1000

-- Boundary points, kernel-verified.
example : specConsumptionTax 100_000 false = 7_800 := by decide
example : specConsumptionTax 100_000 true = 6_240 := by decide
example : specConsumptionTax 1_000_000 false = 78_000 := by decide
example : specConsumptionTax 1_000_000 true = 62_400 := by decide

/-- Tax on 0 base is 0 under either rate. -/
example : specConsumptionTax 0 false = 0 := by decide
example : specConsumptionTax 0 true = 0 := by decide

/-- The two rates separated: standard is exactly 25/20 of reduced at tested points. -/
example : specConsumptionTax 10_000_000 false = 780_000 := by decide
example : specConsumptionTax 10_000_000 true = 624_000 := by decide

set_option maxRecDepth 2048

/-- Spec ≡ impl: checked at a spread of sample points. -/
def consTaxRateCheckGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => specConsumptionTax 0 false == consumptionTax 0 false &&
           specConsumptionTax 0 true == consumptionTax 0 true
    | k + 1 =>
        let base := (k + 1) * 37_500
        go k && (specConsumptionTax base false == consumptionTax base false &&
                 specConsumptionTax base true == consumptionTax base true)
  go 40

example : consTaxRateCheckGrid = true := by decide

/-- The reduced rate applies the same ceiling at smaller proportions:
    at every representable sample point it is strictly lower than standard. -/
def reducedLower : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => true
    | k + 1 =>
        let base := (k + 1) * 50_000
        go k && (specConsumptionTax base true < specConsumptionTax base false)
  go 40

example : reducedLower = true := by decide

end JapanTaxLaw
