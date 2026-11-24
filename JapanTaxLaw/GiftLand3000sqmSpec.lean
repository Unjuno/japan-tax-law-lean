import JapanTaxLaw.GiftLand3000sqm

/-! Independent spec for GiftLand3000sqm: strict `¬ x < 3000000` form. -/

namespace JapanTaxLaw.GiftLand3000sqmSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ x < 3000000)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.GiftLand3000sqm.hasGiftLand3000 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.GiftLand3000sqm.hasGiftLand3000
  unfold JapanTaxLaw.GiftLand3000sqm.giftLandFloor3000
  simp

end JapanTaxLaw.GiftLand3000sqmSpec
