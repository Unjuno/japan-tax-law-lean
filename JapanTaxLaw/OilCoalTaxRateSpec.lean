import JapanTaxLaw.OilCoalTaxRate

/-!
# OilCoalTaxRate spec — 石油石炭税法 art.9 の独立整数定式
Sources (pinned): law 353AC0000000025, revision 353AC0000000025_20260525_506AC0000000052.
Independent restatement: 税額 = 税率 × 数量、3 税率 = 2040/1080/700。
-/

namespace JapanTaxLaw.OilCoalTaxRate

example : 2040 = 2_040 := by decide
example : 1080 = 1_080 := by decide
example : 700 = 700 := by decide

def agreeOilCoalTaxRate : Bool :=
  [0,1,2,3,10].all fun n =>
    crudeOilTax n == 2040*n && gaseousHCTax n == 1080*n && coalTax n == 700*n

example : agreeOilCoalTaxRate = true := by decide

end JapanTaxLaw.OilCoalTaxRate
