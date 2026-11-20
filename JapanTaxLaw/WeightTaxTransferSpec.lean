import JapanTaxLaw.WeightTaxTransfer

/-!
# WeightTaxTransfer spec — 自動車重量譲与税法 art.2 の独立整数定式
Sources (pinned): law 346AC0000000090, revision 346AC0000000090_20260401_508AC0000000002.
Independent restatement: 対象額 = 税額×333/357、按分 = (対象額/2)×延長按分 + (対象額/2)×面積按分。
-/

namespace JapanTaxLaw.WeightTaxTransfer

def specBase (totalTax : Nat) : Nat := totalTax * 333 / 357
def specAlloc (totalTax el tl ea ta : Nat) : Nat :=
  let half := specBase totalTax / 2
  (if tl = 0 then 0 else half * el / tl) + (if ta = 0 then 0 else half * ea / ta)

example : specBase 357 = 333 := by decide
example : specAlloc 357 1 2 1 2 = 166 := by decide

def agreeWeightTaxTransfer : Bool :=
  [ (357,1,2,1,2), (357,0,0,1,1), (357,1,1,0,0), (357,0,0,0,0),
    (714,1,3,2,3), (1000,5,7,4,9) ].all fun (t, el, tl, ea, ta) =>
    allocation t el tl ea ta == specAlloc t el tl ea ta
example : agreeWeightTaxTransfer = true := by decide

end JapanTaxLaw.WeightTaxTransfer
