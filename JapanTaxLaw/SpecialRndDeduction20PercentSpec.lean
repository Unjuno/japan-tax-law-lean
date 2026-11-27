import JapanTaxLaw.SpecialRndDeduction20Percent

/-! # SpecialRndDeduction20Percent spec — 20%算定の独立定式 (law 332AC0000000026 / art.10の2)
切り捨て符合要求 `100*amount <= 20*base < 100*(amount+1)` で再記述する。 -/

namespace JapanTaxLaw.SpecialRndDeduction20Percent

def specPercentNum : Nat := 20
def specRateDen : Nat := 100

def specAgrees (base : Nat) : Bool :=
  specRateDen * amount base <= specPercentNum * base &&
  specPercentNum * base < specRateDen * (amount base + 1)

example : specAgrees 100 = true := by decide
example : specAgrees 1_000 = true := by decide

def agreeSpecialRndDeduction20Percent : Bool :=
  [0, 1, 99, 100, 101, 1_000, 10_001].all specAgrees

example : agreeSpecialRndDeduction20Percent = true := by decide

end JapanTaxLaw.SpecialRndDeduction20Percent
