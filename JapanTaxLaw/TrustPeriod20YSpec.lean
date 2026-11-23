import JapanTaxLaw.TrustPeriod20Y

/-! Independent spec for TrustPeriod20Y: strict `¬ x < 20` form. -/

namespace JapanTaxLaw.TrustPeriod20YSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 20)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.TrustPeriod20Y.hasTrust20Y x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.TrustPeriod20Y.hasTrust20Y
  unfold JapanTaxLaw.TrustPeriod20Y.trustFloor20Y
  simp

end JapanTaxLaw.TrustPeriod20YSpec
