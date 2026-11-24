import JapanTaxLaw.StatutoryPeriods

/-!
# StatutoryPeriodsSpec — 独立期間表と全称照合証明

`agreePeriods` proves implementation == independent table lookup for ALL 16
PeriodKind constructors by exhaustive case analysis.
-/

namespace JapanTaxLaw.StatutoryPeriods

def periodTable : List (PeriodKind × Nat × PeriodUnit) :=
  [ (PeriodKind.p6months, 6, PeriodUnit.months),
    (PeriodKind.p180days, 180, PeriodUnit.days),
    (PeriodKind.p2months, 2, PeriodUnit.months),
    (PeriodKind.p30days, 30, PeriodUnit.days),
    (PeriodKind.p60days, 60, PeriodUnit.days),
    (PeriodKind.p2years, 2, PeriodUnit.years),
    (PeriodKind.p1month, 1, PeriodUnit.months),
    (PeriodKind.p10years, 10, PeriodUnit.years),
    (PeriodKind.p5years, 5, PeriodUnit.years),
    (PeriodKind.p10days, 10, PeriodUnit.days),
    (PeriodKind.p3years, 3, PeriodUnit.years),
    (PeriodKind.p7days, 7, PeriodUnit.days),
    (PeriodKind.p5days, 5, PeriodUnit.days),
    (PeriodKind.p50days, 50, PeriodUnit.days),
    (PeriodKind.p3months, 3, PeriodUnit.months),
    (PeriodKind.p15days, 15, PeriodUnit.days) ]

def specPeriod (k : PeriodKind) : Nat × PeriodUnit :=
  match periodTable.find? (fun p => p.1 == k) with
  | some p => (p.2.1, p.2.2)
  | none => (0, PeriodUnit.days)

/-- 実装 ≡ 独立表（全 16 期間を網羅する全称証明）。 -/
theorem agreePeriods (k : PeriodKind) : periodOf k = specPeriod k := by
  cases k <;> native_decide

end JapanTaxLaw.StatutoryPeriods
