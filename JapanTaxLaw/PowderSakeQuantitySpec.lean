import JapanTaxLaw.PowderSakeQuantity

/-!
# PowderSakeQuantity spec — 酒税法施行令 art.12の3 の独立整数定式
Sources (pinned): law 337CO0000000097, revision 337CO0000000097_20250401_507CO0000000006.
Independent restatement: 0.73 = 73/100 なので リットル×100 = kg×73。
-/

namespace JapanTaxLaw.PowderSakeQuantity

def specLiters100 (kg : Nat) : Nat := kg * 73

example : specLiters100 1 = 73 := by decide
example : specLiters100 100 = 7300 := by decide

def agreePowderSakeQuantity : Bool :=
  [0, 1, 2, 10, 100, 1000].all fun kg => litersTimes100 kg == specLiters100 kg

example : agreePowderSakeQuantity = true := by decide

end JapanTaxLaw.PowderSakeQuantity
