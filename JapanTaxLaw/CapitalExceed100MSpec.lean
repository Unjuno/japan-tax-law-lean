import JapanTaxLaw.CapitalExceed100M

/-! Independent spec for CapitalExceed100M: strict `¬ x <= 100000000` form. -/

namespace JapanTaxLaw.CapitalExceed100MSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 100000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CapitalExceed100M.exceedsCapital100M x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CapitalExceed100M.exceedsCapital100M
  unfold JapanTaxLaw.CapitalExceed100M.capitalThreshold100M
  simp

end JapanTaxLaw.CapitalExceed100MSpec
