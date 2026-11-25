import JapanTaxLaw.TouristTaxFineRange

/-!
# TouristTaxFineRange spec — independent restatement of the art. 24 fine interval
Sources (pinned): law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 24(2).
Normative id: NORM|aab84fc32ce58c8a9c2f3b4ea9e1cb70a7ea86a00cefd2b0b7a1f8e1fcbcfae2
Independent restatement: the interval is expressed with non-strict guards
in the opposite direction; the implementation uses strict comparisons and
conjunction. Kernel-decided agreement is checked, not assumed.
-/

namespace JapanTaxLaw.TouristTaxFineRange

def specFineRange (unpaid : Nat) (fine : Nat) : Bool :=
  if unpaid <= 2000000 then false
  else if fine <= 2000000 then false
  else fine <= unpaid

example : specFineRange 2000001 2000001 = true := by decide
example : specFineRange 2000001 2000000 = false := by decide

def agreeTouristTaxFineRange : Bool :=
  [(0,0), (1,0), (1999999,1999999), (2000000,2000001),
   (2000001,2000000), (2000001,2000001), (3000000,2500000),
   (3000000,3000001)].all fun x =>
    withinFineRange x.1 x.2 == specFineRange x.1 x.2

example : agreeTouristTaxFineRange = true := by decide

end JapanTaxLaw.TouristTaxFineRange
