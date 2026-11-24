import JapanTaxLaw.LiquorOrderFine500k

/-! Independent spec for LiquorOrderFine500k: strict `¬ 500000 < x` form. -/

namespace JapanTaxLaw.LiquorOrderFine500kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 500000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LiquorOrderFine500k.withinLiquorOrderFine x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LiquorOrderFine500k.withinLiquorOrderFine
  unfold JapanTaxLaw.LiquorOrderFine500k.liquorOrderCap500k
  simp

end JapanTaxLaw.LiquorOrderFine500kSpec
