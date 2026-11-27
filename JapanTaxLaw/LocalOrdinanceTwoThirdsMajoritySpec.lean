import JapanTaxLaw.LocalOrdinanceTwoThirdsMajority

/-! Independent spec for LocalOrdinanceTwoThirdsMajority: `¬ 3 × yes < 2 × attending` with positive attendance. -/

namespace JapanTaxLaw.LocalOrdinanceTwoThirdsMajoritySpec

def specTwoThirds (yes attending : Nat) : Bool :=
  decide (¬ attending <= 0 ∧ ¬ 3 * yes < 2 * attending)

def agree (yes attending : Nat) : Prop :=
  specTwoThirds yes attending = JapanTaxLaw.LocalOrdinanceTwoThirdsMajority.hasTwoThirds yes attending

theorem agree_thm (yes attending : Nat) : agree yes attending := by
  unfold agree specTwoThirds JapanTaxLaw.LocalOrdinanceTwoThirdsMajority.hasTwoThirds
  unfold JapanTaxLaw.LocalOrdinanceTwoThirdsMajority.numerator JapanTaxLaw.LocalOrdinanceTwoThirdsMajority.denominator
  apply Bool.eq_iff_iff.mpr
  rw [decide_eq_true_eq, decide_eq_true_eq]
  constructor
  · intro h
    constructor
    · exact Nat.lt_of_not_ge h.1
    · exact Nat.le_of_not_gt h.2
  · intro h
    constructor
    · exact Nat.not_le_of_gt h.1
    · exact Nat.not_lt_of_ge h.2

end JapanTaxLaw.LocalOrdinanceTwoThirdsMajoritySpec
