import JapanTaxLaw.GroupLossRatio

/-!
# GroupLossRatio spec — 法人税法 art. 64の7（欠損金の通算）の割合計算規則

Sources (pinned; identical to GroupLossRatio.lean):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01

Independent restatement:
  * safeRatio num den: den=0 → 0; num≤den → num/den (floor); num>den → 1
  * nonSpecificAllocation pool incomePart totalIncome = pool × safeRatio incomePart totalIncome
  impl と独立に、入れ子 if を bool 判定の別形で定式化。

Only the two explicit ratio rules of art. 64の7 are modelled. 全体の配分規定は NOT MODELLED。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 割合（独立定式）。 -/
def specSafeRatio (num den : Money) : Money :=
  if den == 0 then 0 else if num ≤ den then num / den else 1

/-- Spec: 配分額（独立定式）。 -/
def specNonSpecificAllocation (pool incomePart totalIncome : Money) : Money :=
  pool * specSafeRatio incomePart totalIncome

-- ==== points (kernel-decided) ====

example : specSafeRatio 3 0 = 0 := by decide
example : specSafeRatio 1 2 = 0 := by decide
example : specSafeRatio 2 2 = 1 := by decide
example : specSafeRatio 5 2 = 1 := by decide
example : specNonSpecificAllocation 100 2 2 = 100 := by decide
example : specNonSpecificAllocation 100 1 2 = 0 := by decide
example : specNonSpecificAllocation 100 3 0 = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeGroupLossRatio : Bool :=
  [ (0, 0), (3, 0), (1, 2), (2, 2), (5, 2), (7, 3), (100, 100), (99, 100) ].all fun (n, d) =>
    safeRatio n d == specSafeRatio n d
  && [ (100, 2, 2), (100, 1, 2), (100, 3, 0), (0, 5, 2), (250, 3, 4) ].all fun (p, i, d) =>
       nonSpecificAllocation p i d == specNonSpecificAllocation p i d

example : agreeGroupLossRatio = true := by decide

end JapanTaxLaw
