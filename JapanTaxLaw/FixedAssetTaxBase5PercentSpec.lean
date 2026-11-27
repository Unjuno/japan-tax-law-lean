import JapanTaxLaw.FixedAssetTaxBase5Percent

/-! # FixedAssetTaxBase5Percent spec — 5%算定の独立定式 (law 325CO0000000245 / art.15)
交差乗算による境界一致 `100*amount == 5*base` を実装の切り捨てと比較する。 -/

namespace JapanTaxLaw.FixedAssetTaxBase5Percent

def specPercentNum : Nat := 5
def specRateDen : Nat := 100

def specAgrees (base : Nat) : Bool :=
  specRateDen * amount base <= specPercentNum * base &&
  specPercentNum * base < specRateDen * (amount base + 1)

example : specAgrees 100 = true := by decide
example : specAgrees 1_000 = true := by decide

def agreeFixedAssetTaxBase5Percent : Bool :=
  [0, 1, 99, 100, 101, 1_000, 10_001].all specAgrees

example : agreeFixedAssetTaxBase5Percent = true := by decide

end JapanTaxLaw.FixedAssetTaxBase5Percent
