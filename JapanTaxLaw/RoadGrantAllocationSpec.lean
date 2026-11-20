import JapanTaxLaw.RoadGrantAllocation

/-!
# RoadGrantAllocation spec — 地方税等減収補てん臨時交付金政令 art.5 の独立整数定式
Sources (pinned): law 420AC0000000084, revision 420AC0000000084_20081022_000000000000000.
Independent restatement: 総額 = 4,595,000,000、按分 = 総額×基準額/合計（分母0→0）。
-/

namespace JapanTaxLaw.RoadGrantAllocation

def specAllocation (entityBasis totalBasis : Nat) : Nat :=
  if totalBasis = 0 then 0 else 4_595_000_000 * entityBasis / totalBasis

example : specAllocation 3 10 = 1_378_500_000 := by decide
example : specAllocation 5 0 = 0 := by decide

def agreeRoadGrantAllocation : Bool :=
  [ (1,10), (3,10), (10,10), (5,0), (0,10), (7,13) ].all fun (e, t) =>
    allocation e t == specAllocation e t
example : agreeRoadGrantAllocation = true := by decide

end JapanTaxLaw.RoadGrantAllocation
