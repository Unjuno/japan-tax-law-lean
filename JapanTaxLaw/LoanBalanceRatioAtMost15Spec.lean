import JapanTaxLaw.LoanBalanceRatioAtMost15

/-! # LoanBalanceRatioAtMost15 spec — 15%以下の独立定式 (law 340CO0000000096 / art.73)
「百分の十五」を 15/100 とし、「以下」を `100*r <= 15*100` で判定する。 -/

namespace JapanTaxLaw.LoanBalanceRatioAtMost15

def specThresholdNum : Nat := 15
def specRateDen : Nat := 100

def specAtMost15 (rate : Nat) : Bool :=
  specRateDen * rate <= specThresholdNum * specRateDen

example : specAtMost15 15 = true := by decide
example : specAtMost15 16 = false := by decide

def agreeLoanBalanceRatioAtMost15 : Bool :=
  [0, 14, 15, 16, 50, 100].all fun r => atMost15 r == specAtMost15 r

example : agreeLoanBalanceRatioAtMost15 = true := by decide

end JapanTaxLaw.LoanBalanceRatioAtMost15
