import JapanTaxLaw.TravelerExemptionLimit

/-!
# TravelerExemptionLimit tests — 関税法施行令 art.40 smoke checks
Decidable smoke tests, pinned to law 335CO0000000069 / revision 335CO0000000069_20260401_508CO0000000085.
境界: 199999→true / 200000→true / 200001→false。
-/

namespace JapanTaxLaw.TravelerExemptionLimit

example : limitYen = 200_000 := by decide
example : isAtOrBelowLimit 0 = true := by decide
example : isAtOrBelowLimit 199_999 = true := by decide
example : isAtOrBelowLimit 200_000 = true := by decide
example : isAtOrBelowLimit 200_001 = false := by decide
example : isAtOrBelowLimit 1_000_000 = false := by decide

end JapanTaxLaw.TravelerExemptionLimit
