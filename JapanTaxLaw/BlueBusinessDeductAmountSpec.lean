import JapanTaxLaw.BlueBusinessDeductAmount

/-! # BlueBusinessDeductAmount spec — 225,000/217,500 と 20歳未満の独立定式
law `340AC0000000033` / art. 3. 原文の「二十歳未満」を年齢 20 の境界として、
二つの金額を独立に再記述する。 -/

namespace JapanTaxLaw.BlueBusinessDeductAmount

def specAgeThreshold : Nat := 20
def specStandardYen : Nat := 225_000
def specUnder20Yen : Nat := 217_500

def specAmount (age : Nat) : Nat :=
  if age < specAgeThreshold then specUnder20Yen else specStandardYen

example : specAmount 19 = 217_500 := by decide
example : specAmount 20 = 225_000 := by decide

def agreeBlueBusinessDeductAmount : Bool :=
  [0, 19, 20, 21, 30, 100].all fun age => amount age == specAmount age

example : agreeBlueBusinessDeductAmount = true := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
