import JapanTaxLaw.RealPropertyAcquisitionTaxRate

/-!
# RealPropertyAcquisitionTaxRate spec — 4% の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
-/

namespace JapanTaxLaw.RealPropertyAcquisitionTaxRate

def specTax (b : Nat) : Nat := b * 4 / 100

example : specTax 1000 = 40 := by decide
example : specTax 10000 = 400 := by decide

def agreeRealPropertyAcquisitionTaxRate : Bool :=
  [0, 1, 100, 1000, 10000].all fun b => taxYen b == specTax b

example : agreeRealPropertyAcquisitionTaxRate = true := by decide

end JapanTaxLaw.RealPropertyAcquisitionTaxRate
