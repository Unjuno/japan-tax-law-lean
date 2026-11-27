import JapanTaxLaw.CustomsTariffArt8Reading7_8_23
import JapanTaxLaw.CustomsTariffArt8Reading7_8_23Spec

/-!
# CustomsTariffArt8Reading7_8_23Tests — kernel-decided regression checks

関税定率法 art.8(28): only paragraphs 7, 8 and 23 are incorporated, and only
when the preceding paragraph's investigation has started. Every assertion is
kernel-decided; the enumerated grid is not presented as a universal proof.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8_23

example : specParagraphs = [7, 8, 23] := by decide
example : incorporated 7 = true := by decide
example : incorporated 8 = true := by decide
example : incorporated 23 = true := by decide
example : incorporated 6 = false := by decide
example : incorporated 9 = false := by decide
example : incorporated 22 = false := by decide
example : incorporated 24 = false := by decide
example : applies false 7 = false := by decide
example : applies true 7 = true := by decide
example : applies true 23 = true := by decide
example : applies true 9 = false := by decide
example : specIncorporated 7 = true := by decide
example : specIncorporated 24 = false := by decide
example : specApplies false 8 = false := by decide
example : specApplies true 8 = true := by decide
example : agreeCustomsTariffArt8Reading7_8_23 = true := by decide

end JapanTaxLaw.CustomsTariffArt8Reading7_8_23
