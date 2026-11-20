import JapanTaxLaw.CustomsInvestigationDeadlineSpec

/-!
# CustomsInvestigationDeadlineTests — kernel-decided boundary checks for art.8(2) para.8

All checks are kernel-checked (`omega` / theorem application / `by decide` on Bool).
-/

namespace JapanTaxLaw.CustomsInvestigationDeadline

example : withinInvestigationDeadline 5 5 := by
  unfold withinInvestigationDeadline; omega
example : withinInvestigationDeadline 3 5 := by
  unfold withinInvestigationDeadline; omega
example : withinInvestigationDeadline 0 0 := by
  unfold withinInvestigationDeadline; omega
example : ¬ withinInvestigationDeadline 6 5 := by
  unfold withinInvestigationDeadline; omega
example : specWithinInvestigationDeadline 5 5 := by
  unfold specWithinInvestigationDeadline; omega
example : specWithinInvestigationDeadline 3 5 := by
  unfold specWithinInvestigationDeadline; omega
example : ¬ specWithinInvestigationDeadline 6 5 := by
  unfold specWithinInvestigationDeadline; omega
example : withinInvestigationDeadline 7 7 := deadline_at_reference 7
example : ¬ withinInvestigationDeadline (7 + 1) 7 := deadline_one_day_late 7
example : checkInvestigationDeadline 5 5 = true := by decide
example : checkInvestigationDeadline 6 5 = false := by decide

end JapanTaxLaw.CustomsInvestigationDeadline
