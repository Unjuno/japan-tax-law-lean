import JapanTaxLaw.OldLifePremium9k

/-! Independent spec for OldLifePremium9k: strict `¬ x <= 9000` form. -/

namespace JapanTaxLaw.OldLifePremium9kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 9000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OldLifePremium9k.exceedsOldLife9k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OldLifePremium9k.exceedsOldLife9k
  unfold JapanTaxLaw.OldLifePremium9k.oldLifeFloor9k
  simp

end JapanTaxLaw.OldLifePremium9kSpec
