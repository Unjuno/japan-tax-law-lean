import JapanTaxLaw.CarnetImportGoods

/-!
# CarnetImportGoods spec — 第1号・第4号除外 の独立定式
Sources (pinned): law 348CO0000000317, revision 348CO0000000317_20010106_412CO0000000307.
Independent restatement: 対象 = 各号物品 - {第1号,第4号} = {第2号,第3号}。
-/

namespace JapanTaxLaw.CarnetImportGoods

def specGood (n : Nat) : Bool := n != 1 && n != 4

example : specGood 1 = false := by decide
example : specGood 2 = true := by decide
example : specGood 3 = true := by decide
example : specGood 4 = false := by decide

def agreeCarnetImportGoods : Bool :=
  [1, 2, 3, 4, 5].all fun n => isCarnetGood n == specGood n

example : agreeCarnetImportGoods = true := by decide

end JapanTaxLaw.CarnetImportGoods
