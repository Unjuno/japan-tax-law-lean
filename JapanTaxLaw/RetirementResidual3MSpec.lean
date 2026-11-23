import JapanTaxLaw.RetirementResidual3M

/-! Independent spec for RetirementResidual3M: strict `¬ 3000000 < x` form. -/

namespace JapanTaxLaw.RetirementResidual3MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 3000000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.RetirementResidual3M.withinResidual3M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.RetirementResidual3M.withinResidual3M
  unfold JapanTaxLaw.RetirementResidual3M.residualCap3M
  simp

end JapanTaxLaw.RetirementResidual3MSpec
