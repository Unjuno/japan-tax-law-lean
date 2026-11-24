import JapanTaxLaw.CorpCapital75_4_100M

/-! Independent spec for CorpCapital75_4_100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.CorpCapital75_4_100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CorpCapital75_4_100M.exceedsCapital75_4 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CorpCapital75_4_100M.exceedsCapital75_4
  unfold JapanTaxLaw.CorpCapital75_4_100M.capitalFloor75_4
  simp

end JapanTaxLaw.CorpCapital75_4_100MSpec
