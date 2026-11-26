import JapanTaxLaw.EmploymentSubsidyAge55to65Spec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.EmploymentSubsidyAge55to65Tests

open JapanTaxLaw.EmploymentSubsidyAge55to65
open JapanTaxLaw.EmploymentSubsidyAge55to65Spec

example : inBand 0 = false := by decide
example : inBand 1 = false := by decide
example : inBand 54 = false := by decide
example : inBand 55 = true := by decide
example : inBand 56 = true := by decide
example : inBand 64 = true := by decide
example : inBand 65 = false := by decide
example : inBand 66 = false := by decide
example : agree 54 := agree_thm 54
example : agree 55 := agree_thm 55
example : agree 64 := agree_thm 64
example : agree 65 := agree_thm 65

end JapanTaxLaw.EmploymentSubsidyAge55to65Tests
