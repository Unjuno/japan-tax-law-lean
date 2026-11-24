import JapanTaxLaw.InvestigationDeadlineOneYearSpec

/-! Boundary tests for the inclusive one-year deadline; all kernel-decided. -/
namespace JapanTaxLaw.InvestigationDeadlineOneYear

example : limitYears = 1 := by decide
example : withinDeadline 0 = true := by decide
example : withinDeadline 1 = true := by decide
example : withinDeadline 2 = false := by decide

example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 2 = false := by decide

example : specWithin 0 = withinDeadline 0 := agree_spec_impl 0
example : specWithin 1 = withinDeadline 1 := agree_spec_impl 1
example : specWithin 2 = withinDeadline 2 := agree_spec_impl 2

end JapanTaxLaw.InvestigationDeadlineOneYear
