import JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB

/-!
# LocalTaxDeferralSmallAmountException1MB tests — 100万円境界の検査
Pinned to law 325AC0000000226 / art. 72の39の2. zero / small / below / at / above 1000000.
-/

namespace JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB

example : isSmallAmount 0 = true := by decide
example : isSmallAmount 1 = true := by decide
example : isSmallAmount 999999 = true := by decide
example : isSmallAmount 1000000 = true := by decide
example : isSmallAmount 1000001 = false := by decide
example : isSmallAmount 2000000 = false := by decide

end JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB
