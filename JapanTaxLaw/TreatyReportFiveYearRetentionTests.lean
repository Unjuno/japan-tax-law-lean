import JapanTaxLaw.TreatyReportFiveYearRetention
import JapanTaxLaw.TreatyReportFiveYearRetentionSpec

/-
# TreatyReportFiveYearRetentionTests — 租税条約等特例法 10の8(2) の kernel-decided 検証

Pinned: law 344AC0000000046 / revision 344AC0000000046_20260521_508AC0000000012.
Coverage: 五=5, 翌年=+1, start year, window boundaries, impl/spec agreement.
-/

namespace JapanTaxLaw.TreatyReportFiveYearRetention

example : retentionYears = 5 := by decide
example : startOffset = 1 := by decide
example : retentionStartYear 2020 = 2021 := by decide

-- 保存期間境界
example : withinRetentionPeriod 2020 2020 = false := by decide
example : withinRetentionPeriod 2020 2021 = true := by decide
example : withinRetentionPeriod 2020 2023 = true := by decide
example : withinRetentionPeriod 2020 2025 = true := by decide
example : withinRetentionPeriod 2020 2026 = false := by decide

-- impl / 独立仕様の一致
example : retentionYears = specYears := by decide
example : startOffset = specNext := by decide
example : retentionStartYear 2020 = 2020 + specNext := by decide
example : withinRetentionPeriod 2020 2020 = specInPeriod 2020 2020 := by decide
example : withinRetentionPeriod 2020 2021 = specInPeriod 2020 2021 := by decide
example : withinRetentionPeriod 2020 2025 = specInPeriod 2020 2025 := by decide
example : withinRetentionPeriod 2020 2026 = specInPeriod 2020 2026 := by decide

end JapanTaxLaw.TreatyReportFiveYearRetention
