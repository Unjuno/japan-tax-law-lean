import JapanTaxLaw.RateCeilingTwoPercentSpec

/-! Boundary tests for the 2% ceiling; all kernel-decided. -/
namespace JapanTaxLaw.RateCeilingTwoPercent

example : ceilingNum = 2 := by decide
example : ceilingDen = 100 := by decide

example : exceedsCeiling 0 100 = false := by decide
example : exceedsCeiling 1 100 = false := by decide
example : exceedsCeiling 2 100 = false := by decide
example : exceedsCeiling 3 100 = true := by decide
example : exceedsCeiling 20 1_000 = false := by decide
example : exceedsCeiling 21 1_000 = true := by decide

example : specWithinCeiling 2 100 = true := by decide
example : specWithinCeiling 3 100 = false := by decide
example : specWithinCeiling 20 1_000 = true := by decide

example : specWithinCeiling 2 100 = !exceedsCeiling 2 100 := agree_spec_impl 2 100
example : specWithinCeiling 3 100 = !exceedsCeiling 3 100 := agree_spec_impl 3 100

end JapanTaxLaw.RateCeilingTwoPercent
