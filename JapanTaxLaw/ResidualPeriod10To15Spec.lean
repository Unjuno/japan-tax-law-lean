import JapanTaxLaw.ResidualPeriod10To15

/-! # ResidualPeriod10To15 spec — (10,15] 区間の独立定式 (law 325AC0000000073 / art.23)
原文の二つの年数を境界として再記述する。 -/

namespace JapanTaxLaw.ResidualPeriod10To15

def specLowerYears : Nat := 10
def specUpperYears : Nat := 15

def specInRange (years : Nat) : Bool :=
  years > specLowerYears && years <= specUpperYears

example : specInRange 10 = false := by decide
example : specInRange 15 = true := by decide

def agreeResidualPeriod10To15 : Bool :=
  [0, 9, 10, 11, 14, 15, 16].all fun y => inRange y == specInRange y

example : agreeResidualPeriod10To15 = true := by decide

end JapanTaxLaw.ResidualPeriod10To15
