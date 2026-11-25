import JapanTaxLaw.TaxableQuantityResidual

/-!
# TaxableQuantityResidual spec — independent restatement of the art. 30_2 residual quantity
Sources (pinned): law 328AC0000000006, revision 328AC0000000006_20260525_506AC0000000052, art. 30_2(1)(3).
Normative id: NORM|3f049c7ac5a29e667cddf5a3310f6887f45eeae97b97e43ecf1ab0b0517c5adb
Independent restatement: the residual is expressed with an explicit
non-positive guard; the implementation uses min and conditional subtraction.
Agreement is kernel-decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.TaxableQuantityResidual

def specResidualQuantity (base : Nat) (deducted : Nat) : Nat :=
  if base <= deducted then 0 else base - deducted

example : specResidualQuantity 100 40 = 60 := by decide
example : specResidualQuantity 100 150 = 0 := by decide

def agreeTaxableQuantityResidual : Bool :=
  [(0,0), (1,0), (100,0), (100,40), (100,100), (100,150)].all fun x =>
    taxableQuantity x.1 x.2 == specResidualQuantity x.1 x.2

example : agreeTaxableQuantityResidual = true := by decide

end JapanTaxLaw.TaxableQuantityResidual
