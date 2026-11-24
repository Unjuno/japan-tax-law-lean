import JapanTaxLaw.ShareExchange50UnderSpec

/-! Kernel-decided boundary examples: 0/49/50/51 人. -/

namespace JapanTaxLaw.ShareExchange50UnderTests

open JapanTaxLaw.ShareExchange50Under
open JapanTaxLaw.ShareExchange50UnderSpec

example : under50 0 = true := by decide
example : under50 49 = true := by decide
example : under50 50 = false := by decide
example : under50 51 = false := by decide
example : specWithin 49 = true := by decide
example : specWithin 50 = false := by decide
example : specWithin 51 = false := by decide
example : agree 0 := agree_thm 0
example : agree 49 := agree_thm 49
example : agree 50 := agree_thm 50
example : agree 51 := agree_thm 51

end JapanTaxLaw.ShareExchange50UnderTests
