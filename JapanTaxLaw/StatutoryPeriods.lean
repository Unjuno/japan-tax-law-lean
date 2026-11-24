import JapanTaxLaw.TaxFinance

/-!
# StatutoryPeriods — 16 の pinned 法定期間（○年/月/日以内）規定

Each pinned unit states a statutory period expressed in years, months or days.
The model records the exact (count, unit) pair; the triggering event, the
starting point and whether the period is an extension or a deadline are
caller-established and NOT MODELLED.

Sources: the 16 normative units listed in the per-unit evidence ledger.
-/

namespace JapanTaxLaw.StatutoryPeriods

/-- 期間の単位。 -/
inductive PeriodUnit where
  | years | months | days
deriving DecidableEq, Repr

/-- 16 の法定期間規定を区別する添字。 -/
inductive PeriodKind where
  | p6months | p180days | p2months | p30days | p60days | p2years
  | p1month | p10years | p5years | p10days | p3years | p7days
  | p5days | p50days | p3months | p15days
deriving DecidableEq, Repr

/-- 実装: (数値, 単位) の組。 -/
def periodOf : PeriodKind → Nat × PeriodUnit
  | PeriodKind.p6months => (6, PeriodUnit.months)
  | PeriodKind.p180days => (180, PeriodUnit.days)
  | PeriodKind.p2months => (2, PeriodUnit.months)
  | PeriodKind.p30days => (30, PeriodUnit.days)
  | PeriodKind.p60days => (60, PeriodUnit.days)
  | PeriodKind.p2years => (2, PeriodUnit.years)
  | PeriodKind.p1month => (1, PeriodUnit.months)
  | PeriodKind.p10years => (10, PeriodUnit.years)
  | PeriodKind.p5years => (5, PeriodUnit.years)
  | PeriodKind.p10days => (10, PeriodUnit.days)
  | PeriodKind.p3years => (3, PeriodUnit.years)
  | PeriodKind.p7days => (7, PeriodUnit.days)
  | PeriodKind.p5days => (5, PeriodUnit.days)
  | PeriodKind.p50days => (50, PeriodUnit.days)
  | PeriodKind.p3months => (3, PeriodUnit.months)
  | PeriodKind.p15days => (15, PeriodUnit.days)

/-- 期間の数値は正（全域で成立）。 -/
theorem period_count_pos (k : PeriodKind) : (periodOf k).1 > 0 := by
  cases k <;> decide

end JapanTaxLaw.StatutoryPeriods
