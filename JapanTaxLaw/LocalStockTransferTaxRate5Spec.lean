import JapanTaxLaw.LocalStockTransferTaxRate5

/-!
# LocalStockTransferTaxRate5 spec — 5/100 の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 71の49 (第七十一条の四十九). Independent restatement: base×5/100。
-/

namespace JapanTaxLaw.LocalStockTransferTaxRate5

def specStockTransferTax (base : Nat) : Nat :=
  base * 5 / 100

example : specStockTransferTax 100 = 5 := by decide

def agreeLocalStockTransferTaxRate5 : Bool :=
  [0, 1, 4, 5, 6, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    stockTransferShareTax b == specStockTransferTax b

example : agreeLocalStockTransferTaxRate5 = true := by decide

end JapanTaxLaw.LocalStockTransferTaxRate5
