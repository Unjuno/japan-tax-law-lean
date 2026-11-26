import Std
import JapanTaxLaw.TaxFinance

/-
# OneYearConstructionStartWindow — 半島振興法施行令 第四条 第一項 第二号（土地の一年以内建設着手）
（認定日以後に取得した土地のうち、取得の日の翌日から一年以内に家屋建設の着手があった土地）

Pinned sources:
  Law id: 407M50000008012
  Revision: 407M50000008012_20050401_417M60000008064 (enforced 2005-04-01)
  Raw snapshot: data/raw/407M50000008012_20050401_417M60000008064.law.json
  Article Num 4, Paragraph 1, Item 2 (固定資産税), Column 2, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/Item#2/ItemSentence/Column#2/Sentence
  Normative unit: NORM|6f001d2be026eeca13a11d9b350533f70b9d500984a5698d109d12e7fabfe544

Verbatim 原文 needle (scoped to Article 4 Item 2):
  「土地については、その取得の日の翌日から起算して一年以内に当該土地を敷地とする当該家屋の建設の着手があった場合における当該土地に限る。」

Variable contract (day indices from a caller-established epoch):
  recognDay   = 認定日 (caller-established)
  acqDay      = 土地の取得の日 (caller-established)
  startDay    = 家屋建設の着手の日 (caller-established)
  oneYearDays = caller-established conversion of 一年 to days (the statute
                fixes the year count 一 but not a calendar-to-day rule)
  eligibleLand recognDay acqDay startDay oneYearDays =
      recognDay <= acqDay ∧ acqDay < startDay ∧ startDay <= acqDay + oneYearDays

「翌日から」 is a STRICT lower bound (start on acquisition day fails);
「一年以内」 is an INCLUSIVE upper bound.

Scope: ONLY this two-sided land window predicate. The legal determination of
認定日, 対象設備/家屋/償却資産/対象設備設置者 definitions, the 不均一課税 rate,
base and assessment, sibling item 1 (事業税), other articles/laws and calendar
leap-year arithmetic are NOT MODELLED. No legal review is asserted.
-/

namespace JapanTaxLaw.OneYearConstructionStartWindow

/-- 原文の「一」= 1 年（年数は原文固定、日数変換は caller-established）。 -/
def yearCount : Nat := 1

/-- 認定日後取得・翌日以降・一年以内の建設着手か。 -/
def eligibleLand (recognDay : Nat) (acqDay : Nat) (startDay : Nat) (oneYearDays : Nat) : Bool :=
  recognDay <= acqDay && acqDay < startDay && startDay <= acqDay + oneYearDays

theorem year_count_is_one : yearCount = 1 := rfl

-- 境界: 着手が取得日 / 翌日 / 一年目 / 一年超
theorem start_on_acquisition_day : eligibleLand 0 10 10 365 = false := by decide
theorem start_next_day : eligibleLand 0 10 11 365 = true := by decide
theorem start_at_one_year : eligibleLand 0 10 375 365 = true := by decide
theorem start_beyond_one_year : eligibleLand 0 10 376 365 = false := by decide

-- 認定日より前の取得は対象外
theorem acquired_before_certification : eligibleLand 10 9 100 365 = false := by decide

end JapanTaxLaw.OneYearConstructionStartWindow
