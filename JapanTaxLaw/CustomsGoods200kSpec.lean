import JapanTaxLaw.CustomsGoods200k

/-! Independent spec for CustomsGoods200k: strict `¬ 200000 < x` form. -/

namespace JapanTaxLaw.CustomsGoods200kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 200000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CustomsGoods200k.withinCustomsGoods200k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CustomsGoods200k.withinCustomsGoods200k
  unfold JapanTaxLaw.CustomsGoods200k.customsGoodsCap200k
  simp

end JapanTaxLaw.CustomsGoods200kSpec
