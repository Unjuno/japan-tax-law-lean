import JapanTaxLaw.Income1320k

/-! Independent spec for Income1320k: strict `¬ 1320000 < x` form. -/

namespace JapanTaxLaw.Income1320kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 1320000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Income1320k.withinIncome1320k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Income1320k.withinIncome1320k
  unfold JapanTaxLaw.Income1320k.incomeCap1320k
  simp

end JapanTaxLaw.Income1320kSpec
