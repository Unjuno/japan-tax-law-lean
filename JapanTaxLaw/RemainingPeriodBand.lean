/-!
# RemainingPeriodBand — 325AC0000000073 art.23（残存期間の帯）

Pinned source: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
source_path: LawBody[3]/MainProvision/MainProvision[2]/Article:23/Article#23/Paragraph#1/List/ListSentence/Column#1/Sentence#1
原文（16文字, 独立抽出で照合）:「残存期間が十年を超え十五年以下のもの」

規範単位（CONDITION / 期間）: 残存期間（年、Nat、caller-established）が
10年を超え15年以下であること。下限は排他（超え）、上限は包含（以下）。
評価方法・端数処理・他の帯は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.RemainingPeriodBand

/-- 原文「十年」: 下限（排他）。 -/
def lowerExclusiveYears : Nat := 10

/-- 原文「十五年」: 上限（包含）。 -/
def upperInclusiveYears : Nat := 15

/-- 原文の帯条件。 -/
def inBand (years : Nat) : Bool :=
  decide (lowerExclusiveYears < years && years <= upperInclusiveYears)

theorem rejects_ten : inBand 10 = false := by decide
theorem accepts_eleven : inBand 11 = true := by decide
theorem accepts_fifteen : inBand 15 = true := by decide
theorem rejects_sixteen : inBand 16 = false := by decide

/-- 一般命題: 原文の不等式と同値。 -/
theorem inBand_iff (y : Nat) :
    inBand y = true ↔ lowerExclusiveYears < y ∧ y <= upperInclusiveYears := by
  by_cases h1 : lowerExclusiveYears < y <;> by_cases h2 : y <= upperInclusiveYears <;>
    simp [inBand, h1, h2]

end JapanTaxLaw.RemainingPeriodBand
