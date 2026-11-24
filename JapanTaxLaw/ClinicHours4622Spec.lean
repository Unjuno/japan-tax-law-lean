import JapanTaxLaw.ClinicHours4622

/-! Independent spec for ClinicHours4622: strict `¬ x < 4622` form. -/

namespace JapanTaxLaw.ClinicHours4622Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 4622)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ClinicHours4622.hasClinicHours4622 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ClinicHours4622.hasClinicHours4622
  unfold JapanTaxLaw.ClinicHours4622.clinicFloor4622
  simp

end JapanTaxLaw.ClinicHours4622Spec
