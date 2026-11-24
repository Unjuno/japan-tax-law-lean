import JapanTaxLaw.LiquorFine100k

/-! Independent spec for LiquorFine100k: strict `¬ 100000 < x` form. -/

namespace JapanTaxLaw.LiquorFine100kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 100000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LiquorFine100k.withinLiquorFine100k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LiquorFine100k.withinLiquorFine100k
  unfold JapanTaxLaw.LiquorFine100k.liquorFineCap100k
  simp

end JapanTaxLaw.LiquorFine100kSpec
