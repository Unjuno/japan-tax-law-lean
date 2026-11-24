import JapanTaxLaw.FreeCarePatientBand5_10

/-! Independent spec for FreeCarePatientBand5_10: `¬ x < 5 ∧ ¬ 10 <= x`. -/

namespace JapanTaxLaw.FreeCarePatientBand5_10Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 5 ∧ ¬ 10 <= x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.FreeCarePatientBand5_10.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.FreeCarePatientBand5_10.inBand
  unfold JapanTaxLaw.FreeCarePatientBand5_10.lowerPercent JapanTaxLaw.FreeCarePatientBand5_10.upperPercent
  simp

end JapanTaxLaw.FreeCarePatientBand5_10Spec
