import JapanTaxLaw.LocalCapitalBand10M100MSpec

/-! Kernel-decided boundary examples: (lo, hi]. -/

namespace JapanTaxLaw.LocalCapitalBand10M100MTests

open JapanTaxLaw.LocalCapitalBand10M100M
open JapanTaxLaw.LocalCapitalBand10M100MSpec

example : inBand 0 = false := by decide
example : inBand 10000000 = false := by decide
example : inBand 10000001 = true := by decide
example : inBand 100000000 = true := by decide
example : inBand 100000001 = false := by decide
example : specInBand 10000000 = false := by decide
example : specInBand 10000001 = true := by decide
example : specInBand 100000000 = true := by decide
example : specInBand 100000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 10000000 := agree_thm 10000000
example : agree 10000001 := agree_thm 10000001
example : agree 100000000 := agree_thm 100000000
example : agree 100000001 := agree_thm 100000001

end JapanTaxLaw.LocalCapitalBand10M100MTests
