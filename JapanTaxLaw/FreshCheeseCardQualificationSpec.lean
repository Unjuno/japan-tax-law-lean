import JapanTaxLaw.FreshCheeseCardQualification

/-!
# FreshCheeseCardQualification spec — independent restatement of the art.32 cheese conditions
Sources (pinned): law 335CO0000000069, revision 335CO0000000069_20260401_508CO0000000085, art. 32(2)(5).
Normative id: NORM|06ecf4e83a75240fefb191c05f7df0f5ead383672e0052e4472472d1cde8dd3f
Independent restatement: reversed strict/non-strict guards reject a value
outside each statutory bound; the implementation uses a conjunction of
forward comparisons. Kernel agreement is decided on the listed grid.
-/

namespace JapanTaxLaw.FreshCheeseCardQualification

def specQualified (drySolidPct : Nat) (pieceGrams : Nat) (netWeightKg : Nat) : Bool :=
  if 48 < drySolidPct then false
  else if 4 < pieceGrams then false
  else if netWeightKg <= 5 then false else true

example : specQualified 48 4 6 = true := by decide
example : specQualified 48 4 5 = false := by decide

def agreeFreshCheeseCardQualification : Bool :=
  [(0,0,0), (47,3,5), (48,4,6), (49,4,6), (48,5,6),
   (48,4,5), (48,4,7), (0,0,6)].all fun x =>
    qualified x.1 x.2.1 x.2.2 == specQualified x.1 x.2.1 x.2.2

example : agreeFreshCheeseCardQualification = true := by decide

end JapanTaxLaw.FreshCheeseCardQualification
