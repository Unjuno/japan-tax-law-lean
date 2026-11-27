import JapanTaxLaw.TouristTaxPenaltyBounds

/-!
# TouristTaxPenaltyBounds spec — independent restatement of the art.25 penalty bounds
Sources (pinned): law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 25(1).
Normative id: NORM|2d2913868325c56a8cefe1373ea380c83f23b4e4ae0b951415c0facb5b02c43e
Independent restatement: the disjunction is expressed with a guarded
fallback; the implementation uses boolean OR. Kernel agreement is decided
on the listed grid, never assumed.
-/

namespace JapanTaxLaw.TouristTaxPenaltyBounds

def specWithinPenalty (prisonYears : Nat) (fineYen : Nat) : Bool :=
  if prisonYears <= 1 then true else fineYen <= 500000

example : specWithinPenalty 2 500000 = true := by decide
example : specWithinPenalty 2 500001 = false := by decide

def agreeTouristTaxPenaltyBounds : Bool :=
  [(0,0), (1,0), (2,499999), (2,500000), (2,500001),
   (1,999999), (0,999999), (3,999999)].all fun x =>
    withinPenalty x.1 x.2 == specWithinPenalty x.1 x.2

example : agreeTouristTaxPenaltyBounds = true := by decide

end JapanTaxLaw.TouristTaxPenaltyBounds
