import JapanTaxLaw.LocalTaxBracket1800To4000

/-! # LocalTaxBracket1800To4000 spec — (1800万,4000万] の独立定式 (law 325AC0000000226 / art.37の2)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracket1800To4000

def specLowerYen : Nat := 18_000_000
def specUpperYen : Nat := 40_000_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 18_000_000 = false := by decide
example : specInRange 40_000_000 = true := by decide

def agreeLocalTaxBracket1800To4000 : Bool :=
  [0, 17_999_999, 18_000_000, 18_000_001, 39_999_999, 40_000_000, 40_000_001].all fun x =>
    inRange x == specInRange x

example : agreeLocalTaxBracket1800To4000 = true := by decide

end JapanTaxLaw.LocalTaxBracket1800To4000
