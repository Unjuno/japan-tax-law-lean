import JapanTaxLaw.CommutingDistance95

/-! Independent spec for CommutingDistance95 (所得税法施行令 art. 20の2): strict `¬ km < 95` form. -/

namespace JapanTaxLaw.CommutingDistance95Spec

def specCommute (km : Nat) : Bool :=
  decide (¬ km < 95)

def agreeCommute (x : Nat) : Prop :=
  specCommute x = JapanTaxLaw.CommutingDistance95.withinCommute x

theorem agree_commute (x : Nat) : agreeCommute x := by
  unfold agreeCommute specCommute JapanTaxLaw.CommutingDistance95.withinCommute
  simp

end JapanTaxLaw.CommutingDistance95Spec
