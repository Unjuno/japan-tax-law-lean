import JapanTaxLaw.ShipProvisionalRateReduction

/-! Independent spec: `base - min base 4` instead of direct saturating subtraction.
The universal omega bridge proves equality for every Nat base; no conditional,
so no Classical.choice is introduced. -/
namespace JapanTaxLaw.ShipProvisionalRateReduction

def specReducedRate (basePerMille : Nat) : Nat :=
  basePerMille - min basePerMille 4

theorem agreeReducedRate (basePerMille : Nat) :
    specReducedRate basePerMille = reducedRate basePerMille := by
  unfold specReducedRate reducedRate reductionPerMille
  omega

end JapanTaxLaw.ShipProvisionalRateReduction
