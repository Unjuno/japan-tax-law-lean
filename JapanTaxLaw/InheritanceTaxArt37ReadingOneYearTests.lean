import JapanTaxLaw.InheritanceTaxArt37ReadingOneYear
import JapanTaxLaw.InheritanceTaxArt37ReadingOneYearSpec

/-!
# InheritanceTaxArt37ReadingOneYearTests — kernel-decided regression checks

相続税法 art.37(6): 「二年」 is read as 「一年」; the effective limit is 12 months.
Every assertion is kernel-decided; the enumerated grid is not presented as a
universal proof.
-/

namespace JapanTaxLaw.InheritanceTaxArt37ReadingOneYear

example : originalYears = 2 := by decide
example : replacementYears = 1 := by decide
example : effectiveMonths = 12 := by decide
example : specOriginal = 2 := by decide
example : specReplacement = 1 := by decide
example : specLimit = 12 := by decide
example : withinOneYear 0 = true := by decide
example : withinOneYear 11 = true := by decide
example : withinOneYear 12 = true := by decide
example : withinOneYear 13 = false := by decide
example : withinOneYear 24 = false := by decide
example : specWithin 11 = true := by decide
example : specWithin 13 = false := by decide
example : 12 - 11 = 1 := by decide
example : agreeInheritanceTaxArt37ReadingOneYear = true := by decide

end JapanTaxLaw.InheritanceTaxArt37ReadingOneYear
