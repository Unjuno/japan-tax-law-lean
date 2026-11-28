import JapanTaxLaw.CustomsTariffArt15PriorUseException
import JapanTaxLaw.CustomsTariffArt15PriorUseExceptionSpec

/-!
# CustomsTariffArt15PriorUseExceptionTests — kernel-decided regression checks

関税定率法 art.15(1)(9): general goods need prior use (>0 months); ships and
aircraft need at least one year (>=12 months). Every assertion is kernel-decided;
the enumerated grid is not presented as a universal proof.
-/

namespace JapanTaxLaw.CustomsTariffArt15PriorUseException

example : oneYearMonths = 12 := by decide
example : specOneYear = 1 := by decide
example : inPriorUseException false 0 = false := by decide
example : inPriorUseException false 1 = true := by decide
example : inPriorUseException true 11 = false := by decide
example : inPriorUseException true 12 = true := by decide
example : inPriorUseException true 24 = true := by decide
example : specPriorUse false 0 = false := by decide
example : specPriorUse true 0 = false := by decide
example : specPriorUse true 1 = true := by decide
example : specPriorUse true 2 = true := by decide
example : oneYearMonths - oneYearMonths = 0 := by decide
example : agreeCustomsTariffArt15PriorUseException = true := by decide

end JapanTaxLaw.CustomsTariffArt15PriorUseException
