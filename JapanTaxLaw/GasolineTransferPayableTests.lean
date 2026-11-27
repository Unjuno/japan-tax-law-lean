import JapanTaxLaw.GasolineTransferPayable

/-!
# GasolineTransferPayable tests — kernel-decided boundary examples
Pinned to law 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052, art. 10.
Unit: 円; saturating difference of two provider item taxes.
-/

namespace JapanTaxLaw.GasolineTransferPayable

example : transferPayable 0 0 = 0 := by decide
example : transferPayable 1 0 = 1 := by decide
example : transferPayable 100 0 = 100 := by decide
example : transferPayable 100 40 = 60 := by decide
example : transferPayable 100 100 = 0 := by decide
example : transferPayable 100 140 = 0 := by decide

end JapanTaxLaw.GasolineTransferPayable
