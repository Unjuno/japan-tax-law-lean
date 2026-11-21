import JapanTaxLaw.ContainerSpec

/-!
# ContainerSpec spec — 大型コンテナ寸法 の独立整数定式
Sources (pinned): law 329CO0000000155, revision 329CO0000000155_20260401_508CO0000000085.
Independent restatement: 幅・高さ >=24、長さ >=29（1/10m 単位）。
-/

namespace JapanTaxLaw.ContainerSpec

def specMeets (w h l : Nat) : Bool := w >= 24 && h >= 24 && l >= 29

example : specMeets 24 24 29 = true := by decide
example : specMeets 23 24 29 = false := by decide

def agreeContainerSpec : Bool :=
  [ (0,0,0), (24,24,29), (23,24,29), (24,23,29), (24,24,28), (30,25,120) ].all fun (w,h,l) =>
    meetsDimensions w h l == specMeets w h l

example : agreeContainerSpec = true := by decide

end JapanTaxLaw.ContainerSpec
