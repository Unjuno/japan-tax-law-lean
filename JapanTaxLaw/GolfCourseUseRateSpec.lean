import JapanTaxLaw.GolfCourseUseRate

/-! Independent restatement: bare Nat literal re-derived from 原文「八百円」。 -/

namespace JapanTaxLaw.GolfCourseUseRate

def specRate : Nat := 800

example : specRate = 800 := by decide

def agreeGolfCourseUseRate : Bool := golfCourseUseRate == specRate

example : agreeGolfCourseUseRate = true := by decide

end JapanTaxLaw.GolfCourseUseRate
