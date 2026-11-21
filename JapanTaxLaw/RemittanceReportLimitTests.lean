import JapanTaxLaw.RemittanceReportLimit

/-!
# RemittanceReportLimit tests — 国外送金等調書 上限額 smoke checks
Decidable smoke tests, pinned to law 409CO0000000363 / revision 409CO0000000363_20250501_507CO0000000128.
境界: 999999→true / 1000000→true / 1000001→false。
-/

namespace JapanTaxLaw.RemittanceReportLimit

example : limitYen = 1_000_000 := by decide
example : isAtOrBelowLimit 0 = true := by decide
example : isAtOrBelowLimit 999_999 = true := by decide
example : isAtOrBelowLimit 1_000_000 = true := by decide
example : isAtOrBelowLimit 1_000_001 = false := by decide
example : isAtOrBelowLimit 5_000_000 = false := by decide

end JapanTaxLaw.RemittanceReportLimit
