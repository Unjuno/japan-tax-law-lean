import JapanTaxLaw.SpecialUseExemption

/-!
# SpecialUseExemption spec — 特定用途 の独立定式
Sources (pinned): law 341CO0000000005, revision 341CO0000000005_20250401_507CO0000000006.
Independent restatement: 指定用途 = {原料用(0), 熱源用(1)}、その他(2) は対象外。
-/

namespace JapanTaxLaw.SpecialUseExemption

def specUse (u : Nat) : Bool := u == 0 || u == 1

example : specUse 0 = true := by decide
example : specUse 2 = false := by decide

def agreeSpecialUseExemption : Bool :=
  [0, 1, 2, 3].all fun u => isSpecifiedUse u == specUse u

example : agreeSpecialUseExemption = true := by decide

end JapanTaxLaw.SpecialUseExemption
