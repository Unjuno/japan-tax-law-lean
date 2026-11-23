import JapanTaxLaw.NewAnnuityPremium80k

/-! Independent spec for NewAnnuityPremium80k: strict `¬ x <= 80000` form. -/

namespace JapanTaxLaw.NewAnnuityPremium80kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 80000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.NewAnnuityPremium80k.exceedsNewAnnuity80k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.NewAnnuityPremium80k.exceedsNewAnnuity80k
  unfold JapanTaxLaw.NewAnnuityPremium80k.newAnnuityFloor80k
  simp

end JapanTaxLaw.NewAnnuityPremium80kSpec
