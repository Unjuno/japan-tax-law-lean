import JapanTaxLaw.TreatyAsset100MSpec

/-! Kernel-decided boundary examples: 0/99999999/100000000/100000001 円. -/

namespace JapanTaxLaw.TreatyAsset100MTests

open JapanTaxLaw.TreatyAsset100M
open JapanTaxLaw.TreatyAsset100MSpec

example : exceedsTreatyAsset100M 0 = false := by decide
example : exceedsTreatyAsset100M 99999999 = false := by decide
example : exceedsTreatyAsset100M 100000000 = false := by decide
example : exceedsTreatyAsset100M 100000001 = true := by decide
example : specWithin 99999999 = false := by decide
example : specWithin 100000000 = false := by decide
example : specWithin 100000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 99999999 := agree_thm 99999999
example : agree 100000000 := agree_thm 100000000
example : agree 100000001 := agree_thm 100000001

end JapanTaxLaw.TreatyAsset100MTests
