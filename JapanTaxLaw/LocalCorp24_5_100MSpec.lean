import JapanTaxLaw.LocalCorp24_5_100M

/-! Independent spec for LocalCorp24_5_100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.LocalCorp24_5_100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LocalCorp24_5_100M.exceedsLocalCapital24_5 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LocalCorp24_5_100M.exceedsLocalCapital24_5
  unfold JapanTaxLaw.LocalCorp24_5_100M.localCapitalFloor24_5
  simp

end JapanTaxLaw.LocalCorp24_5_100MSpec
