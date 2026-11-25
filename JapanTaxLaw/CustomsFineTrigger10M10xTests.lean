import JapanTaxLaw.CustomsFineTrigger10M10xSpec

/-! Kernel-decided boundary examples: 10 × duty amount > 10,000,000 yen. -/

namespace JapanTaxLaw.CustomsFineTrigger10M10xTests

open JapanTaxLaw.CustomsFineTrigger10M10x
open JapanTaxLaw.CustomsFineTrigger10M10xSpec

example : triggered 999999 = false := by decide
example : triggered 1000000 = false := by decide
example : triggered 1000001 = true := by decide
-- boundaries of the statutory multiplier literal 十倍 (= 10)
example : triggered 9 = false := by decide
example : triggered 10 = false := by decide
example : triggered 11 = false := by decide
-- boundaries of the statutory amount literal 千万円 (= 10,000,000)
example : triggered 9999999 = true := by decide
example : triggered 10000000 = true := by decide
example : triggered 10000001 = true := by decide
example : agree 999999 := agree_thm 999999
example : agree 1000001 := agree_thm 1000001
example : agree 10 := agree_thm 10

end JapanTaxLaw.CustomsFineTrigger10M10xTests
