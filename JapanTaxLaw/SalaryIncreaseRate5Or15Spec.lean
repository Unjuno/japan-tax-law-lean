import JapanTaxLaw.SalaryIncreaseRate5Or15

/-! # SalaryIncreaseRate5Or15 spec — 5%/15% 分岐の独立定式
law `332AC0000000026` / art.10の5の4. 分岐を分数 5/100 と 15/100 として
交差乗算で判定し、原文の「六」を境界入力として保持する。 -/

namespace JapanTaxLaw.SalaryIncreaseRate5Or15

def specNormalNum : Nat := 5
def specAltNum : Nat := 6
def specElevatedNum : Nat := 15
def specRateDen : Nat := 100

def specThreshold (elevated : Bool) : Nat :=
  if elevated then specElevatedNum else specNormalNum

def specQualifies (rate : Nat) (elevated : Bool) : Bool :=
  specRateDen * rate >= specThreshold elevated * specRateDen

example : specQualifies 5 false = true := by decide
example : specQualifies 14 true = false := by decide
example : specQualifies 15 true = true := by decide

def agreeSalaryIncreaseRate5Or15 : Bool :=
  [(0,false),(4,false),(5,false),(6,true),(14,true),(15,true),(100,true)].all fun re =>
    qualifies re.1 re.2 == specQualifies re.1 re.2

example : agreeSalaryIncreaseRate5Or15 = true := by decide

end JapanTaxLaw.SalaryIncreaseRate5Or15
