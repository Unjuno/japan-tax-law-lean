import JapanTaxLaw.Semiconductor210nm

/-! Independent spec for Semiconductor210nm: strict `¬ x <= 210` form. -/

namespace JapanTaxLaw.Semiconductor210nmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 210)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Semiconductor210nm.exceedsPitch210 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Semiconductor210nm.exceedsPitch210
  unfold JapanTaxLaw.Semiconductor210nm.pitchFloor210
  simp

end JapanTaxLaw.Semiconductor210nmSpec
