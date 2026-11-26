import JapanTaxLaw.GiftTaxTenYearResidenceLookback

/-!
# GiftTaxTenYearResidenceLookback spec — 十年以内の独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: 「十年を超えない」を否定形 `!(specLookback < years)`
として書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.GiftTaxTenYearResidenceLookback

def specLookback : Nat := 10

def specWithin (years : Nat) : Bool := ! (specLookback < years)

example : specWithin 10 = true := by decide
example : specWithin 11 = false := by decide

def agreeGiftTaxTenYearResidenceLookback : Bool :=
  [0, 1, 9, 10, 11, 12, 20].all (fun y =>
    withinLookback y == specWithin y)

example : agreeGiftTaxTenYearResidenceLookback = true := by decide

end JapanTaxLaw.GiftTaxTenYearResidenceLookback
