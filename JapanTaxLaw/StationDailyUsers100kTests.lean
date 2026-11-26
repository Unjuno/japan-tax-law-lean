import JapanTaxLaw.StationDailyUsers100kSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.StationDailyUsers100kTests

open JapanTaxLaw.StationDailyUsers100k
open JapanTaxLaw.StationDailyUsers100kSpec

example : qualified 0 = false := by decide
example : qualified 1 = false := by decide
example : qualified 99999 = false := by decide
example : qualified 100000 = true := by decide
example : qualified 100001 = true := by decide
example : specQualified 99999 = false := by decide
example : specQualified 100000 = true := by decide
example : specQualified 100001 = true := by decide
example : agree 99999 := agree_thm 99999
example : agree 100000 := agree_thm 100000
example : agree 100001 := agree_thm 100001

end JapanTaxLaw.StationDailyUsers100kTests
