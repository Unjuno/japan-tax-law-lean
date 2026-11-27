import JapanTaxLaw.TaxAccountantExamExemption

/-!
# TaxAccountantExamExemption tests — kernel-decided boundary examples
Pinned to law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053, art. 8(2).
Unit: years; conversion prescribed -> 10, threshold 10 years.
-/

namespace JapanTaxLaw.TaxAccountantExamExemption

example : convertedYears 0 0 = 0 := by decide
example : convertedYears 10 9 = 9 := by decide
example : convertedYears 10 10 = 10 := by decide
example : convertedYears 10 11 = 11 := by decide
example : convertedYears 5 5 = 10 := by decide
example : exemptionEligible 10 4 10 5 true = false := by decide
example : exemptionEligible 10 5 10 5 true = true := by decide
example : exemptionEligible 10 5 10 5 false = false := by decide

end JapanTaxLaw.TaxAccountantExamExemption
