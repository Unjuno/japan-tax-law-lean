import JapanTaxLaw.UsForcesDutyFreePenaltySpec

/-!
# UsForcesDutyFreePenaltyTests — boundary coverage (art.11(3))

All examples are decided by the Lean kernel (`by decide`).  No finite-domain
check is presented as a universal proof; the universal correspondence theorem
lives in the Spec module.
-/

namespace JapanTaxLaw.UsForcesDutyFreePenalty

-- imprisonment lower / boundary / just-over
example : withinLimits (Penalty.imprisonment 0) = true := by decide
example : withinLimits (Penalty.imprisonment 11) = true := by decide
example : withinLimits (Penalty.imprisonment 12) = true := by decide
example : withinLimits (Penalty.imprisonment 13) = false := by decide

-- fine lower / boundary / just-over
example : withinLimits (Penalty.fine 0) = true := by decide
example : withinLimits (Penalty.fine 499_999) = true := by decide
example : withinLimits (Penalty.fine 500_000) = true := by decide
example : withinLimits (Penalty.fine 500_001) = false := by decide

-- independent spec agrees at every boundary
example : specWithin (Penalty.imprisonment 12) = withinLimits (Penalty.imprisonment 12) := by decide
example : specWithin (Penalty.fine 500_000) = withinLimits (Penalty.fine 500_000) := by decide
example : specWithin (Penalty.fine 500_001) = withinLimits (Penalty.fine 500_001) := by decide

end JapanTaxLaw.UsForcesDutyFreePenalty
