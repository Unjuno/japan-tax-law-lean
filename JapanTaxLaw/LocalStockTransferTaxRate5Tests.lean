import JapanTaxLaw.LocalStockTransferTaxRate5

/-!
# LocalStockTransferTaxRate5 tests — 5% の境界検査

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
zero / small input / just-below / at / just-above the statutory numerator.
-/

namespace JapanTaxLaw.LocalStockTransferTaxRate5

example : stockTransferShareTax 0 = 0 := by decide
example : stockTransferShareTax 1 = 0 := by decide
example : stockTransferShareTax 4 = 0 := by decide
example : stockTransferShareTax 5 = 0 := by decide
example : stockTransferShareTax 6 = 0 := by decide
example : stockTransferShareTax 99 = 4 := by decide
example : stockTransferShareTax 100 = 5 := by decide
example : stockTransferShareTax 101 = 5 := by decide

end JapanTaxLaw.LocalStockTransferTaxRate5
