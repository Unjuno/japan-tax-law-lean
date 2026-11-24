import JapanTaxLaw.LiquorFine500k

/-! Independent spec for LiquorFine500k: strict `¬ 500000 < x` form. -/

namespace JapanTaxLaw.LiquorFine500kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 500000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LiquorFine500k.withinLiquorFine x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LiquorFine500k.withinLiquorFine
  unfold JapanTaxLaw.LiquorFine500k.liquorFineCap500k
  simp

end JapanTaxLaw.LiquorFine500kSpec
