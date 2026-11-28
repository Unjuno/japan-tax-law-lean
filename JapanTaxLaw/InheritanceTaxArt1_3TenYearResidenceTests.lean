import JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence
import JapanTaxLaw.InheritanceTaxArt1_3TenYearResidenceSpec

/-!
# InheritanceTaxArt1_3TenYearResidenceTests — kernel-decided regression checks

相続税法 art.1の3: domicile within ten years before inheritance start, inclusive
at year 10. Every assertion is kernel-decided; the enumerated grid is not
presented as a universal proof.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence

example : windowYears = 10 := by decide
example : specWindow = 10 := by decide
example : hadResidenceWithin 0 = true := by decide
example : hadResidenceWithin 9 = true := by decide
example : hadResidenceWithin 10 = true := by decide
example : hadResidenceWithin 11 = false := by decide
example : hadResidenceWithin 20 = false := by decide
example : specWithin 9 = true := by decide
example : specWithin 10 = true := by decide
example : specWithin 11 = false := by decide
example : 10 - 10 = 0 := by decide
example : agreeInheritanceTaxArt1_3TenYearResidence = true := by decide

end JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence
