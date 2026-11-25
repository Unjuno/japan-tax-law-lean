import JapanTaxLaw.CommonLandAreaTenTimesSpec

/-! Kernel-decided boundary examples: area > 10 × floor area, with threshold 0. -/

namespace JapanTaxLaw.CommonLandAreaTenTimesTests

open JapanTaxLaw.CommonLandAreaTenTimes
open JapanTaxLaw.CommonLandAreaTenTimesSpec

example : triggered 0 = false := by decide
example : triggered 1 = true := by decide
example : triggered 2 = true := by decide
-- boundaries of the statutory multiplier literal 十倍 (= 10)
example : triggered 9 = true := by decide
example : triggered 10 = true := by decide
example : triggered 11 = true := by decide
example : specTriggered 0 = false := by decide
example : specTriggered 1 = true := by decide
example : specTriggered 9 = true := by decide
example : agree 0 := agree_thm 0
example : agree 1 := agree_thm 1
example : agree 10 := agree_thm 10

end JapanTaxLaw.CommonLandAreaTenTimesTests
