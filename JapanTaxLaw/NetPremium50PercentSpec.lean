import JapanTaxLaw.NetPremium50Percent

/-! # NetPremium50Percent spec — 50%算定の独立定式 (law 332CO0000000043 / art.33の3)
切り捨て符合要求 `100*amount <= 50*base < 100*(amount+1)` で再記述する。 -/

namespace JapanTaxLaw.NetPremium50Percent

def specPercentNum : Nat := 50
def specRateDen : Nat := 100

def specAgrees (base : Nat) : Bool :=
  specRateDen * amount base <= specPercentNum * base &&
  specPercentNum * base < specRateDen * (amount base + 1)

example : specAgrees 100 = true := by decide
example : specAgrees 1_000 = true := by decide

def agreeNetPremium50Percent : Bool :=
  [0, 1, 99, 100, 101, 1_000, 10_001].all specAgrees

example : agreeNetPremium50Percent = true := by decide

end JapanTaxLaw.NetPremium50Percent
