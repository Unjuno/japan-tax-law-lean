import JapanTaxLaw.LocalFine300k

/-! Independent spec for LocalFine300k: strict `¬ 300000 < x` form. -/

namespace JapanTaxLaw.LocalFine300kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 300000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.LocalFine300k.withinLocalFine x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.LocalFine300k.withinLocalFine
  unfold JapanTaxLaw.LocalFine300k.localFineCap300k
  simp

end JapanTaxLaw.LocalFine300kSpec
