import JapanTaxLaw.GiftLand3000sqmSpec

/-! Kernel-decided boundary examples: 0/2999/3000/3001 ㎡. -/

namespace JapanTaxLaw.GiftLand3000sqmTests

open JapanTaxLaw.GiftLand3000sqm
open JapanTaxLaw.GiftLand3000sqmSpec

example : hasGiftLand3000 0 = false := by decide
example : hasGiftLand3000 2999999 = false := by decide
example : hasGiftLand3000 3000000 = true := by decide
example : hasGiftLand3000 3000001 = true := by decide
example : specWithin 2999999 = false := by decide
example : specWithin 3000000 = true := by decide
example : specWithin 3000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 2999999 := agree_thm 2999999
example : agree 3000000 := agree_thm 3000000
example : agree 3000001 := agree_thm 3000001

end JapanTaxLaw.GiftLand3000sqmTests
