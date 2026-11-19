import JapanTaxLaw.LegalRatePresentValue

/-!
# LegalRatePresentValue spec — 相続税法施行令 art.12の4 の独立整数定式
Sources (pinned): law 325M50000040017, revision 325M50000040017_20260901_506M60000040016.
Independent restatement: 割合 = 1/(1+r)^n、小数点以下三位を四捨五入
→ per-mille スケールで round(1000 × den^n / (den+num)^n)。
-/

namespace JapanTaxLaw.LegalRatePresentValue

def specPresent (num den n : Nat) : Nat :=
  if n = 0 then 1000 else
    let growth := (den + num) ^ n
    if growth = 0 then 0 else (1000 * den ^ n + growth / 2) / growth

example : specPresent 0 100 0 = 1000 := by decide
example : specPresent 10 100 1 = 909 := by decide
example : specPresent 10 100 2 = 826 := by decide

def agreeLegalRatePresentValue : Bool :=
  [ (0,100,0), (0,100,5), (10,100,1), (10,100,2), (0,10,1), (5,100,3) ].all fun (num, den, n) =>
    presentValuePerMille num den n == specPresent num den n
example : agreeLegalRatePresentValue = true := by decide

end JapanTaxLaw.LegalRatePresentValue
