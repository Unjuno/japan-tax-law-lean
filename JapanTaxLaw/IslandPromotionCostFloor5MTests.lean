import JapanTaxLaw.IslandPromotionCostFloor5M
import JapanTaxLaw.IslandPromotionCostFloor5MSpec

/-!
# IslandPromotionCostFloor5MTests — kernel-decided regression checks

離島振興法施行令 art.2 (五百万円以上のもの, inclusive). Boundaries
4,999,999 / 5,000,000 / 5,000,001 are checked. Every assertion is
kernel-decided; no finite grid is presented as a universal proof.
-/

namespace JapanTaxLaw.IslandPromotionCostFloor5M

example : costFloor = 5_000_000 := by decide
example : costFloor = specFloor := by decide
example : meetsFloor 0 = false := by decide
example : meetsFloor 4_999_999 = false := by decide
example : meetsFloor 5_000_000 = true := by decide
example : meetsFloor 5_000_001 = true := by decide
example : specMeetsFloor 4_999_999 = false := by decide
example : specMeetsFloor 5_000_000 = true := by decide
example : specMeetsFloor 5_000_001 = true := by decide
example : agreeIslandPromotionCostFloor5M = true := by decide

end JapanTaxLaw.IslandPromotionCostFloor5M
