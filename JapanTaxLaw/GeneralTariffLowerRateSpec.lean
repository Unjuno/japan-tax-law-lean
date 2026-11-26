import JapanTaxLaw.GeneralTariffLowerRate

/-!
# GeneralTariffLowerRate spec — independent restatement of the lower-rate selection
Sources (pinned): law 414CO0000000262, revision 414CO0000000262_20110401_423CO0000000088, art. 4(1).
Normative id: NORM|2716d0b794ffcbd5453a423cf8d85e04c8e471b2fa1ace304f72d74b1490004d
Independent restatement: the lower rate is expressed with a non-strict guard
on the statutory rate; the implementation uses a strict comparison on the
treaty rate. Kernel-decided agreement is checked, never assumed.
-/

namespace JapanTaxLaw.GeneralTariffLowerRate

def specLowerRate (statutoryRate : Nat) (treatyRate : Nat) : Nat :=
  if statutoryRate <= treatyRate then statutoryRate else treatyRate

example : specLowerRate 100 50 = 50 := by decide
example : specLowerRate 50 100 = 50 := by decide

def agreeGeneralTariffLowerRate : Bool :=
  [(0,0), (1,2), (2,1), (100,50), (50,100), (100,100), (0,10), (10,0)].all fun x =>
    generalRate x.1 x.2 == specLowerRate x.1 x.2

example : agreeGeneralTariffLowerRate = true := by decide

end JapanTaxLaw.GeneralTariffLowerRate
