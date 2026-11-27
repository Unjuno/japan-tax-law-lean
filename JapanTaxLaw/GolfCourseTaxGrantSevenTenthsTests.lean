import JapanTaxLaw.GolfCourseTaxGrantSevenTenths
import JapanTaxLaw.GolfCourseTaxGrantSevenTenthsSpec

/-! # GolfCourseTaxGrantSevenTenths tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.GolfCourseTaxGrantSevenTenths

-- Boundary category 1: area equals total (single municipality / full area)
example : grantAmount 100 4 4 0 = 70 := by decide
example : specGrant 100 4 4 0 = 70 := by decide

-- Boundary category 2: prorated by area ratio (二以上の市町村)
example : grantAmount 100 3 4 0 = 52 := by decide
example : specGrant 100 3 4 0 = 52 := by decide

-- Boundary category 3: zero area / zero total
example : grantAmount 100 0 4 0 = 0 := by decide
example : grantAmount 100 3 0 0 = 0 := by decide
example : specGrant 100 0 4 0 = 0 := by decide
example : specGrant 100 3 0 0 = 0 := by decide

-- Boundary category 4: refund deduction saturates at zero
example : grantAmount 100 3 4 100 = 0 := by decide
example : specGrant 100 3 4 100 = 0 := by decide

-- Universal agreement (all inputs):
#check spec_agrees

end JapanTaxLaw.GolfCourseTaxGrantSevenTenths
