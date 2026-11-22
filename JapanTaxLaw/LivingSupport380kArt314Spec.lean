import JapanTaxLaw.LivingSupport380kArt314

/-! Independent spec for LivingSupport380kArt314: strict `¬ x < 380000` form. -/

namespace JapanTaxLaw.LivingSupport380kArt314Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 380000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LivingSupport380kArt314.hasSupport380k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LivingSupport380kArt314.hasSupport380k
  unfold JapanTaxLaw.LivingSupport380kArt314.supportFloorArt314
  simp

end JapanTaxLaw.LivingSupport380kArt314Spec
