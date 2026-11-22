import JapanTaxLaw.ExcludedDutyFreeGoods

/-!
# ExcludedDutyFreeGoods tests — 除外物品 smoke checks
Decidable smoke tests, pinned to law 363M50000040053 / revision 363M50000040053_20261101_507M60000040022.
金地金(0)/白金地金(1)/金貨(2)/白金貨(3)→true、その他(4)→false。
-/

namespace JapanTaxLaw.ExcludedDutyFreeGoods

example : isExcludedGood 0 = true := by decide
example : isExcludedGood 1 = true := by decide
example : isExcludedGood 2 = true := by decide
example : isExcludedGood 3 = true := by decide
example : isExcludedGood 4 = false := by decide
example : isExcludedGood 5 = false := by decide

end JapanTaxLaw.ExcludedDutyFreeGoods
