import JapanTaxLaw.BlueBusinessDeductAmount

/-! # BlueBusinessDeductAmount spec — 225,000/217,500 の独立定式
law `340AC0000000033` / art. 3. 原文の二つの金額をそのまま境界値として再記述する。 -/

namespace JapanTaxLaw.BlueBusinessDeductAmount

def specStandardYen : Nat := 225_000
def specUnder20Yen : Nat := 217_500

def specAmount (under20 : Bool) : Nat :=
  if under20 then specUnder20Yen else specStandardYen

example : specAmount false = 225_000 := by decide
example : specAmount true = 217_500 := by decide

def agreeBlueBusinessDeductAmount : Bool :=
  ([false, true]).all fun u => amount u == specAmount u

example : agreeBlueBusinessDeductAmount = true := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
