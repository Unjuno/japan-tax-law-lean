import JapanTaxLaw.ReducedRetailSalesAllocation
import JapanTaxLaw.ReducedRetailSalesAllocationSpec

/-! # ReducedRetailSalesAllocation tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.ReducedRetailSalesAllocation

-- Boundary category 1: 50M cap (inclusive)
example : withinCap 50_000_000 = true := by decide
example : withinCap 50_000_001 = false := by decide
example : specWithin 50_000_000 = true := by decide
example : specWithin 50_000_001 = false := by decide

-- Boundary category 2: reduced base 100/108
example : reducedBase 1_080_000 1 1 = 1_000_000 := by decide
example : specReduced 1_080_000 1 1 = 1_000_000 := by decide

-- Boundary category 3: other base 100/110 with zero reduced share
example : otherBase 1_100_000 0 1 = 1_000_000 := by decide
example : specOther 1_100_000 0 1 = 1_000_000 := by decide

-- Boundary category 4: zero denominator (division guard)
example : reducedBase 1_080_000 1 0 = 0 := by decide
example : otherBase 1_100_000 1 0 = 1_000_000 := by decide

-- Universal agreement (all inputs):
#check cap_agrees
#check reduced_agrees
#check other_agrees

end JapanTaxLaw.ReducedRetailSalesAllocation
