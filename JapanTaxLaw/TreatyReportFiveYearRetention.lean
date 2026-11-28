import Std
import JapanTaxLaw.TaxFinance

/-
# TreatyReportFiveYearRetention — 租税条約等の実施に伴う特別措置に関する法律 第十条の八 第二項
（記録を契約終了日の属する年の翌年から五年間保存）

Pinned sources:
  Law id: 344AC0000000046 (租税条約等の実施に伴う特別措置に関する法律)
  Revision: 344AC0000000046_20260521_508AC0000000012 (enforced 2026-05-21)
  Raw snapshot: data/raw/344AC0000000046_20260521_508AC0000000012.law.json
  Article 10_8, Paragraph 2, ParagraphSentence, Sentence 1.
  Normative unit: NORM|4115455fc928d848273bd4983b436393181f8e689add99acda21203c3caec6fe

Verbatim 原文 needle (scoped Article 10_8, 369 chars):
  「報告金融機関等は、前項の規定により作成した記録を、当該記録に係る特定取引に係る契約が終了した日その他の総務省令、財務省令で定める日の属する年の翌年から五年間、保存しなければならない。」

Variable contract (calendar years; caller establishes the base year):
  baseYear      = 契約終了日（または省令で定める日）の属する年
  retentionYears = 五 = 5
  startOffset   = 1（「翌年」）
  retentionStartYear baseYear = baseYear + 1
  withinRetentionPeriod baseYear t =
      baseYear + 1 <= t && t <= baseYear + 5

Out of scope: who is a 報告金融機関等, 特定取引/契約終了日 determination, the
ministerially specified alternative date and record items, paragraph 1's
creation duty, penalties, other paragraphs/articles and legal effects.
No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.TreatyReportFiveYearRetention

/-- 原文の「五」= 5（年）。 -/
def retentionYears : Nat := 5

/-- 原文の「翌年」= +1。 -/
def startOffset : Nat := 1

/-- 保存期間の初年。 -/
def retentionStartYear (baseYear : Nat) : Nat :=
  baseYear + startOffset

/-- 保存期間（翌年から五年間、両端含む）。 -/
def withinRetentionPeriod (baseYear year : Nat) : Bool :=
  retentionStartYear baseYear <= year && year <= baseYear + retentionYears

theorem years_is_five : retentionYears = 5 := rfl
theorem start_is_next_year : startOffset = 1 := rfl
theorem start_2020 : retentionStartYear 2020 = 2021 := by decide

-- 境界: baseYear+1 .. baseYear+5 true、baseYear / baseYear+6 false
theorem at_base_year : withinRetentionPeriod 2020 2020 = false := by decide
theorem first_year : withinRetentionPeriod 2020 2021 = true := by decide
theorem middle_year : withinRetentionPeriod 2020 2023 = true := by decide
theorem last_year : withinRetentionPeriod 2020 2025 = true := by decide
theorem after_period : withinRetentionPeriod 2020 2026 = false := by decide

end JapanTaxLaw.TreatyReportFiveYearRetention
