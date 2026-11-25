import JapanTaxLaw.HistoricalSalaryDeductionSpec

/-! Regression tests — 給与所得控除額（旧法）十分の二. -/

namespace JapanTaxLaw.HistoricalSalaryDeduction

example : deduction Band.base30000 530_000 = 130_000 := by decide
example : deduction Band.base40000 640_000 = 160_000 := by decide
example : deduction Band.base100000 900_000 = 260_000 := by decide
example : deduction Band.base30000 530_000 = specDeduction Band.base30000 530_000 :=
  agreeDeduction Band.base30000 530_000
example : deduction Band.base100000 900_000 ≤ deduction Band.base100000 1_000_000 :=
  monotone Band.base100000 900_000 1_000_000 (by decide)

end JapanTaxLaw.HistoricalSalaryDeduction
