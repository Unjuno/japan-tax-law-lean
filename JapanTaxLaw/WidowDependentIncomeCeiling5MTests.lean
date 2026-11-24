import JapanTaxLaw.WidowDependentIncomeCeiling5M

/-!
# WidowDependentIncomeCeiling5M tests — 五百万円境界の検査

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
zero / small input / just-below / at / just-above the statutory ceiling.
-/

namespace JapanTaxLaw.WidowDependentIncomeCeiling5M

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 4_999_999 = true := by decide
example : withinCeiling 5_000_000 = true := by decide
example : withinCeiling 5_000_001 = false := by decide
example : withinCeiling 10_000_000 = false := by decide

end JapanTaxLaw.WidowDependentIncomeCeiling5M
