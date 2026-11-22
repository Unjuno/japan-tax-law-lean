import JapanTaxLaw.ExcludedDutyFreeGoods

/-!
# ExcludedDutyFreeGoods spec — 除外物品4種 の独立定式
Sources (pinned): law 363M50000040053, revision 363M50000040053_20261101_507M60000040022.
Independent restatement: 除外 = {金地金(0),白金地金(1),金貨(2),白金貨(3)}、その他(4) は対象外。
-/

namespace JapanTaxLaw.ExcludedDutyFreeGoods

def specExcluded (g : Nat) : Bool := g == 0 || g == 1 || g == 2 || g == 3

example : specExcluded 0 = true := by decide
example : specExcluded 3 = true := by decide
example : specExcluded 4 = false := by decide

def agreeExcludedDutyFreeGoods : Bool :=
  [0, 1, 2, 3, 4, 5].all fun g => isExcludedGood g == specExcluded g

example : agreeExcludedDutyFreeGoods = true := by decide

end JapanTaxLaw.ExcludedDutyFreeGoods
