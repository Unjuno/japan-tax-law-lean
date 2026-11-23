import JapanTaxLaw.RiceContentThreshold

/-!
# RiceContentThreshold tests — 米含有量閾値 smoke checks
Decidable smoke tests, pinned to law 344M50000040039 / revision 344M50000040039_20241215_505M60000040057.
30% 厳密超え: 30/100 は対象外、31/100 は対象。
-/

namespace JapanTaxLaw.RiceContentThreshold

example : exceedsRiceThreshold 30 100 = false := by decide
example : exceedsRiceThreshold 31 100 = true := by decide
example : exceedsRiceThreshold 60 200 = false := by decide
example : exceedsRiceThreshold 61 200 = true := by decide

end JapanTaxLaw.RiceContentThreshold
