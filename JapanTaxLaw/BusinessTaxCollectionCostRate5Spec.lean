import JapanTaxLaw.BusinessTaxCollectionCostRate5

/-!
# BusinessTaxCollectionCostRate5 spec — 5/100 の独立定式
Sources (pinned): law 329M50000002023, revision 329M50000002023_20261101_508M60000008045,
art. 24の28 (第二十四条の二十八). Independent restatement: taxAmount×5/100。
-/

namespace JapanTaxLaw.BusinessTaxCollectionCostRate5

def specCollectionCost (taxAmount : Nat) : Nat :=
  taxAmount * 5 / 100

example : specCollectionCost 100 = 5 := by decide

def agreeBusinessTaxCollectionCostRate5 : Bool :=
  [0, 1, 4, 5, 6, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    collectionCost b == specCollectionCost b

example : agreeBusinessTaxCollectionCostRate5 = true := by decide

end JapanTaxLaw.BusinessTaxCollectionCostRate5
