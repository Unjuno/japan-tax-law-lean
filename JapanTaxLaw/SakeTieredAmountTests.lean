import JapanTaxLaw.SakeTieredAmountSpec

/-! Boundary tests across the 20/21-degree threshold; all kernel-decided. -/
namespace JapanTaxLaw.SakeTieredAmount

example : baseYen = 200_000 := by decide
example : perDegreeYen = 10_000 := by decide

example : tieredAmount 0 = 200_000 := by decide
example : tieredAmount 19 = 200_000 := by decide
example : tieredAmount 20 = 200_000 := by decide
example : tieredAmount 21 = 210_000 := by decide
example : tieredAmount 22 = 220_000 := by decide
example : tieredAmount 30 = 300_000 := by decide

example : specAmount 19 = tieredAmount 19 := agree_spec_impl 19
example : specAmount 20 = tieredAmount 20 := agree_spec_impl 20
example : specAmount 21 = tieredAmount 21 := agree_spec_impl 21
example : specAmount 30 = tieredAmount 30 := agree_spec_impl 30

end JapanTaxLaw.SakeTieredAmount
