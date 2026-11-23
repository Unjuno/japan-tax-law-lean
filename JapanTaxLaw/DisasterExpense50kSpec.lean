import JapanTaxLaw.DisasterExpense50k

/-! Independent spec for DisasterExpense50k: strict `¬ x <= 50000` form. -/

namespace JapanTaxLaw.DisasterExpense50kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 50000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.DisasterExpense50k.exceedsDisasterExpense50k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.DisasterExpense50k.exceedsDisasterExpense50k
  unfold JapanTaxLaw.DisasterExpense50k.disasterFloor50k
  simp

end JapanTaxLaw.DisasterExpense50kSpec
