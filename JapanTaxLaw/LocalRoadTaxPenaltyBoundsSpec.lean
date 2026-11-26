import JapanTaxLaw.LocalRoadTaxPenaltyBounds

/-!
# LocalRoadTaxPenaltyBounds spec — independent restatement of the art.15 penalty bounds
Sources (pinned): law 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012, art. 15(1).
Normative id: NORM|59252c611830c7174f1e31b83aa97cdd93dbf05739d25bfc56d6cd9d72618588
Independent restatement: the disjunction is expressed with a guarded
fallback on the prison bound; the implementation uses boolean OR. Kernel
agreement is decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.LocalRoadTaxPenaltyBounds

def specWithinPenalty (prisonYears : Nat) (fineYen : Nat) : Bool :=
  if prisonYears <= 10 then true else fineYen <= 1000000

example : specWithinPenalty 11 1000000 = true := by decide
example : specWithinPenalty 11 1000001 = false := by decide

def agreeLocalRoadTaxPenaltyBounds : Bool :=
  [(0,0), (1,0), (9,0), (10,0), (11,999999), (11,1000000),
   (11,1000001), (10,9999999), (12,9999999)].all fun x =>
    withinPenalty x.1 x.2 == specWithinPenalty x.1 x.2

example : agreeLocalRoadTaxPenaltyBounds = true := by decide

end JapanTaxLaw.LocalRoadTaxPenaltyBounds
