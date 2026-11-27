import JapanTaxLaw.TransferPriceAtLeast80

/-! # TransferPriceAtLeast80 spec — 80%以上の独立定式 (law 332CO0000000043 / art.25の18の3)
交差乗算 `100*price >= 80*base` で判定する（境界値 80% を含む）。 -/

namespace JapanTaxLaw.TransferPriceAtLeast80

def specPercentNum : Nat := 80
def specRateDen : Nat := 100

def specAtLeast (price base : Nat) : Bool :=
  specRateDen * price >= specPercentNum * base

example : specAtLeast 80 100 = true := by decide
example : specAtLeast 79 100 = false := by decide

def agreeTransferPriceAtLeast80 : Bool :=
  [(0,0),(79,100),(80,100),(81,100),(100,101),(800,1000),(799,1000)].all fun pb =>
    atLeast pb.1 pb.2 == specAtLeast pb.1 pb.2

example : agreeTransferPriceAtLeast80 = true := by decide

end JapanTaxLaw.TransferPriceAtLeast80
