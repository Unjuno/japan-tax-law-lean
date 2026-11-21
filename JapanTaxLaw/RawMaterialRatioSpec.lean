import JapanTaxLaw.RawMaterialRatio

/-!
# RawMaterialRatio spec — 関税定率法施行規則 art.1の2 の独立整数定式
Sources (pinned): law 344M50000040016, revision 344M50000040016_20260401_508M60000040016.
Independent restatement: 60% = ×60÷100。
-/

namespace JapanTaxLaw.RawMaterialRatio

def specThreshold (v : Nat) : Nat := v * 60 / 100

example : specThreshold 100 = 60 := by decide
example : specThreshold 1000 = 600 := by decide

def agreeRawMaterialRatio : Bool :=
  [0, 1, 50, 100, 101, 1000, 10000].all fun v => thresholdYen v == specThreshold v

example : agreeRawMaterialRatio = true := by decide

end JapanTaxLaw.RawMaterialRatio
