import JapanTaxLaw.DisasterIncomeBand6M75M

/-! Independent spec for DisasterIncomeBand6M75M: `¬ x <= 6000000 ∧ ¬ 7500000 < x`. -/

namespace JapanTaxLaw.DisasterIncomeBand6M75MSpec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 6000000 ∧ ¬ 7500000 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.DisasterIncomeBand6M75M.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.DisasterIncomeBand6M75M.inBand
  unfold JapanTaxLaw.DisasterIncomeBand6M75M.lowerBound JapanTaxLaw.DisasterIncomeBand6M75M.upperBound
  simp

end JapanTaxLaw.DisasterIncomeBand6M75MSpec
