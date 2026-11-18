import JapanTaxLaw.TaxRounding

/-!
# TaxRounding tests — 国税通則法 art. 118/119 端数処理 kernel-decide smoke

Decidable smoke checks for the two truncation primitives. Scope limited to
art. 118(1) (千円未満切り捨て) and art. 119(1) (百円未満切り捨て) at a few
boundary and remainder values. This is a sample, not an exhaustive or
legal-completeness claim.
-/

namespace JapanTaxLaw

-- art. 118(1): 千円未満の端数切り捨て (thousand-yen boundaries)
example : thousandYenFloor 0 = 0 := by decide
example : thousandYenFloor 999 = 0 := by decide
example : thousandYenFloor 1000 = 1000 := by decide
example : thousandYenFloor 1001 = 1000 := by decide
example : thousandYenFloor 1999 = 1000 := by decide
example : thousandYenFloor 12345 = 12000 := by decide
example : thousandYenFloor 100000 = 100000 := by decide

-- art. 119(1): 百円未満の端数切り捨て (hundred-yen boundaries)
example : hundredYenFloor 0 = 0 := by decide
example : hundredYenFloor 99 = 0 := by decide
example : hundredYenFloor 100 = 100 := by decide
example : hundredYenFloor 101 = 100 := by decide
example : hundredYenFloor 199 = 100 := by decide
example : hundredYenFloor 12345 = 12300 := by decide
example : hundredYenFloor 100000 = 100000 := by decide

-- 端数 (fractional leftovers): both rules applied to the same amounts
example : thousandYenFloor 1234567 = 1234000 := by decide
example : hundredYenFloor 1234567 = 1234500 := by decide
example : thousandYenFloor 1 = 0 := by decide
example : hundredYenFloor 1 = 0 := by decide

end JapanTaxLaw
