import JapanTaxLaw.TreatyReportFiveYearRetention

/-
# TreatyReportFiveYearRetentionSpec — 租税条約等特例法 10の8(2) の独立定式

Pinned: law 344AC0000000046, revision 344AC0000000046_20260521_508AC0000000012,
Article 10_8 Paragraph 2; needle 「…年の翌年から五年間、保存しなければならない」.

Independent restatement: retention covers the five calendar years beginning
with the year after the base year. Definitions use their own numerals;
agreement with the implementation is a separate bridge.
-/

namespace JapanTaxLaw.TreatyReportFiveYearRetention

/-- 独立定式: 五 = 5。 -/
def specYears : Nat := 5

/-- 独立定式: 翌年 = +1。 -/
def specNext : Nat := 1

/-- 独立定式: 翌年から五年間。 -/
def specInPeriod (baseYear year : Nat) : Bool :=
  baseYear + specNext <= year && year <= baseYear + specYears

theorem agreeYears : retentionYears = specYears := by
  unfold retentionYears specYears
  rfl

theorem agreeNext : startOffset = specNext := by
  unfold startOffset specNext
  rfl

theorem agreeStart (baseYear : Nat) :
    retentionStartYear baseYear = baseYear + specNext := by
  unfold retentionStartYear
  rw [agreeNext]

theorem agreePeriod (baseYear year : Nat) :
    withinRetentionPeriod baseYear year = specInPeriod baseYear year := by
  unfold withinRetentionPeriod specInPeriod
  rw [agreeStart, agreeYears]

example : specInPeriod 2020 2021 = true := by decide
example : specInPeriod 2020 2025 = true := by decide
example : specInPeriod 2020 2026 = false := by decide

end JapanTaxLaw.TreatyReportFiveYearRetention
