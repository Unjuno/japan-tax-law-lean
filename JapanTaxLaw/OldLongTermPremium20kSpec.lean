import JapanTaxLaw.OldLongTermPremium20k

/-! Independent spec for OldLongTermPremium20k: strict `¬ x <= 20000` form. -/

namespace JapanTaxLaw.OldLongTermPremium20kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 20000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OldLongTermPremium20k.exceedsPremium20k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OldLongTermPremium20k.exceedsPremium20k
  unfold JapanTaxLaw.OldLongTermPremium20k.premiumFloor20k
  simp

end JapanTaxLaw.OldLongTermPremium20kSpec
