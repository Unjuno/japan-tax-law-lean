import JapanTaxLaw.DisasterIncomeBand6M75MSpec

/-! Kernel-decided boundary examples: 0/6000000/6000001/7500000/7500001. -/

namespace JapanTaxLaw.DisasterIncomeBand6M75MTests

open JapanTaxLaw.DisasterIncomeBand6M75M
open JapanTaxLaw.DisasterIncomeBand6M75MSpec

example : inBand 0 = false := by decide
example : inBand 6000000 = false := by decide
example : inBand 6000001 = true := by decide
example : inBand 7500000 = true := by decide
example : inBand 7500001 = false := by decide
example : specInBand 6000000 = false := by decide
example : specInBand 6000001 = true := by decide
example : specInBand 7500000 = true := by decide
example : specInBand 7500001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 6000000 := agree_thm 6000000
example : agree 6000001 := agree_thm 6000001
example : agree 7500000 := agree_thm 7500000
example : agree 7500001 := agree_thm 7500001

end JapanTaxLaw.DisasterIncomeBand6M75MTests
