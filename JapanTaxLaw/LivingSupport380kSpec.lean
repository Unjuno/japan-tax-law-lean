import JapanTaxLaw.LivingSupport380k

/-! Independent spec for LivingSupport380k: strict `¬ x < 380000` form. -/

namespace JapanTaxLaw.LivingSupport380kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 380000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LivingSupport380k.isSupported x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LivingSupport380k.isSupported
  unfold JapanTaxLaw.LivingSupport380k.supportFloorYen
  simp

end JapanTaxLaw.LivingSupport380kSpec
