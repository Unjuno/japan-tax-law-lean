import JapanTaxLaw.StampFine300k

/-! Independent spec for StampFine300k: strict `¬ 300000 < x` form. -/

namespace JapanTaxLaw.StampFine300kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 300000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.StampFine300k.withinStampFine x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.StampFine300k.withinStampFine
  unfold JapanTaxLaw.StampFine300k.stampFineCap300k
  simp

end JapanTaxLaw.StampFine300kSpec
