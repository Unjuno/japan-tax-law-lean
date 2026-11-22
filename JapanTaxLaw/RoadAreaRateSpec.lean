import JapanTaxLaw.RoadAreaRate

/-!
# RoadAreaRate spec — 補正率表 の独立整数定式
Sources (pinned): law 331M50000002007, revision 331M50000002007_20230401_505M60000008036.
Independent restatement: 率(千分率) = [800,1000,800,1000,4000]、その他 0。
-/

namespace JapanTaxLaw.RoadAreaRate

def specRate (t : Nat) : Nat :=
  if t == 0 then 800 else if t == 1 then 1000 else if t == 2 then 800
  else if t == 3 then 1000 else if t == 4 then 4000 else 0

example : specRate 0 = 800 := by decide
example : specRate 4 = 4000 := by decide
example : specRate 5 = 0 := by decide

def agreeRoadAreaRate : Bool :=
  [0,1,2,3,4,5].all fun t => ratePerMille t == specRate t

example : agreeRoadAreaRate = true := by decide

end JapanTaxLaw.RoadAreaRate
