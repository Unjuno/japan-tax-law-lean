import JapanTaxLaw.IslandPromotionCostFloor5M

/-!
# IslandPromotionCostFloor5MSpec — independent typed specification

Pinned source identical to the implementation module (離島振興法施行令
art.2). The floor is restated as a plain `Nat` literal read independently
from 「五百万」 and the comparison is expressed in the complementary form
(amount < 5,000,000) so the spec does not reuse the implementation's `>=`
predicate. 以上 is inclusive; the boundary 5,000,000 is true.
-/

namespace JapanTaxLaw.IslandPromotionCostFloor5M

/-- Independent restatement of 「五百万」 (yen). -/
def specFloor : Nat := 5000000

/-- Independent formulation: not (amount < 5,000,000). -/
def specMeetsFloor (amount : Nat) : Bool :=
  if amount < 5000000 then false else true

example : specFloor = 5000000 := by decide
example : specMeetsFloor 0 = false := by decide
example : specMeetsFloor 4_999_999 = false := by decide
example : specMeetsFloor 5_000_000 = true := by decide
example : specMeetsFloor 5_000_001 = true := by decide
example : specMeetsFloor 10_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeIslandPromotionCostFloor5M : Bool :=
  let amounts := [0, 1, 4_999_999, 5_000_000, 5_000_001, 10_000_000]
  (costFloor == specFloor) &&
    amounts.all fun a => meetsFloor a == specMeetsFloor a

example : agreeIslandPromotionCostFloor5M = true := by decide

end JapanTaxLaw.IslandPromotionCostFloor5M
