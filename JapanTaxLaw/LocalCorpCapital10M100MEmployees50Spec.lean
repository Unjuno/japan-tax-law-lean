import JapanTaxLaw.LocalCorpCapital10M100MEmployees50

/-! Independent spec for LocalCorpCapital10M100MEmployees50: ¬ capital <= lo ∧ ¬ hi < capital ∧ ¬ ceiling < employees. -/

namespace JapanTaxLaw.LocalCorpCapital10M100MEmployees50Spec

def specQualified (capital employees : Nat) : Bool :=
  decide (¬ capital <= 10000000 ∧ ¬ 100000000 < capital ∧ ¬ 50 < employees)

def agree (capital employees : Nat) : Prop :=
  specQualified capital employees = JapanTaxLaw.LocalCorpCapital10M100MEmployees50.qualified capital employees

theorem agree_thm (capital employees : Nat) : agree capital employees := by
  unfold agree specQualified JapanTaxLaw.LocalCorpCapital10M100MEmployees50.qualified
  unfold JapanTaxLaw.LocalCorpCapital10M100MEmployees50.capitalLower JapanTaxLaw.LocalCorpCapital10M100MEmployees50.capitalUpper JapanTaxLaw.LocalCorpCapital10M100MEmployees50.employeeCeiling
  simp

end JapanTaxLaw.LocalCorpCapital10M100MEmployees50Spec
