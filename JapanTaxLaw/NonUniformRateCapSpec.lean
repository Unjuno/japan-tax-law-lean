import JapanTaxLaw.NonUniformRateCap

/-!
# NonUniformRateCap spec — 上限 0.05 の独立定式
Sources (pinned): law 505M60000008043, revision 505M60000008043_20240426_506M60000008046.
Independent restatement: cappedRate(r)=min(r,50)。
-/

namespace JapanTaxLaw.NonUniformRateCap

def specCap (r : Nat) : Nat := if r > 50 then 50 else r

example : specCap 30 = 30 := by decide
example : specCap 80 = 50 := by decide

def agreeNonUniformRateCap : Bool :=
  [0, 30, 49, 50, 51, 80].all fun r => cappedRate r == specCap r

example : agreeNonUniformRateCap = true := by decide

end JapanTaxLaw.NonUniformRateCap
