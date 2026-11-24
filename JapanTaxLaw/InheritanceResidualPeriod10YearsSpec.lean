import JapanTaxLaw.InheritanceResidualPeriod10Years

/-
# InheritanceResidualPeriod10YearsSpec — independent spec, 相続税法 第二十三条

Independent formula: `years ≤ 10` written without implementation identifiers.
Universal axiom-free equivalence; boundary examples are in the Tests module.
-/

namespace JapanTaxLaw.InheritanceResidualPeriod10Years

def specWithinPeriod (years : Nat) : Prop := years <= 10

theorem agree_within_period (years : Nat) :
    withinPeriod years ↔ specWithinPeriod years := by
  unfold withinPeriod specWithinPeriod periodCeilingYears
  rfl

end JapanTaxLaw.InheritanceResidualPeriod10Years
