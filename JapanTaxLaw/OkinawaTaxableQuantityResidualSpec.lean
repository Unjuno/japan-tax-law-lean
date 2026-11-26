import JapanTaxLaw.OkinawaTaxableQuantityResidual

/-!
# OkinawaTaxableQuantityResidual spec — independent restatement of the art.20 quantity residual
Sources (pinned): law 347M50000040042, revision 347M50000040042_20251231_507M60000040072, art. 20(1)(1の3).
Normative id: NORM|2e5447d9cb81e83c203d8a3262428398e6f52bc95dbdb36b5a8c291862ebef16
Independent restatement: residual with explicit non-positive guard; the
implementation uses a conditional comparison. Kernel agreement is decided.
-/

namespace JapanTaxLaw.OkinawaTaxableQuantityResidual

def specResidual (firstQty : Nat) (previousQty : Nat) : Nat :=
  if firstQty <= previousQty then 0 else firstQty - previousQty

example : specResidual 100 40 = 60 := by decide
example : specResidual 100 140 = 0 := by decide

def agreeOkinawaTaxableQuantityResidual : Bool :=
  [(0,0), (1,0), (100,0), (100,40), (100,100), (100,140)].all fun x =>
    taxableQuantity x.1 x.2 == specResidual x.1 x.2

example : agreeOkinawaTaxableQuantityResidual = true := by decide

end JapanTaxLaw.OkinawaTaxableQuantityResidual
