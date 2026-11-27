import JapanTaxLaw.PortMunicipalityAllocationBase
import JapanTaxLaw.PortMunicipalityAllocationBaseSpec

/-! # PortMunicipalityAllocationBase tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.PortMunicipalityAllocationBase

-- Boundary category 1: below threshold (0 / 1 municipality)
example : allocationBase 0 100 7 = 100 := by decide
example : allocationBase 1 100 7 = 100 := by decide
example : specBase 0 100 7 = 100 := by decide
example : specBase 1 100 7 = 100 := by decide

-- Boundary category 2: exactly two (二以上 inclusive)
example : allocationBase 2 100 7 = 7 := by decide
example : specBase 2 100 7 = 7 := by decide

-- Boundary category 3: above threshold
example : allocationBase 9 100 7 = 7 := by decide
example : specBase 9 100 7 = 7 := by decide

-- Boundary category 4: zero revenue
example : allocationBase 2 0 0 = 0 := by decide
example : specBase 2 0 0 = 0 := by decide

-- Universal agreement (no finite-domain assumption):
#check spec_agrees

end JapanTaxLaw.PortMunicipalityAllocationBase
