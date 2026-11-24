import JapanTaxLaw.LocalCapitalBand1B5B

/-! Independent spec for LocalCapitalBand1B5B: `¬ x <= 1000000000 ∧ ¬ 5000000000 < x`. -/

namespace JapanTaxLaw.LocalCapitalBand1B5BSpec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 1000000000 ∧ ¬ 5000000000 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LocalCapitalBand1B5B.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LocalCapitalBand1B5B.inBand
  unfold JapanTaxLaw.LocalCapitalBand1B5B.lowerBound JapanTaxLaw.LocalCapitalBand1B5B.upperBound
  simp

end JapanTaxLaw.LocalCapitalBand1B5BSpec
