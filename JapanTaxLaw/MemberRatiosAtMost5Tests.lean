import JapanTaxLaw.MemberRatiosAtMost5

/-! # MemberRatiosAtMost5 tests — 5%境界 (law 340CO0000000097 / art.155の32) -/

namespace JapanTaxLaw.MemberRatiosAtMost5

example : bothAtMost5 0 0 = true := by decide
example : bothAtMost5 4 5 = true := by decide
example : bothAtMost5 5 5 = true := by decide
example : bothAtMost5 5 6 = false := by decide
example : bothAtMost5 6 5 = false := by decide
example : bothAtMost5 6 6 = false := by decide
example : bothAtMost5 100 100 = false := by decide

end JapanTaxLaw.MemberRatiosAtMost5
