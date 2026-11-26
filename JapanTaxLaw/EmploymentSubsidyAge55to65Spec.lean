import JapanTaxLaw.EmploymentSubsidyAge55to65

/-! Independent spec for EmploymentSubsidyAge55to65: `¬ x < 55 ∧ ¬ 65 <= x`. -/

namespace JapanTaxLaw.EmploymentSubsidyAge55to65Spec

def specInBand (x : Nat) : Bool := decide (¬ x < 55 ∧ ¬ 65 <= x)
def agree (x : Nat) : Prop := specInBand x = JapanTaxLaw.EmploymentSubsidyAge55to65.inBand x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specInBand JapanTaxLaw.EmploymentSubsidyAge55to65.inBand
  unfold JapanTaxLaw.EmploymentSubsidyAge55to65.lowerBound JapanTaxLaw.EmploymentSubsidyAge55to65.upperBound
  simp

end JapanTaxLaw.EmploymentSubsidyAge55to65Spec
