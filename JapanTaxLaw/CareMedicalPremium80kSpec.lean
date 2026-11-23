import JapanTaxLaw.CareMedicalPremium80k

/-! Independent spec for CareMedicalPremium80k: strict `¬ x <= 80000` form. -/

namespace JapanTaxLaw.CareMedicalPremium80kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x <= 80000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CareMedicalPremium80k.exceedsCareMedical80k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CareMedicalPremium80k.exceedsCareMedical80k
  unfold JapanTaxLaw.CareMedicalPremium80k.careMedicalFloor80k
  simp

end JapanTaxLaw.CareMedicalPremium80kSpec
