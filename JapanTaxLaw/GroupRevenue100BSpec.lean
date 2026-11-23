import JapanTaxLaw.GroupRevenue100B

/-! Independent spec for GroupRevenue100B: strict `¬ x < 100000000000` form. -/

namespace JapanTaxLaw.GroupRevenue100BSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 100000000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.GroupRevenue100B.hasRevenue100B x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.GroupRevenue100B.hasRevenue100B
  unfold JapanTaxLaw.GroupRevenue100B.revenueFloor100B
  simp

end JapanTaxLaw.GroupRevenue100BSpec
