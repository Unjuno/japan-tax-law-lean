import JapanTaxLaw.WirePitch165nm

/-! Independent spec for WirePitch165nm: strict `¬ 165 < x` form. -/

namespace JapanTaxLaw.WirePitch165nmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 165 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.WirePitch165nm.withinPitch165 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.WirePitch165nm.withinPitch165
  unfold JapanTaxLaw.WirePitch165nm.pitchCap165nm
  simp

end JapanTaxLaw.WirePitch165nmSpec
