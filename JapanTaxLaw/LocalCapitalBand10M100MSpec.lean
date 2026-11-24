import JapanTaxLaw.LocalCapitalBand10M100M

/-! Independent spec for LocalCapitalBand10M100M: `¬ x <= 10000000 ∧ ¬ 100000000 < x`. -/

namespace JapanTaxLaw.LocalCapitalBand10M100MSpec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 10000000 ∧ ¬ 100000000 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LocalCapitalBand10M100M.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LocalCapitalBand10M100M.inBand
  unfold JapanTaxLaw.LocalCapitalBand10M100M.lowerBound JapanTaxLaw.LocalCapitalBand10M100M.upperBound
  simp

end JapanTaxLaw.LocalCapitalBand10M100MSpec
