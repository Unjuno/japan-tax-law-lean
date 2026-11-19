import JapanTaxLaw.TonnageTax

/-!
# TonnageTax spec — とん税法 art.3 の独立整数定式

Sources (pinned): law 332AC0000000037, revision 332AC0000000037_20250601_504AC0000000068.
Article Num 3.
Independent restatement: 「一トンまでごとに十六円」/「四十八円」= ceil(netTons) × rate.
-/

namespace JapanTaxLaw.TonnageTax

def specCeil (whole fraction : Nat) : Nat := if fraction = 0 then whole else whole + 1
def specEntry (whole fraction : Nat) : Nat := specCeil whole fraction * 16
def specAnnual (whole fraction : Nat) : Nat := specCeil whole fraction * 48

example : specEntry 10 0 = 160 := by decide
example : specEntry 10 1 = 176 := by decide
example : specAnnual 10 1 = 528 := by decide

def agreeTonnageTax : Bool :=
  [ (0,0), (1,0), (10,0), (10,1), (99,50), (1000,1) ].all fun (w, fr) =>
    entryTax w fr == specEntry w fr && annualTax w fr == specAnnual w fr

example : agreeTonnageTax = true := by decide

end JapanTaxLaw.TonnageTax
