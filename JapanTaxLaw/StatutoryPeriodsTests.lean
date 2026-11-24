import JapanTaxLaw.StatutoryPeriodsSpec

/-! Regression tests — 16 法定期間. -/

namespace JapanTaxLaw.StatutoryPeriods

example : periodOf PeriodKind.p6months = (6, PeriodUnit.months) := by decide
example : periodOf PeriodKind.p180days = (180, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p2months = (2, PeriodUnit.months) := by decide
example : periodOf PeriodKind.p30days = (30, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p60days = (60, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p2years = (2, PeriodUnit.years) := by decide
example : periodOf PeriodKind.p1month = (1, PeriodUnit.months) := by decide
example : periodOf PeriodKind.p10years = (10, PeriodUnit.years) := by decide
example : periodOf PeriodKind.p5years = (5, PeriodUnit.years) := by decide
example : periodOf PeriodKind.p10days = (10, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p3years = (3, PeriodUnit.years) := by decide
example : periodOf PeriodKind.p7days = (7, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p5days = (5, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p50days = (50, PeriodUnit.days) := by decide
example : periodOf PeriodKind.p3months = (3, PeriodUnit.months) := by decide
example : periodOf PeriodKind.p15days = (15, PeriodUnit.days) := by decide

example : periodOf PeriodKind.p6months = specPeriod PeriodKind.p6months := agreePeriods _
example : periodOf PeriodKind.p15days = specPeriod PeriodKind.p15days := agreePeriods _
example : (periodOf PeriodKind.p1month).1 > 0 := period_count_pos _

end JapanTaxLaw.StatutoryPeriods
