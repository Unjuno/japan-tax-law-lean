import JapanTaxLaw.CustomsStorageFee

/-!
# CustomsStorageFee spec — 関税法施行令 art.70の3 の独立整数定式
Sources (pinned): law 329CO0000000150, revision 329CO0000000150_20260701_508CO0000000217.
Independent restatement: 保管費 = 日数 × (整数部 + (端数>0 ? 1 : 0)) × 180.
-/

namespace JapanTaxLaw.CustomsStorageFee

def specUnits (whole frac : Nat) : Nat := if frac = 0 then whole else whole + 1
def specFee (days whole frac : Nat) : Nat := days * specUnits whole frac * 180

example : specFee 1 1 1 = 360 := by decide
example : specFee 3 2 0 = 1080 := by decide

def agreeCustomsStorageFee : Bool :=
  [ (0,0), (10,0), (10,1), (1,0), (2,9) ].all fun (w, fr) => chargeableUnits w fr == specUnits w fr
  && [ (1,1,0), (1,1,1), (3,2,0), (0,5,3), (7,10,5) ].all fun (d, w, fr) =>
    storageFee d w fr == specFee d w fr
example : agreeCustomsStorageFee = true := by decide

end JapanTaxLaw.CustomsStorageFee
