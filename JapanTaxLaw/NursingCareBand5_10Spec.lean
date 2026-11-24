import JapanTaxLaw.NursingCareBand5_10

/-! Independent spec for NursingCareBand5_10: `¬ x < 5 ∧ ¬ 10 <= x`. -/

namespace JapanTaxLaw.NursingCareBand5_10Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 5 ∧ ¬ 10 <= x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.NursingCareBand5_10.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.NursingCareBand5_10.inBand
  unfold JapanTaxLaw.NursingCareBand5_10.lowerPercent JapanTaxLaw.NursingCareBand5_10.upperPercent
  simp

end JapanTaxLaw.NursingCareBand5_10Spec
