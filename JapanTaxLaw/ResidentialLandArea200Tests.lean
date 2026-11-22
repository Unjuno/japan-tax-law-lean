import JapanTaxLaw.ResidentialLandArea200Spec

/-! Kernel-decided boundary examples for 地方税法 art. 349の3の二 (200 m²). -/

namespace JapanTaxLaw.ResidentialLandArea200Tests

open JapanTaxLaw.ResidentialLandArea200
open JapanTaxLaw.ResidentialLandArea200Spec

example : withinArea 0 = true := by decide
example : withinArea 199 = true := by decide
example : withinArea 200 = true := by decide
example : withinArea 201 = false := by decide
example : specWithinArea 199 = true := by decide
example : specWithinArea 200 = true := by decide
example : specWithinArea 201 = false := by decide
example : agreeArea 0 := agree_area 0
example : agreeArea 199 := agree_area 199
example : agreeArea 200 := agree_area 200
example : agreeArea 201 := agree_area 201

end JapanTaxLaw.ResidentialLandArea200Tests
