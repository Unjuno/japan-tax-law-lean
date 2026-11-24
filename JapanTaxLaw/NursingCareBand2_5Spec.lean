import JapanTaxLaw.NursingCareBand2_5

/-! Independent spec for NursingCareBand2_5: `¬ x < 2 ∧ ¬ 5 <= x`. -/

namespace JapanTaxLaw.NursingCareBand2_5Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 2 ∧ ¬ 5 <= x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.NursingCareBand2_5.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.NursingCareBand2_5.inBand
  unfold JapanTaxLaw.NursingCareBand2_5.lowerPercent JapanTaxLaw.NursingCareBand2_5.upperPercent
  simp

end JapanTaxLaw.NursingCareBand2_5Spec
