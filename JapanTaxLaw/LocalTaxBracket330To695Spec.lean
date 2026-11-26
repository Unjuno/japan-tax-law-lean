import JapanTaxLaw.LocalTaxBracket330To695

/-! # LocalTaxBracket330To695 spec — (330万,695万] の独立定式 (law 325AC0000000226 / art.37の2)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracket330To695

def specLowerYen : Nat := 3_300_000
def specUpperYen : Nat := 6_950_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 3_300_000 = false := by decide
example : specInRange 6_950_000 = true := by decide

def agreeLocalTaxBracket330To695 : Bool :=
  [0, 3_299_999, 3_300_000, 3_300_001, 6_949_999, 6_950_000, 6_950_001].all fun x =>
    inRange x == specInRange x

example : agreeLocalTaxBracket330To695 = true := by decide

end JapanTaxLaw.LocalTaxBracket330To695
