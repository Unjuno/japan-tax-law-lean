import JapanTaxLaw.CarnetImportGoods

/-!
# CarnetImportGoods tests — 通関手帳輸入物品 smoke checks
Decidable smoke tests, pinned to law 348CO0000000317 / revision 348CO0000000317_20010106_412CO0000000307.
第1号/第4号→false、第2号/第3号→true。
-/

namespace JapanTaxLaw.CarnetImportGoods

example : isCarnetGood 1 = false := by decide
example : isCarnetGood 2 = true := by decide
example : isCarnetGood 3 = true := by decide
example : isCarnetGood 4 = false := by decide
example : isCarnetGood 5 = true := by decide

end JapanTaxLaw.CarnetImportGoods
