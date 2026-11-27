import JapanTaxLaw.SpecialMeasuresBracket50To80M

/-! # SpecialMeasuresBracket50To80M spec — (5000万,8000万] の独立定式 (law 332AC0000000026 / art.87)
原文の二つの金額を境界として再記述する。 -/

namespace JapanTaxLaw.SpecialMeasuresBracket50To80M

def specLowerYen : Nat := 50_000_000
def specUpperYen : Nat := 80_000_000

def specInRange (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInRange 50_000_000 = false := by decide
example : specInRange 80_000_000 = true := by decide

def agreeSpecialMeasuresBracket50To80M : Bool :=
  [0, 49_999_999, 50_000_000, 50_000_001, 79_999_999, 80_000_000, 80_000_001].all fun x =>
    inRange x == specInRange x

example : agreeSpecialMeasuresBracket50To80M = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket50To80M
