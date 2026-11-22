import JapanTaxLaw.LandArea400Spec

/-! Kernel-decided boundary examples for LandArea400 (0/399/400/401 m²). -/

namespace JapanTaxLaw.LandArea400Tests

open JapanTaxLaw.LandArea400
open JapanTaxLaw.LandArea400Spec

example : withinLandArea 0 = true := by decide
example : withinLandArea 399 = true := by decide
example : withinLandArea 400 = true := by decide
example : withinLandArea 401 = false := by decide
example : specLandArea 399 = true := by decide
example : specLandArea 400 = true := by decide
example : specLandArea 401 = false := by decide
example : agreeLand 0 := agree_land 0
example : agreeLand 399 := agree_land 399
example : agreeLand 400 := agree_land 400
example : agreeLand 401 := agree_land 401

end JapanTaxLaw.LandArea400Tests
