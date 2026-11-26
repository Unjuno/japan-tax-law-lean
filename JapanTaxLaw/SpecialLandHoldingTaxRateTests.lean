import JapanTaxLaw.SpecialLandHoldingTaxRate

/-!
# SpecialLandHoldingTaxRateTests — 地方税法 art.594 の回帰テスト

Pinned: law 325AC0000000226 / revision ..._20261101_508AC0000000002.
境界（0）、1.4% = 14/1000、3% = 3/100、10倍誤りの排除を検査。
認定・課税標準・免除・附則は NOT MODELLED。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : specialLandHoldingLandRate.num = 14 := by decide
example : specialLandHoldingLandRate.den = 1000 := by decide
example : specialLandHoldingAcquisitionRate.num = 3 := by decide
example : specialLandHoldingAcquisitionRate.den = 100 := by decide

example : specialLandHoldingLandTax 0 = 0 := by decide
example : specialLandHoldingAcquisitionTax 0 = 0 := by decide
example : specialLandHoldingLandTax 1000 = 14 := by decide
example : specialLandHoldingAcquisitionTax 1000 = 30 := by decide
example : specialLandHoldingLandTax 1_000_000 = 14_000 := by decide
example : specialLandHoldingAcquisitionTax 1_000_000 = 30_000 := by decide
example : specialLandHoldingLandTax 1_000_000 ≠ 140_000 := by decide
example : specialLandHoldingAcquisitionTax 1_000_000 ≠ 3_000 := by decide

end JapanTaxLaw
