import JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent

/-!
# LocalTaxInsuranceBusinessBase24Percent spec — 24/100 の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 同じ比率を「分子24・分母100の組」として保持し、
計算を `p * n / d` ではなく `p / d * n + (p % d) * n / d` に分解して書く。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent

def specNum : Nat := 24

def specDen : Nat := 100

def specBase (premium : Nat) : Nat :=
  premium / specDen * specNum + (premium % specDen) * specNum / specDen

example : specBase 24 = 5 := by decide
example : specBase 100 = 24 := by decide
example : specBase 101 = 24 := by decide

def agreeLocalTaxInsuranceBusinessBase24Percent : Bool :=
  [0, 1, 23, 24, 25, 99, 100, 101, 1000].all (fun p =>
    businessBase p == specBase p)

example : agreeLocalTaxInsuranceBusinessBase24Percent = true := by decide

end JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent
