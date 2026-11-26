import JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec

/-
Kernel-decided boundary examples for 関税定率法 第七条(7) (one-year deadline
from investigation start). 以内 is inclusive: the deadline day itself passes,
one day past fails.  oneYearDays stays an abstract parameter, so cases with
0, 1, 12 and 365 are exercised. Each concrete example unfolds the Prop-valued
definition first, then uses `decide` so the kernel decides it. Impl/spec
agreement and the year-count fact use theorem-as-proof examples.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests

open JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline
open JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineSpec

-- deadline day itself (inclusive)
example : withinDeadline 365 0 365 := by unfold withinDeadline; decide
example : withinDeadline 12 5 17 := by unfold withinDeadline; decide
example : withinDeadline 1 0 1 := by unfold withinDeadline; decide
example : withinDeadline 0 7 7 := by unfold withinDeadline; decide

-- completion at the start is within the deadline
example : withinDeadline 365 100 100 := by unfold withinDeadline; decide
example : withinDeadline 12 5 5 := by unfold withinDeadline; decide

-- one day past the deadline fails
example : ¬ withinDeadline 365 0 366 := by unfold withinDeadline; decide
example : ¬ withinDeadline 12 5 18 := by unfold withinDeadline; decide
example : ¬ withinDeadline 1 0 2 := by unfold withinDeadline; decide
example : ¬ withinDeadline 0 7 8 := by unfold withinDeadline; decide

-- spec boundary agrees
example : specWithin 365 0 365 := by unfold specWithin; decide
example : ¬ specWithin 365 0 366 := by unfold specWithin; decide

-- theorem-as-proof examples (no computation shortcut for the general form)
example : yearCount = 1 := yearCount_value
example (d s : Nat) : withinDeadline d s (s + yearCount * d) := at_deadline d s
example (d s o : Nat) (h : o ≤ d) : withinDeadline d s (s + o) := before_deadline d s o h
example (d s : Nat) : ¬ withinDeadline d s (s + yearCount * d + 1) := one_day_past_fails d s
example : yearCount = specYearCount := agreeYearCount
example (d s c : Nat) : withinDeadline d s c = specWithin d s c := agreeWithin d s c
example (d s : Nat) : specWithin d s (s + specYearCount * d) := spec_at_deadline d s

end JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests
