import JapanTaxLaw.LocalTaxBracket900To1800

/-! # LocalTaxBracket900To1800 spec — (900万,1800万] の独立定式 (law 325AC0000000226 / art.37の2)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracket900To1800

def specLowerYen : Nat := 9_000_000
def specUpperYen : Nat := 18_000_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 9_000_000 = false := by decide
example : specInRange 18_000_000 = true := by decide

def agreeLocalTaxBracket900To1800 : Bool :=
  [0, 8_999_999, 9_000_000, 9_000_001, 17_999_999, 18_000_000, 18_000_001].all fun x =>
    inRange x == specInRange x

example : agreeLocalTaxBracket900To1800 = true := by decide

end JapanTaxLaw.LocalTaxBracket900To1800
