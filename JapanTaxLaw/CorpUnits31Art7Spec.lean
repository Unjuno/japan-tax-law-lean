import JapanTaxLaw.CorpUnits31Art7

/-! Independent spec for CorpUnits31Art7: strict `¬ x < 31` form. -/

namespace JapanTaxLaw.CorpUnits31Art7Spec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 31)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CorpUnits31Art7.hasCorpUnits31 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CorpUnits31Art7.hasCorpUnits31
  unfold JapanTaxLaw.CorpUnits31Art7.corpUnitsFloor31
  simp

end JapanTaxLaw.CorpUnits31Art7Spec
