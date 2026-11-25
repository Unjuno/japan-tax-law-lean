import JapanTaxLaw.AviationFuelTaxFineRange

/-!
# AviationFuelTaxFineRange spec — independent restatement of the art. 23 fine interval
Sources (pinned): law 431AC0000000003, revision 431AC0000000003_20260401_508AC0000000002, art. 23(3).
Normative id: NORM|791b0b89be1a66fddc2c631133e65ebd1ac1c49cc8e10a8ddf6dc62da698ca33
Independent restatement: reversed non-strict guards express the same interval;
implementation uses strict comparisons and conjunction. Agreement is
kernel-decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.AviationFuelTaxFineRange

def specFineRange (unpaid : Nat) (fine : Nat) : Bool :=
  if unpaid <= 2000000 then false
  else if fine <= 2000000 then false
  else fine <= unpaid

example : specFineRange 2000001 2000001 = true := by decide
example : specFineRange 2000001 2000000 = false := by decide

def agreeAviationFuelTaxFineRange : Bool :=
  [(0,0), (1,0), (1999999,1999999), (2000000,2000001),
   (2000001,2000000), (2000001,2000001), (3000000,2500000),
   (3000000,3000001)].all fun x =>
    withinFineRange x.1 x.2 == specFineRange x.1 x.2

example : agreeAviationFuelTaxFineRange = true := by decide

end JapanTaxLaw.AviationFuelTaxFineRange
