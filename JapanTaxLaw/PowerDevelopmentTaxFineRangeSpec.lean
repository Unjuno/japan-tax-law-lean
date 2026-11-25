import JapanTaxLaw.PowerDevelopmentTaxFineRange

/-!
# PowerDevelopmentTaxFineRange spec — independent restatement of the art. 12 fine interval
Sources (pinned): law 349AC0000000079, revision 349AC0000000079_20250601_504AC0000000068, art. 12(4).
Normative id: NORM|34a573f53421262fb9326c5c32576f2fca6484ced306c8bed76190fd5c4f2cc5
Independent restatement: the interval is expressed with reversed non-strict
guards; the implementation uses strict comparisons and conjunction. Agreement
is kernel-decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.PowerDevelopmentTaxFineRange

def specFineRange (taxAmount : Nat) (fine : Nat) : Bool :=
  if taxAmount <= 500000 then false
  else if fine <= 500000 then false
  else fine <= taxAmount

example : specFineRange 500001 500001 = true := by decide
example : specFineRange 500001 500000 = false := by decide

def agreePowerDevelopmentTaxFineRange : Bool :=
  [(0,0), (1,0), (499999,499999), (500000,500001),
   (500001,500000), (500001,500001), (700000,600000),
   (700000,700001)].all fun x =>
    withinFineRange x.1 x.2 == specFineRange x.1 x.2

example : agreePowerDevelopmentTaxFineRange = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxFineRange
