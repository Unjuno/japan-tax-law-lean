import JapanTaxLaw.TaxFinance

/-!
# HalfSenRounding — 五十銭を境とする一円未満の四捨五入

Two pinned provisions state: 五十銭未満の端数は切り捨て、
五十銭以上一円未満の端数は一円とする (round to the nearest yen, half up).
Nat yen cannot represent 五十銭, so the input is expressed in 銭
(一円 = 100 銭). The underlying amount computation is caller-established
and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.HalfSenRounding

def roundSen (sen : Nat) : Nat :=
  if sen % 100 < 50 then sen - sen % 100
  else sen + (100 - sen % 100)

example : roundSen 49 = 0 := by decide
example : roundSen 50 = 100 := by decide
example : roundSen 149 = 100 := by decide
example : roundSen 150 = 200 := by decide

end JapanTaxLaw.HalfSenRounding
