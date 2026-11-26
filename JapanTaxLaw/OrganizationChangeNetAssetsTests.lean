import JapanTaxLaw.OrganizationChangeNetAssets

/-!
# OrganizationChangeNetAssets tests — kernel-decided boundary examples
Pinned to law 342M50000040037, revision 342M50000040037_20260401_508M60000040008, art. 12(1).
Unit: 円; provider assets/liabilities/floor.
-/

namespace JapanTaxLaw.OrganizationChangeNetAssets

example : netAssets 0 0 0 = 0 := by decide
example : netAssets 1 0 0 = 1 := by decide
example : netAssets 100 0 10 = 100 := by decide
example : netAssets 100 40 10 = 60 := by decide
example : netAssets 100 40 80 = 80 := by decide
example : netAssets 50 100 10 = 10 := by decide

end JapanTaxLaw.OrganizationChangeNetAssets
