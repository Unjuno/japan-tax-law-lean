import JapanTaxLaw.CorporateAssetFivePercent

/-! # CorporateAssetFivePercent spec — 5%算定の独立定式 (law 340CO0000000097 / art.155の8)
切り捨て符合要求 `100*amount <= 5*base < 100*(amount+1)` で再記述する。 -/

namespace JapanTaxLaw.CorporateAssetFivePercent

def specPercentNum : Nat := 5
def specRateDen : Nat := 100

def specAgrees (base : Nat) : Bool :=
  specRateDen * amount base <= specPercentNum * base &&
  specPercentNum * base < specRateDen * (amount base + 1)

example : specAgrees 100 = true := by decide
example : specAgrees 1_000 = true := by decide

def agreeCorporateAssetFivePercent : Bool :=
  [0, 1, 99, 100, 101, 1_000, 10_001].all specAgrees

example : agreeCorporateAssetFivePercent = true := by decide

end JapanTaxLaw.CorporateAssetFivePercent
