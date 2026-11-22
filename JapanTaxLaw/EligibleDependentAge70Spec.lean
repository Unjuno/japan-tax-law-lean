import JapanTaxLaw.EligibleDependentAge70

/-- Independent spec for EligibleDependentAge70 (所得税法 art. 2): strict `¬ age < 70` form. -/

namespace JapanTaxLaw.EligibleDependentAge70Spec

def specEligible (age : Nat) : Bool :=
  decide (¬ age < 70)

def agreeEligible (x : Nat) : Prop :=
  specEligible x = JapanTaxLaw.EligibleDependentAge70.isEligibleDependent x

theorem agree_eligible (x : Nat) : agreeEligible x := by
  unfold agreeEligible specEligible JapanTaxLaw.EligibleDependentAge70.isEligibleDependent
  unfold JapanTaxLaw.EligibleDependentAge70.eligibleAge
  simp

end JapanTaxLaw.EligibleDependentAge70Spec
