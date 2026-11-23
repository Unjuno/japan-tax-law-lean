import JapanTaxLaw.NewLifePremium80k

/-! Independent spec for NewLifePremium80k: strict `¬ x <= 80000` form. -/

namespace JapanTaxLaw.NewLifePremium80kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 80000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.NewLifePremium80k.exceedsNewLife80k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.NewLifePremium80k.exceedsNewLife80k
  unfold JapanTaxLaw.NewLifePremium80k.newLifeFloor80k
  simp

end JapanTaxLaw.NewLifePremium80kSpec
