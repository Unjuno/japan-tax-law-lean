import JapanTaxLaw.PrivateFundRate20To15

/-! # PrivateFundRate20To15 spec — 20→15 置換の独立定式 (law 332AC0000000026 / art.8の2)
分母100を揃えた比較 `100*r == 20*100` で置換条件を再記述する。 -/

namespace JapanTaxLaw.PrivateFundRate20To15

def specSourceNum : Nat := 20
def specReplacementNum : Nat := 15
def specRateDen : Nat := 100

def specReadRate (rate : Nat) : Nat :=
  if specRateDen * rate == specSourceNum * specRateDen then specReplacementNum else rate

example : specReadRate 20 = 15 := by decide
example : specReadRate 25 = 25 := by decide

def agreePrivateFundRate20To15 : Bool :=
  [0, 10, 19, 20, 21, 25, 100].all fun r => readRate r == specReadRate r

example : agreePrivateFundRate20To15 = true := by decide

end JapanTaxLaw.PrivateFundRate20To15
