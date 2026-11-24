import JapanTaxLaw.UrbanDev2000sqmSpec

/-! Kernel-decided boundary examples: 0/1999/2000/2001 ㎡. -/

namespace JapanTaxLaw.UrbanDev2000sqmTests

open JapanTaxLaw.UrbanDev2000sqm
open JapanTaxLaw.UrbanDev2000sqmSpec

example : hasUrbanDev2000 0 = false := by decide
example : hasUrbanDev2000 1999 = false := by decide
example : hasUrbanDev2000 2000 = true := by decide
example : hasUrbanDev2000 2001 = true := by decide
example : specWithin 1999 = false := by decide
example : specWithin 2000 = true := by decide
example : specWithin 2001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 1999 := agree_thm 1999
example : agree 2000 := agree_thm 2000
example : agree 2001 := agree_thm 2001

end JapanTaxLaw.UrbanDev2000sqmTests
