import JapanTaxLaw.TransferPriceAtMost120

/-! # TransferPriceAtMost120 spec — 120%以下の独立定式 (law 332CO0000000043 / art.25の18の3)
交差乗算 `100*price <= 120*base` で判定する（境界値 120% を含む）。 -/

namespace JapanTaxLaw.TransferPriceAtMost120

def specPercentNum : Nat := 120
def specRateDen : Nat := 100

def specWithin (price base : Nat) : Bool :=
  specRateDen * price <= specPercentNum * base

example : specWithin 120 100 = true := by decide
example : specWithin 121 100 = false := by decide

def agreeTransferPriceAtMost120 : Bool :=
  [(0,0),(119,100),(120,100),(121,100),(100,101),(1200,1000),(1201,1000)].all fun pb =>
    within pb.1 pb.2 == specWithin pb.1 pb.2

example : agreeTransferPriceAtMost120 = true := by decide

end JapanTaxLaw.TransferPriceAtMost120
