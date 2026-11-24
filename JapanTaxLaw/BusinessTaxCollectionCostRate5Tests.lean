import JapanTaxLaw.BusinessTaxCollectionCostRate5

/-!
# BusinessTaxCollectionCostRate5 tests — 5% の境界検査
Pinned to law 329M50000002023 / art. 24の28. zero / small / below / at / above 五.
-/

namespace JapanTaxLaw.BusinessTaxCollectionCostRate5

example : collectionCost 0 = 0 := by decide
example : collectionCost 1 = 0 := by decide
example : collectionCost 4 = 0 := by decide
example : collectionCost 5 = 0 := by decide
example : collectionCost 6 = 0 := by decide
example : collectionCost 99 = 4 := by decide
example : collectionCost 100 = 5 := by decide
example : collectionCost 101 = 5 := by decide

end JapanTaxLaw.BusinessTaxCollectionCostRate5
