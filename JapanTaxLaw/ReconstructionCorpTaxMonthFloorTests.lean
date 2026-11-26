import JapanTaxLaw.ReconstructionCorpTaxMonthFloor
import JapanTaxLaw.ReconstructionCorpTaxMonthFloorSpec

/-
# ReconstructionCorpTaxMonthFloorTests — 復興特例法人税政令 3(3) の kernel-decided 検証

Pinned: law 424CO0000000017 / revision 424CO0000000017_20240401_505CO0000000208.
Closed Nat expressions discharged by `by decide`.
Coverage: zero input, sub-month fractions, exact one month, 13/12 and 31/32
boundaries, and impl/spec agreement. Finite smoke suite.
-/

namespace JapanTaxLaw.ReconstructionCorpTaxMonthFloor

-- 零入力・小さい入力
example : effectiveMonths 0 1 = 0 := by decide
example : effectiveMonths 1 2 = 0 := by decide
example : effectiveMonths 2 3 = 0 := by decide
example : effectiveMonths 3 2 = 1 := by decide

-- 一月未満の端数切り捨て（strict floor）
example : effectiveMonths 11 12 = 0 := by decide
example : effectiveMonths 12 12 = 1 := by decide
example : effectiveMonths 13 12 = 1 := by decide

-- より小さな端数
example : effectiveMonths 31 32 = 0 := by decide
example : effectiveMonths 32 32 = 1 := by decide

-- saturation: 結果が入力に等しい／零
example : effectiveMonths 0 5 = 0 := by decide
example : effectiveMonths 1 1 = 1 := by decide

-- impl / 独立仕様の一致
example : effectiveMonths 0 1 = specFloorMonths 0 1 := by decide
example : effectiveMonths 1 2 = specFloorMonths 1 2 := by decide
example : effectiveMonths 11 12 = specFloorMonths 11 12 := by decide
example : effectiveMonths 12 12 = specFloorMonths 12 12 := by decide
example : effectiveMonths 13 12 = specFloorMonths 13 12 := by decide
example : effectiveMonths 31 32 = specFloorMonths 31 32 := by decide

end JapanTaxLaw.ReconstructionCorpTaxMonthFloor
