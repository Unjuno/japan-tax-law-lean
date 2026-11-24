import JapanTaxLaw.AutoWeightGrantRoundingSpec

/-! Boundary examples for 自動車重量譲与税法 art.4 (kernel-decided). -/

namespace JapanTaxLaw.AutoWeightGrantRounding

open JapanTaxLaw.TaxFinance

example : floorThousandYen 0 = 0 := by decide
example : floorThousandYen 1 = 0 := by decide
example : floorThousandYen 999 = 0 := by decide
example : floorThousandYen 1000 = 1000 := by decide
example : floorThousandYen 1001 = 1000 := by decide
example : floorThousandYen 1999 = 1000 := by decide
example : floorThousandYen 2000 = 2000 := by decide
example : specFloor 999 = 0 := by decide
example : specFloor 1000 = 1000 := by decide
example : specFloor 1001 = 1000 := by decide
example : specFloor 1999 = floorThousandYen 1999 := agreeRound 1999

end JapanTaxLaw.AutoWeightGrantRounding
