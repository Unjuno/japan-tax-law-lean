import JapanTaxLaw.LocalCorpCapital100M

/-! Independent spec for LocalCorpCapital100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.LocalCorpCapital100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LocalCorpCapital100M.exceedsLocalCapital100M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LocalCorpCapital100M.exceedsLocalCapital100M
  unfold JapanTaxLaw.LocalCorpCapital100M.localCapitalFloor100M
  simp

end JapanTaxLaw.LocalCorpCapital100MSpec
