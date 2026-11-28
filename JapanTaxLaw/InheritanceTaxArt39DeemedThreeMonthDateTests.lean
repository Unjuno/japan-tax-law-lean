import JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDateSpec

/-!
# InheritanceTaxArt39DeemedThreeMonthDate tests — kernel-decided checks

Pinned to law 325AC0000000073 / revision 325AC0000000073_20260401_506AC0000000008.
境界: みなし月数 2/3/4（3か月）。
-/

namespace JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate

example : defaultMonths = 0 + 3 := by decide
example : defaultMonths = 2 + 1 := by decide
example : defaultMonths = 3 + 0 := by decide
example : defaultMonths = 4 - 1 := by decide
example : deemedMonth 0 = 3 := by decide
example : deemedMonth 1 = 4 := by decide
example : deemedMonth 2 = 5 := by decide
example : deemedMonth 3 = 6 := by decide
example : deemedMonth 4 = 7 := by decide
example : specDeemed 12 = 15 := by decide
example : specDeemed 0 = deemedMonth 0 := by decide

end JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate
