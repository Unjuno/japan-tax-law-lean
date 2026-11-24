import JapanTaxLaw.ShareExchange50Under

/-! Independent spec for ShareExchange50Under: strict `¬ 50 <= x` form. -/

namespace JapanTaxLaw.ShareExchange50UnderSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 50 <= x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.ShareExchange50Under.under50 x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.ShareExchange50Under.under50
  unfold JapanTaxLaw.ShareExchange50Under.shareLimit50
  simp

end JapanTaxLaw.ShareExchange50UnderSpec
