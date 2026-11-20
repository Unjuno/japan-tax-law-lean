/-!
# MiningTaxLevyDate — 325AC0000000226 art.181（鉱区税の賦課期日）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
source_path: LawBody[2]/MainProvision/MainProvision[1]/Article:181/Article#181/Paragraph#1/ParagraphSentence/Sentence#1
原文（18文字, 独立抽出で照合）:「鉱区税の賦課期日は、四月一日とする。」

規範単位（EFFECT / 時間的適用）: 鉱区税の賦課期日を 4月1日 と定める。
  - month: 月（1..12）、day: 日（1..31）、単位: 日付、caller-established。
  - 閏年・暦の扱い・賦課期日以外の手続は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.MiningTaxLevyDate

/-- 原文「四月」。 -/
def levyMonth : Nat := 4

/-- 原文「一日」。 -/
def levyDay : Nat := 1

/-- 原文の賦課期日判定。 -/
def isLevyDate (month : Nat) (day : Nat) : Bool :=
  decide (month == levyMonth && day == levyDay)

theorem levyMonth_eq : levyMonth = 4 := by decide
theorem levyDay_eq : levyDay = 1 := by decide

theorem accepts_april_first : isLevyDate 4 1 = true := by decide
theorem rejects_april_second : isLevyDate 4 2 = false := by decide
theorem rejects_march_first : isLevyDate 3 1 = false := by decide

/-- 一般命題: 判定は原文の月日と同値。 -/
theorem isLevyDate_iff (m d : Nat) :
    isLevyDate m d = true ↔ m = levyMonth ∧ d = levyDay := by
  by_cases hm : m = levyMonth <;> by_cases hd : d = levyDay <;>
    simp [isLevyDate, hm, hd]

end JapanTaxLaw.MiningTaxLevyDate
