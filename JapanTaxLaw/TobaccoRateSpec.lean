import JapanTaxLaw.TobaccoRate

/-!
# TobaccoRate spec — たばこ税法 art.11 の独立整数定式
Sources (pinned): law 359AC0000000072, revision 359AC0000000072_20260525_506AC0000000052.
Independent restatement: 税額 = 6802 × 千本数。
-/

namespace JapanTaxLaw.TobaccoRate

def specRate : Nat := 6802

def specTax (n : Nat) : Nat := 6802 * n

example : specRate = 6802 := by decide
example : specTax 10 = 68020 := by decide

def agreeTobaccoRate : Bool :=
  [0, 1, 2, 5, 10, 100].all fun n => tobaccoTaxYen n == specTax n

example : agreeTobaccoRate = true := by decide

end JapanTaxLaw.TobaccoRate
