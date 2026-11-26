import Std
import JapanTaxLaw.TaxFinance

/-
# DefenseCorpShortfallSum — 防衛特別法人税に関する政令 第三条 第六項 第一号
（他の通算法人の調整前控除限度額が零を下回る場合の下回る額の合計額）

Pinned sources:
  Law id: 507CO0000000134 (防衛特別法人税に関する政令)
  Revision: 507CO0000000134_20260401_508CO0000000105 (enforced 2026-04-01)
  Raw snapshot: data/raw/507CO0000000134_20260401_508CO0000000105.law.json
  Article Num 3, Paragraph Num 6, Item Num 1, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#6/Item#1/ItemSentence/Sentence#1
  Normative unit: NORM|a87fb62436e3595c95e3cab44db50070d76d7e0c5dfa8da394768727922e38ed

Verbatim 原文 needle (scoped to Article 3 Paragraph 6 Item 1):
  「他の通算法人の他の課税事業年度の調整前控除限度額が零を下回る場合のその下回る額の合計額」

Variable contract:
  balances = 他の通算法人の他の課税事業年度の調整前控除限度額 (signed, caller-established, 円)
  floor    = 零 = 0 (原文「下回る」は strict)
  shortfallSum = Σ max(0, −bᵢ) over balances strictly below 0.
  Equality at 零 contributes 0; positive balances contribute 0.

Scope: ONLY this strict-zero shortfall aggregation. Item 2 (positive-part sum),
第四項 ratio multiplication, the calculation of 調整前控除限度額, consolidation
membership and taxable-year selection are NOT MODELLED. The clause states no
rounding rule; inputs are caller-established whole yen. No floor is introduced
for balances that are exactly 零 — 「下回る」 is strict.
-/

namespace JapanTaxLaw.DefenseCorpShortfallSum

/-- 原文の「零」= 0（strict 境界）。 -/
def statutoryFloor : Int := 0

/-- 一つの調整前控除限度額の下回る額（零未満のみ厳密に寄与）。 -/
def shortfall (balance : Int) : Nat :=
  if balance < statutoryFloor then Int.toNat (-balance) else 0

/-- 合計額（呼出側が与えたリストに対する有限和）。 -/
def shortfallSum : List Int → Nat
  | [] => 0
  | b :: bs => shortfall b + shortfallSum bs

theorem floor_is_zero : statutoryFloor = 0 := rfl

/-- 零丁度と正の額は寄与しない。 -/
theorem zero_not_below : shortfall 0 = 0 := by decide
theorem positive_not_below : shortfall 1 = 0 := by decide

/-- 零未満はその絶対値だけ寄与。 -/
theorem negative_contributes : shortfall (-1) = 1 := by decide
theorem larger_negative_contributes : shortfall (-5) = 5 := by decide

/-- 厳密境界: -1 / 0 / +1。 -/
theorem strict_boundary_below : shortfall (-1) = 1 := by decide
theorem strict_boundary_at : shortfall 0 = 0 := by decide
theorem strict_boundary_above : shortfall 1 = 0 := by decide

/-- 合計例。 -/
theorem sum_example : shortfallSum [-1, 0, 2, -3] = 4 := by decide
theorem sum_empty : shortfallSum [] = 0 := by decide
theorem sum_all_positive : shortfallSum [0, 1, 2] = 0 := by decide

end JapanTaxLaw.DefenseCorpShortfallSum
