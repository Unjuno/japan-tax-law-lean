import JapanTaxLaw.TariffLawSupplArt1Heisei13EnforcementSpec

/-!
# TariffLawSupplArt1Heisei13Enforcement tests — kernel-decided boundary checks

Pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
境界: 除外条 2/3 とその前後 1/4; 元号年 12/13/14; 月日 5/6/7。
-/

namespace JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement

example : enforcementEraDate = (13, 1, 6) := by decide
example : appliesToArticle 1 = true := by decide
example : appliesToArticle 2 = false := by decide
example : appliesToArticle 3 = false := by decide
example : appliesToArticle 4 = true := by decide
example : appliesToArticle 12 = true := by decide
example : appliesToArticle 13 = true := by decide
example : appliesToArticle 14 = true := by decide
example : specInForce 2 = false := by decide
example : specInForce 4 = true := by decide

end JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement
