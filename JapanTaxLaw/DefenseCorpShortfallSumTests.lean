import JapanTaxLaw.DefenseCorpShortfallSum
import JapanTaxLaw.DefenseCorpShortfallSumSpec

/-
# DefenseCorpShortfallSumTests — 政令3(6)(1) の kernel-decided 検証

Pinned: law 507CO0000000134 / revision 507CO0000000134_20260401_508CO0000000105.
Closed expressions discharged by `by decide`.
Coverage: strict zero boundary (-1/0/+1), zero/small inputs, saturation at zero,
multi-element sums and impl/spec agreement. Finite smoke checks; the universal
sum bridge is proved by induction in the Spec module.
-/

namespace JapanTaxLaw.DefenseCorpShortfallSum

example : statutoryFloor = 0 := by decide

-- 零入力・小さい入力
example : shortfallSum [] = 0 := by decide
example : shortfall 0 = 0 := by decide
example : shortfall 1 = 0 := by decide
example : shortfall 2 = 0 := by decide

-- 厳密境界: 零を下回る場合のみ寄与
example : shortfall (-1) = 1 := by decide
example : shortfall 0 = 0 := by decide
example : shortfall 1 = 0 := by decide

-- より大きな負額・zero saturation
example : shortfall (-5) = 5 := by decide
example : shortfall (-10000) = 10000 := by decide

-- 合計
example : shortfallSum [-1, 0, 2, -3] = 4 := by decide
example : shortfallSum [0, 1, 2] = 0 := by decide
example : shortfallSum [-1] = 1 := by decide

-- impl / 独立仕様の一致
example : statutoryFloor = specZero := by decide
example : shortfall (-1) = specShortfall (-1) := by decide
example : shortfall 0 = specShortfall 0 := by decide
example : shortfall 1 = specShortfall 1 := by decide
example : shortfallSum [] = specSum [] := by decide
example : shortfallSum [-1, 0, 2, -3] = specSum [-1, 0, 2, -3] := by decide
example : shortfallSum [-5, 1, -3] = specSum [-5, 1, -3] := by decide

end JapanTaxLaw.DefenseCorpShortfallSum
