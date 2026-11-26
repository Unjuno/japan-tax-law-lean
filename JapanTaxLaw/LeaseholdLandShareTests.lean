import JapanTaxLaw.LeaseholdLandShare

/-!
# LeaseholdLandShare tests — kernel-decided boundary examples
Pinned to law 403AC0000000069, revision 403AC0000000069_20250601_504AC0000000068, art. 18(1).
Unit: 円; provider base/whole land values.
-/

namespace JapanTaxLaw.LeaseholdLandShare

example : shareAmount 0 0 = 0 := by decide
example : shareAmount 1 0 = 0 := by decide
example : shareAmount 0 100 = 0 := by decide
example : shareAmount 100 100 = 30000 := by decide
example : shareAmount 50 100 = 15000 := by decide
example : shareAmount 1 3 = 10000 := by decide

end JapanTaxLaw.LeaseholdLandShare
