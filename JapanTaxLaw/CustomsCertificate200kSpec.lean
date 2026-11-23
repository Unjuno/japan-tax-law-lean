import JapanTaxLaw.CustomsCertificate200k

/-! Independent spec for CustomsCertificate200k: strict `¬ 200000 < x` form. -/

namespace JapanTaxLaw.CustomsCertificate200kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 200000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.CustomsCertificate200k.withinCustomsCert200k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.CustomsCertificate200k.withinCustomsCert200k
  unfold JapanTaxLaw.CustomsCertificate200k.customsCertCap200k
  simp

end JapanTaxLaw.CustomsCertificate200kSpec
