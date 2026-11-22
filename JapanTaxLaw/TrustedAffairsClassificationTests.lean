import JapanTaxLaw.TrustedAffairsClassification

/-!
# TrustedAffairsClassification tests — 第一号法定受託事務 smoke checks
Decidable smoke tests, pinned to law 504CO0000000300 / revision 504CO0000000300_20260401_508CO0000000083.
第一号法定受託事務(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.TrustedAffairsClassification

example : isTrustedAffair 0 = true := by decide
example : isTrustedAffair 1 = false := by decide
example : isTrustedAffair 2 = false := by decide

end JapanTaxLaw.TrustedAffairsClassification
