import JapanTaxLaw.FixedAssetEvalEnforcementDate

/-!
# FixedAssetEvalEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 328M50000002091 / revision 328M50000002091_20240425_506M60000008045.
昭和57年 = 1982、施行日 1982-04-01。
-/

namespace JapanTaxLaw.FixedAssetEvalEnforcementDate

example : showaToSeireki 57 = 1982 := by decide
example : enforcementDate = (1982, 4, 1) := by decide
example : inForce (1982, 3, 31) = false := by decide
example : inForce (1982, 4, 1) = true := by decide

end JapanTaxLaw.FixedAssetEvalEnforcementDate
