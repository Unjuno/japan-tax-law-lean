import JapanTaxLaw.ForestArea650HaSpec

/-! Kernel-decided boundary examples: 0/649/650/651 ha. -/

namespace JapanTaxLaw.ForestArea650HaTests

open JapanTaxLaw.ForestArea650Ha
open JapanTaxLaw.ForestArea650HaSpec

example : exceedsForest650 0 = false := by decide
example : exceedsForest650 649 = false := by decide
example : exceedsForest650 650 = false := by decide
example : exceedsForest650 651 = true := by decide
example : specWithin 649 = false := by decide
example : specWithin 650 = false := by decide
example : specWithin 651 = true := by decide
example : agree 0 := agree_thm 0
example : agree 649 := agree_thm 649
example : agree 650 := agree_thm 650
example : agree 651 := agree_thm 651

end JapanTaxLaw.ForestArea650HaTests
