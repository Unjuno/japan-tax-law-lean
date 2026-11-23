import JapanTaxLaw.OldLifePremium100k

/-! Independent spec for OldLifePremium100k: strict `¬ x <= 100000` form. -/

namespace JapanTaxLaw.OldLifePremium100kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.OldLifePremium100k.exceedsOldLife100k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.OldLifePremium100k.exceedsOldLife100k
  unfold JapanTaxLaw.OldLifePremium100k.oldLifeFloor100k
  simp

end JapanTaxLaw.OldLifePremium100kSpec
