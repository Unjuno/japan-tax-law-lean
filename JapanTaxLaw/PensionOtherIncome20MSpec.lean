import JapanTaxLaw.PensionOtherIncome20M

/-! Independent spec for PensionOtherIncome20M: strict `¬ x <= 20000000` form. -/

namespace JapanTaxLaw.PensionOtherIncome20MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 20000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.PensionOtherIncome20M.exceedsOtherIncome20M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.PensionOtherIncome20M.exceedsOtherIncome20M
  unfold JapanTaxLaw.PensionOtherIncome20M.otherIncomeFloor20M
  simp

end JapanTaxLaw.PensionOtherIncome20MSpec
