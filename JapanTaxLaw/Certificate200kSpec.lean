import JapanTaxLaw.Certificate200k

/-! Independent spec for Certificate200k: strict `¬ 200000 < x` form. -/

namespace JapanTaxLaw.Certificate200kSpec

def specWithin (x : Nat) : Bool :=
  decide (¬ 200000 < x)

def agree (x : Nat) : Prop :=
  specWithin x = JapanTaxLaw.Certificate200k.withinCertificate200k x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specWithin JapanTaxLaw.Certificate200k.withinCertificate200k
  unfold JapanTaxLaw.Certificate200k.certificateCap200k
  simp

end JapanTaxLaw.Certificate200kSpec
