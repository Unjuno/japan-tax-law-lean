import JapanTaxLaw.LocalCorpCapital10MEmployees50Plus

/-! Independent spec for LocalCorpCapital10MEmployees50Plus: ¬ ceiling < capital ∧ ¬ employees <= floor. -/

namespace JapanTaxLaw.LocalCorpCapital10MEmployees50PlusSpec

def specQualified (capital employees : Nat) : Bool :=
  decide (¬ 10000000 < capital ∧ ¬ employees <= 50)

def agree (capital employees : Nat) : Prop :=
  specQualified capital employees = JapanTaxLaw.LocalCorpCapital10MEmployees50Plus.qualified capital employees

theorem agree_thm (capital employees : Nat) : agree capital employees := by
  unfold agree specQualified JapanTaxLaw.LocalCorpCapital10MEmployees50Plus.qualified
  unfold JapanTaxLaw.LocalCorpCapital10MEmployees50Plus.capitalCeiling JapanTaxLaw.LocalCorpCapital10MEmployees50Plus.employeeFloor
  simp

end JapanTaxLaw.LocalCorpCapital10MEmployees50PlusSpec
