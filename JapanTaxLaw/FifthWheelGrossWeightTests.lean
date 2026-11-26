import JapanTaxLaw.FifthWheelGrossWeightSpec

/-! Kernel-decided boundary examples for 登録免許税法施行規則 art.5(1). -/
namespace JapanTaxLaw.FifthWheelGrossWeight

example : grossWeight 10000 3000 2000 = 9000 := by decide
example : grossWeight 10000 10000 2000 = 2000 := by decide
example : grossWeight 10000 12000 2000 = 2000 := by decide
example : grossWeight 0 0 0 = 0 := by decide
example : specGrossWeight 10000 3000 2000 = 9000 := by decide
example : specGrossWeight 10000 12000 2000 = 2000 := by decide
example : specGrossWeight 10000 3000 2000 = grossWeight 10000 3000 2000 := agreeGrossWeight 10000 3000 2000
example : specGrossWeight 10000 12000 2000 = grossWeight 10000 12000 2000 := agreeGrossWeight 10000 12000 2000
example : grossWeight 10000 12000 2000 = 2000 := atTowingFloor 10000 12000 2000 (by decide)
example : grossWeight 10000 3000 2000 <= grossWeight 10000 3000 3000 := monotoneInTowing 10000 3000 2000 3000 (by decide)
example : grossWeight 10000 3000 2000 <= grossWeight 11000 3000 2000 := monotoneInRecorded 10000 11000 3000 2000 (by decide)

end JapanTaxLaw.FifthWheelGrossWeight
