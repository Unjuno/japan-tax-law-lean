import JapanTaxLaw.LocalTaxBracket195To330

/-! # LocalTaxBracket195To330 spec — (195万,330万] の独立定式 (law 325AC0000000226 / art.37の2)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracket195To330

def specLowerYen : Nat := 1_950_000
def specUpperYen : Nat := 3_300_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 1_950_000 = false := by decide
example : specInRange 3_300_000 = true := by decide

def agreeLocalTaxBracket195To330 : Bool :=
  [0, 1_949_999, 1_950_000, 1_950_001, 3_299_999, 3_300_000, 3_300_001].all fun x =>
    inRange x == specInRange x

example : agreeLocalTaxBracket195To330 = true := by decide

end JapanTaxLaw.LocalTaxBracket195To330
