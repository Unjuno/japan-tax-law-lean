import JapanTaxLaw.FilingRoute

/-!
# FilingRoute tests — 届出経由機関 smoke checks
Decidable smoke tests, pinned to law 328CO0000000028 / revision 328CO0000000028_20220401_504CO0000000151.
税務署長(0)/国税局長(1)/国税庁長官(2)→true、その他(3)→false。
-/

namespace JapanTaxLaw.FilingRoute

example : isCompetentAuthority 0 = true := by decide
example : isCompetentAuthority 1 = true := by decide
example : isCompetentAuthority 2 = true := by decide
example : isCompetentAuthority 3 = false := by decide
example : isCompetentAuthority 4 = false := by decide

end JapanTaxLaw.FilingRoute
