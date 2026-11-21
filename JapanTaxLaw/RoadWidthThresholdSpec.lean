import JapanTaxLaw.RoadWidthThreshold

/-!
# RoadWidthThreshold spec — 石油ガス譲与税法施行規則 art.1 の独立整数定式
Sources (pinned): law 341M50000008002, revision 341M50000008002_20191128_501M60000008059.
Independent restatement: 幅員 2.5m 未満 = width<25（1/10m 単位、厳密）。
-/

namespace JapanTaxLaw.RoadWidthThreshold

def specNarrow (w : Nat) : Bool := w < 25

example : specNarrow 24 = true := by decide
example : specNarrow 25 = false := by decide

def agreeRoadWidthThreshold : Bool :=
  [0, 1, 24, 25, 26, 100].all fun w => isNarrowRoad w == specNarrow w

example : agreeRoadWidthThreshold = true := by decide

end JapanTaxLaw.RoadWidthThreshold
