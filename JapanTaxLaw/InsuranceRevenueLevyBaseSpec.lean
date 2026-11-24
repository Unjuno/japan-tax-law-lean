import JapanTaxLaw.InsuranceRevenueLevyBase

/-!
# InsuranceRevenueLevyBase spec — 24% 課税標準の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 分子を先に約分 (x*6/25) する別定式。
-/

namespace JapanTaxLaw.InsuranceRevenueLevyBase

def specBase (x : Nat) : Nat := x * 6 / 25

example : specBase 100 = 24 := by decide
example : specBase 10000 = 2400 := by decide

def agreeInsuranceRevenueLevyBase : Bool :=
  [0, 1, 4, 25, 100, 10000, 1000000].all fun x => levyBase x == specBase x

example : agreeInsuranceRevenueLevyBase = true := by decide

end JapanTaxLaw.InsuranceRevenueLevyBase
