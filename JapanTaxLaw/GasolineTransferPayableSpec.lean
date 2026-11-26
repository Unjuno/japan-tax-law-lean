import JapanTaxLaw.GasolineTransferPayable

/-!
# GasolineTransferPayable spec — independent restatement of the art.10 transfer difference
Sources (pinned): law 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052, art. 10.
Normative id: NORM|18ee592ed4fc85004c77200445b576ef0168e9660f0b08e6a4fad65396653d56
Independent restatement: the residual is expressed with an explicit
non-positive guard and subtraction; the implementation uses a conditional
comparison. Kernel-decided agreement is checked, never assumed.
-/

namespace JapanTaxLaw.GasolineTransferPayable

def specTransferPayable (sixthItemTax : Nat) (previousItemTax : Nat) : Nat :=
  if sixthItemTax <= previousItemTax then 0 else sixthItemTax - previousItemTax

example : specTransferPayable 100 40 = 60 := by decide
example : specTransferPayable 100 140 = 0 := by decide

def agreeGasolineTransferPayable : Bool :=
  [(0,0), (1,0), (100,0), (100,40), (100,100), (100,140)].all fun x =>
    transferPayable x.1 x.2 == specTransferPayable x.1 x.2

example : agreeGasolineTransferPayable = true := by decide

end JapanTaxLaw.GasolineTransferPayable
