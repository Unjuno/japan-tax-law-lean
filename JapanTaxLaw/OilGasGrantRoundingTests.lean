import JapanTaxLaw.OilGasGrantRoundingSpec

/-!
# OilGasGrantRoundingTests — boundary examples for art.4 truncation

All examples are decided by the Lean kernel (`by decide`).  The universal
correspondence theorem lives in the Spec module; these are boundary checks.
-/

namespace JapanTaxLaw.OilGasGrantRounding

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

end JapanTaxLaw.OilGasGrantRounding
