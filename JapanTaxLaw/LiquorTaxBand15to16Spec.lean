import JapanTaxLaw.LiquorTaxBand15to16

/-! Independent spec for LiquorTaxBand15to16: `¬ x < 15 ∧ ¬ 16 <= x`. -/

namespace JapanTaxLaw.LiquorTaxBand15to16Spec

def specInBand (x : Nat) : Bool :=
  decide (¬ x < 15 ∧ ¬ 16 <= x)

def agree (x : Nat) : Prop :=
  specInBand x = JapanTaxLaw.LiquorTaxBand15to16.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.LiquorTaxBand15to16.inBand
  unfold JapanTaxLaw.LiquorTaxBand15to16.lowerBound JapanTaxLaw.LiquorTaxBand15to16.upperBound
  simp

end JapanTaxLaw.LiquorTaxBand15to16Spec
