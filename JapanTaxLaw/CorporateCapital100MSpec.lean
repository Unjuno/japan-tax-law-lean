import JapanTaxLaw.CorporateCapital100M

/-! Independent spec for CorporateCapital100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.CorporateCapital100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CorporateCapital100M.exceedsCapital100M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CorporateCapital100M.exceedsCapital100M
  unfold JapanTaxLaw.CorporateCapital100M.capitalFloor100M
  simp

end JapanTaxLaw.CorporateCapital100MSpec
