import JapanTaxLaw.SpecialMeasuresBracket95To130

/-! # spec — [95万,130万) の独立定式 (law 332AC0000000026 / art.5)
「九十五万円＝95×10000」「百三十万円＝130×10000」として再記述する。 -/

namespace JapanTaxLaw.SpecialMeasuresBracket95To130

def specLowerYen : Nat := 95 * 10000
def specUpperYen : Nat := 130 * 10000

def specInRange (amount : Nat) : Bool :=
  amount >= specLowerYen && amount < specUpperYen

def agreeSpecialMeasuresBracket95To130 : Bool :=
  [0, 949_999, 950_000, 1_000_000, 1_299_999, 1_300_000, 2_000_000].all fun a =>
    inRange a == specInRange a

example : agreeSpecialMeasuresBracket95To130 = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket95To130
