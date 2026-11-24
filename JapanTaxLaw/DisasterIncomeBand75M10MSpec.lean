import JapanTaxLaw.DisasterIncomeBand75M10M

/-! Independent spec for DisasterIncomeBand75M10M: `¬ x <= 7500000 ∧ ¬ 10000000 < x`. -/

namespace JapanTaxLaw.DisasterIncomeBand75M10MSpec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 7500000 ∧ ¬ 10000000 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.DisasterIncomeBand75M10M.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.DisasterIncomeBand75M10M.inBand
  unfold JapanTaxLaw.DisasterIncomeBand75M10M.lowerBound JapanTaxLaw.DisasterIncomeBand75M10M.upperBound
  simp

end JapanTaxLaw.DisasterIncomeBand75M10MSpec
