/-!
# FiscalPeriodSixMonthSplit — 332CO0000000043 art.27_12_5（六月の分岐）

Pinned source: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
source_path (unit A): .../Paragraph#8/Item#2/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1
原文A（15文字）:「当該前事業年度が六月に満たない場合」
source_path (unit B): .../Paragraph#8/Item#2/Subitem1#2/Subitem1Sentence/Column#1/Sentence#1
原文B（15文字）:「当該前事業年度が六月以上である場合」

二つの規範単位は同じ量（前事業年度の月数、Nat, caller-established）について
互いに排他的かつ網羅的な分岐を形成する。「満たない」は < 6、「以上」は >= 6。
-/
namespace JapanTaxLaw.FiscalPeriodSixMonthSplit

/-- 原文「六月」。境界（月）。 -/
def sixMonths : Nat := 6

/-- 原文A: 六月に満たない。 -/
def isUnderSixMonths (months : Nat) : Bool :=
  decide (months < sixMonths)

/-- 原文B: 六月以上。 -/
def isSixMonthsOrMore (months : Nat) : Bool :=
  decide (sixMonths <= months)

theorem under_at_five : isUnderSixMonths 5 = true := by decide
theorem under_at_six : isUnderSixMonths 6 = false := by decide
theorem more_at_six : isSixMonthsOrMore 6 = true := by decide
theorem more_at_five : isSixMonthsOrMore 5 = false := by decide

/-- 排他性: 二つの分岐は同時に成立しない。 -/
theorem exclusive (months : Nat) :
    ¬ (isUnderSixMonths months = true ∧ isSixMonthsOrMore months = true) := by
  by_cases h : months < sixMonths
  · have hnot : ¬ sixMonths <= months := Nat.not_le_of_gt h
    simp [isUnderSixMonths, isSixMonthsOrMore, h, hnot]
  · have hle : sixMonths <= months := Nat.le_of_not_lt h
    simp [isUnderSixMonths, isSixMonthsOrMore, h, hle]

/-- 網羅性: いずれか一方は必ず成立する。 -/
theorem exhaustive (months : Nat) :
    isUnderSixMonths months = true ∨ isSixMonthsOrMore months = true := by
  by_cases h : months < sixMonths
  · simp [isUnderSixMonths, h]
  · have hle : sixMonths <= months := Nat.le_of_not_lt h
    simp [isSixMonthsOrMore, hle]

end JapanTaxLaw.FiscalPeriodSixMonthSplit
