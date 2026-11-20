import JapanTaxLaw.GolfCourseUseRate

/-! Kernel-decided smoke checks. -/

namespace JapanTaxLaw.GolfCourseUseRate

example : golfCourseUseRate = 800 := by decide
example : golfCourseUseRate > 0 := by decide
example : golfCourseUseRate ≠ 8000 := by decide

end JapanTaxLaw.GolfCourseUseRate
