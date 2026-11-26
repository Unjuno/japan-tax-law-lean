import JapanTaxLaw.LocalTaxBracket695To900

/-! # LocalTaxBracket695To900 spec — (695万,900万] の独立定式 (law 325AC0000000226 / art.37の2)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracket695To900

def specLowerYen : Nat := 6_950_000
def specUpperYen : Nat := 9_000_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 6_950_000 = false := by decide
example : specInRange 9_000_000 = true := by decide

def agreeLocalTaxBracket695To900 : Bool :=
  [0, 6_949_999, 6_950_000, 6_950_001, 8_999_999, 9_000_000, 9_000_001].all fun x =>
    inRange x == specInRange x

example : agreeLocalTaxBracket695To900 = true := by decide

end JapanTaxLaw.LocalTaxBracket695To900
