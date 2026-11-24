import JapanTaxLaw.DisasterIncomeBand75M10MSpec

/-! Kernel-decided boundary examples: 0/7500000/7500001/10000000/10000001. -/

namespace JapanTaxLaw.DisasterIncomeBand75M10MTests

open JapanTaxLaw.DisasterIncomeBand75M10M
open JapanTaxLaw.DisasterIncomeBand75M10MSpec

example : inBand 0 = false := by decide
example : inBand 7500000 = false := by decide
example : inBand 7500001 = true := by decide
example : inBand 10000000 = true := by decide
example : inBand 10000001 = false := by decide
example : specInBand 7500000 = false := by decide
example : specInBand 7500001 = true := by decide
example : specInBand 10000000 = true := by decide
example : specInBand 10000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 7500000 := agree_thm 7500000
example : agree 7500001 := agree_thm 7500001
example : agree 10000000 := agree_thm 10000000
example : agree 10000001 := agree_thm 10000001

end JapanTaxLaw.DisasterIncomeBand75M10MTests
