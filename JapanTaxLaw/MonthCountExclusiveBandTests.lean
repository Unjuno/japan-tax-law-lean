import JapanTaxLaw.MonthCountExclusiveBand
import JapanTaxLaw.MonthCountExclusiveBandSpec

/-
# MonthCountExclusiveBandTests — kernel-decided checks for 法人特別税法 第七条

Pinned source: law 404AC0000000015, revision 404AC0000000015_20010401_413AC0000000006,
  data/raw/404AC0000000015_20010401_413AC0000000006.law.json,
  sha256 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8.
Every closed check below is a Nat/Bool expression discharged by `by decide`
(or `by rfl` for the literal equality). Coverage: months 0/1/12/23/24/25/48,
excluded/qualifies complementary pairs, impl/spec agreement at concrete points
plus the universal agreement bridges.
-/

namespace JapanTaxLaw.MonthCountExclusiveBand

-- (a) band value 二十四月 = 24.
example : bandValue = 24 := by decide
example : bandValue = 24 := by rfl

-- (b) zero and small month counts are outside the band -> excluded.
example : excludedByMonthCount 0 = true := by decide
example : excludedByMonthCount 1 = true := by decide
example : excludedByMonthCount 12 = true := by decide

-- (c) boundary of 二十四月 = 24: below / at / above (and a large above value).
example : excludedByMonthCount 23 = true := by decide
example : excludedByMonthCount 24 = false := by decide
example : excludedByMonthCount 25 = true := by decide
example : excludedByMonthCount 48 = true := by decide

-- (d) qualifies is the complement: only exactly 24 months qualifies.
example : qualifiesByMonthCount 24 = true := by decide
example : qualifiesByMonthCount 23 = false := by decide
example : qualifiesByMonthCount 25 = false := by decide
example : qualifiesByMonthCount 0 = false := by decide
example : qualifiesByMonthCount 48 = false := by decide

-- (e) excluded / qualifies are complementary at the boundary points.
example : excludedByMonthCount 23 = !qualifiesByMonthCount 23 := by decide
example : excludedByMonthCount 24 = !qualifiesByMonthCount 24 := by decide
example : excludedByMonthCount 25 = !qualifiesByMonthCount 25 := by decide

-- (f) independent spec spot checks.
example : specBand = 24 := by decide
example : specExcluded 23 = true := by decide
example : specExcluded 24 = false := by decide
example : specExcluded 25 = true := by decide
example : specQualifies 24 = true := by decide
example : specQualifies 23 = false := by decide
example : specQualifies 25 = false := by decide

-- (g) impl/spec agreement at concrete points (kernel-decided).
example : excludedByMonthCount 23 = specExcluded 23 := by decide
example : excludedByMonthCount 24 = specExcluded 24 := by decide
example : excludedByMonthCount 25 = specExcluded 25 := by decide
example : qualifiesByMonthCount 24 = specQualifies 24 := by decide
example : qualifiesByMonthCount 23 = specQualifies 23 := by decide
example : qualifiesByMonthCount 25 = specQualifies 25 := by decide

-- (h) universal kernel-checked bridges (theorem used as proof).
example : bandValue = specBand := agreeBand
example (months : Nat) : excludedByMonthCount months = specExcluded months := agreeExcluded months
example (months : Nat) : qualifiesByMonthCount months = specQualifies months := agreeQualifies months

end JapanTaxLaw.MonthCountExclusiveBand
