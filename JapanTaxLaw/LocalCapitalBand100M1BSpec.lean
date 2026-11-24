import JapanTaxLaw.LocalCapitalBand100M1B

/-! Independent spec for LocalCapitalBand100M1B: `¬ x <= 100000000 ∧ ¬ 1000000000 < x`. -/

namespace JapanTaxLaw.LocalCapitalBand100M1BSpec

def specInBand (x : Nat) : Bool :=
  decide (¬ x <= 100000000 ∧ ¬ 1000000000 < x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LocalCapitalBand100M1B.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LocalCapitalBand100M1B.inBand
  unfold JapanTaxLaw.LocalCapitalBand100M1B.lowerBound JapanTaxLaw.LocalCapitalBand100M1B.upperBound
  simp

end JapanTaxLaw.LocalCapitalBand100M1BSpec
