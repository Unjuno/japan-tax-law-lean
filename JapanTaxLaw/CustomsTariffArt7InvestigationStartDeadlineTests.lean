import JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec

/-
Kernel-decided boundary examples for 関税定率法 第七条(7) (one-year deadline
from investigation start). 以内 is inclusive: the deadline day itself passes,
one day past fails. `withinDeadlineBool` and `daysRemaining` give decidable
Bool/Nat observations of the same deadline, with genuine zero / small-input /
saturation boundaries. All concrete cases are decided by the kernel; the
general boundary theorems remain theorem-as-proof examples.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests

open JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline
open JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec

-- Boolean decision at and around the deadline
example : withinDeadlineBool 365 0 365 = true := by decide
example : withinDeadlineBool 365 0 364 = true := by decide
example : withinDeadlineBool 365 0 366 = false := by decide
example : withinDeadlineBool 1 0 1 = true := by decide
example : withinDeadlineBool 1 0 2 = false := by decide
example : withinDeadlineBool 0 7 7 = true := by decide
example : withinDeadlineBool 0 7 8 = false := by decide
example : withinDeadlineBool 365 100 100 = true := by decide

-- Remaining budget: zero at the deadline, positive inside, zero past it
example : daysRemaining 365 0 365 = 0 := by decide
example : daysRemaining 365 0 364 = 1 := by decide
example : daysRemaining 365 0 366 = 0 := by decide
example : daysRemaining 1 0 1 = 0 := by decide
example : daysRemaining 12 5 17 = 0 := by decide
example : daysRemaining 12 5 16 = 1 := by decide

-- Prop-valued forms (unfolded first, then kernel-decided)
example : withinDeadline 365 0 365 := by unfold withinDeadline; decide
example : ¬ withinDeadline 365 0 366 := by unfold withinDeadline; decide
example : specWithin 365 0 365 := by unfold specWithin; decide
example : ¬ specWithin 365 0 366 := by unfold specWithin; decide

-- Theorem-as-proof examples (no computation shortcut for the general form)
example : yearCount = 1 := yearCount_value
example (d s : Nat) : withinDeadline d s (s + yearCount * d) := at_deadline d s
example (d s o : Nat) (h : o ≤ d) : withinDeadline d s (s + o) := before_deadline d s o h
example (d s : Nat) : ¬ withinDeadline d s (s + yearCount * d + 1) := one_day_past_fails d s
example (d s : Nat) : daysRemaining d s (s + d) = 0 := daysRemaining_at_deadline d s
example : yearCount = specYearCount := agreeYearCount
example (d s c : Nat) : withinDeadline d s c = specWithin d s c := agreeWithin d s c
example (d s c : Nat) : daysRemaining d s c = specDaysRemaining d s c := agreeDaysRemaining d s c
example (d s : Nat) : specWithin d s (s + specYearCount * d) := spec_at_deadline d s

end JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests
