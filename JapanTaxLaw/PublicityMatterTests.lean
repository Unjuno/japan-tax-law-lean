import JapanTaxLaw.PublicityMatter

/-!
# PublicityMatter tests — 公示事項 smoke checks
Decidable smoke tests, pinned to law 341M50000040055 / revision 341M50000040055_20260601_508M60000040016.
指定日(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.PublicityMatter

example : isPublicityMatter 0 = true := by decide
example : isPublicityMatter 1 = false := by decide
example : isPublicityMatter 2 = false := by decide

end JapanTaxLaw.PublicityMatter
