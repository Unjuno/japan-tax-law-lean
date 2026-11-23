import JapanTaxLaw.CareMedicalPremium80kSpec

/-! Kernel-decided boundary examples: 0/79999/80000/80001 円. -/

namespace JapanTaxLaw.CareMedicalPremium80kTests

open JapanTaxLaw.CareMedicalPremium80k
open JapanTaxLaw.CareMedicalPremium80kSpec

example : exceedsCareMedical80k 0 = false := by decide
example : exceedsCareMedical80k 79999 = false := by decide
example : exceedsCareMedical80k 80000 = false := by decide
example : exceedsCareMedical80k 80001 = true := by decide
example : specWithin 79999 = false := by decide
example : specWithin 80000 = false := by decide
example : specWithin 80001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 79999 := agree_thm 79999
example : agree 80000 := agree_thm 80000
example : agree 80001 := agree_thm 80001

end JapanTaxLaw.CareMedicalPremium80kTests
