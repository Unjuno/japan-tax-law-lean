import JapanTaxLaw.RoadAreaRate

/-!
# RoadAreaRate tests — 道路面積補正率 smoke checks
Decidable smoke tests, pinned to law 331M50000002007 / revision 331M50000002007_20230401_505M60000008036.
率: 800/1000/800/1000/4000, その他 0。
-/

namespace JapanTaxLaw.RoadAreaRate

example : ratePerMille 0 = 800 := by decide
example : ratePerMille 1 = 1000 := by decide
example : ratePerMille 2 = 800 := by decide
example : ratePerMille 3 = 1000 := by decide
example : ratePerMille 4 = 4000 := by decide
example : ratePerMille 5 = 0 := by decide

end JapanTaxLaw.RoadAreaRate
