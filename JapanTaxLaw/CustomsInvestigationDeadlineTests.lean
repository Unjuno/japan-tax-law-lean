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

-- ==== appended boundary examples (kernel-decided) ====
-- (a) zero input (Bool gate):
example : checkInvestigationDeadline 0 0 = true := by decide

-- (b) small positive input 1..13 (day indices, both inside the range):
example : checkInvestigationDeadline 13 13 = true := by decide
example : checkInvestigationDeadline 13 12 = false := by decide

-- (c) saturation/identity: the deadline boundary is the identity endDay = refDay
--     (the two day indices coincide); the independent spec's truncated
--     subtraction saturates to 0 at and below that boundary.
example : checkInvestigationDeadline 13 13 = (13 ≤ 13) := by decide
example : 12 - 13 = 0 := by decide

end JapanTaxLaw.CustomsInvestigationDeadline
