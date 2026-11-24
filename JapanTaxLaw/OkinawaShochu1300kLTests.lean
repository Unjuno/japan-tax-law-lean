import JapanTaxLaw.OkinawaShochu1300kLSpec

/-! Kernel-decided boundary examples: 0/1299/1300/1301 kL. -/

namespace JapanTaxLaw.OkinawaShochu1300kLTests

open JapanTaxLaw.OkinawaShochu1300kL
open JapanTaxLaw.OkinawaShochu1300kLSpec

example : exceedsShochu1300 0 = false := by decide
example : exceedsShochu1300 1299 = false := by decide
example : exceedsShochu1300 1300 = false := by decide
example : exceedsShochu1300 1301 = true := by decide
example : specWithin 1299 = false := by decide
example : specWithin 1300 = false := by decide
example : specWithin 1301 = true := by decide
example : agree 0 := agree_thm 0
example : agree 1299 := agree_thm 1299
example : agree 1300 := agree_thm 1300
example : agree 1301 := agree_thm 1301

end JapanTaxLaw.OkinawaShochu1300kLTests
