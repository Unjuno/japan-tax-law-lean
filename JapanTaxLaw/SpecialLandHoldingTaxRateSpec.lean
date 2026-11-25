import JapanTaxLaw.SpecialLandHoldingTaxRate

/-!
# SpecialLandHoldingTaxRateSpec — 地方税法 第五百九十四条 の独立定式

Sources (pinned; identical to SpecialLandHoldingTaxRate.lean):

  Law id: 325AC0000000226 / revision ..._20261101_508AC0000000002

Independent restatements:

  * 土地: impl `base * 14 / 1000`、spec `(14 * base) / 1000`
  * 取得: impl `base * 3 / 100`、spec `(3 * base) / 100`

各 `agree*` はカーネルが `decide` で決定する有限点の一致確認であり、
法的意味の等価証明ではない。丸めは切り捨て（Nat 除算）。
Scope: 課税標準・該当性・免除・附則は caller-established / NOT MODELLED。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specLandTax (base : Money) : Money := (14 * base) / 1000
def specAcquisitionTax (base : Money) : Money := (3 * base) / 100

def agreeLandZero : Bool := specialLandHoldingLandTax 0 == specLandTax 0
def agreeLand1m : Bool := specialLandHoldingLandTax 1_000_000 == specLandTax 1_000_000
def agreeLandOdd : Bool := specialLandHoldingLandTax 1_234_567 == specLandTax 1_234_567
def agreeAcqZero : Bool := specialLandHoldingAcquisitionTax 0 == specAcquisitionTax 0
def agreeAcq1m : Bool := specialLandHoldingAcquisitionTax 1_000_000 == specAcquisitionTax 1_000_000
def agreeAcqOdd : Bool := specialLandHoldingAcquisitionTax 1_234_567 == specAcquisitionTax 1_234_567

example : agreeLandZero = true := by decide
example : agreeLand1m = true := by decide
example : agreeLandOdd = true := by decide
example : agreeAcqZero = true := by decide
example : agreeAcq1m = true := by decide
example : agreeAcqOdd = true := by decide

end JapanTaxLaw
