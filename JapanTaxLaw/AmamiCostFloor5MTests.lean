import JapanTaxLaw.AmamiCostFloor5M
import JapanTaxLaw.AmamiCostFloor5MSpec

/-!
# AmamiCostFloor5MTests — kernel-decided regression checks

奄美群島振興開発特別措置法施行令 art.1 (五百万円以上のもの, inclusive).
Boundaries 4,999,999 / 5,000,000 / 5,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.AmamiCostFloor5M

example : costFloor = 5_000_000 := by decide
example : costFloor = specFloor := by decide
example : meetsFloor 0 = false := by decide
example : meetsFloor 4_999_999 = false := by decide
example : meetsFloor 5_000_000 = true := by decide
example : meetsFloor 5_000_001 = true := by decide
example : specMeetsFloor 4_999_999 = false := by decide
example : specMeetsFloor 5_000_000 = true := by decide
example : specMeetsFloor 5_000_001 = true := by decide
example : agreeAmamiCostFloor5M = true := by decide

end JapanTaxLaw.AmamiCostFloor5M
