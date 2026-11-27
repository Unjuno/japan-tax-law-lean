import JapanTaxLaw.TaxCreditMonthCap12RoundUpSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.TaxCreditMonthCap12RoundUpTests

open JapanTaxLaw.TaxCreditMonthCap12RoundUp
open JapanTaxLaw.TaxCreditMonthCap12RoundUpSpec

example : cappedMonths 0 = 1 := by decide
example : cappedMonths 1 = 1 := by decide
example : cappedMonths 0 = 1 := by decide
example : cappedMonths 1 = 1 := by decide
example : cappedMonths 2 = 2 := by decide
example : cappedMonths 11 = 11 := by decide
example : cappedMonths 12 = 12 := by decide
example : cappedMonths 13 = 12 := by decide
example : agree 0 := agree_thm 0
example : agree 1 := agree_thm 1
example : agree 12 := agree_thm 12
example : agree 13 := agree_thm 13

end JapanTaxLaw.TaxCreditMonthCap12RoundUpTests
