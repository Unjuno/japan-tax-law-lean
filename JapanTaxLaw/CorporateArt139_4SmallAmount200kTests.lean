import JapanTaxLaw.CorporateArt139_4SmallAmount200k
import JapanTaxLaw.CorporateArt139_4SmallAmount200kSpec

/-!
# CorporateArt139_4SmallAmount200kTests — kernel-decided regression checks

法人税法施行令 art. 139の4 (二十万円未満である場合, strict `<`). Boundaries
199,999 / 200,000 / 200,001 are checked. Every assertion is kernel-decided;
no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.CorporateArt139_4SmallAmount200k

example : amountCap = 200_000 := by decide
example : amountCap = specCap := by decide
example : isSmall 0 = true := by decide
example : isSmall 199_999 = true := by decide
example : isSmall 200_000 = false := by decide
example : isSmall 200_001 = false := by decide
example : specIsSmall 199_999 = true := by decide
example : specIsSmall 200_000 = false := by decide
example : specIsSmall 200_001 = false := by decide
example : agreeCorporateArt139_4SmallAmount200k = true := by decide

end JapanTaxLaw.CorporateArt139_4SmallAmount200k
