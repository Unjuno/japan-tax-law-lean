import JapanTaxLaw.OfficeFee3M38M

/-! # spec — 二つの額の独立定式 (law 325AC0000000226 / art.734)
「三百万円＝300×10000」「三百八十万円＝380×10000」として再記述する。 -/

namespace JapanTaxLaw.OfficeFee3M38M

def specOutsideWardsAmount : Nat := 300 * 10000
def specOtherAmount : Nat := 380 * 10000

def specAmount (alsoOutsideSpecialWards : Bool) : Nat :=
  if alsoOutsideSpecialWards then specOutsideWardsAmount else specOtherAmount

def agreeOfficeFee3M38M : Bool :=
  [true, false].all fun b => amount b == specAmount b

example : agreeOfficeFee3M38M = true := by decide

end JapanTaxLaw.OfficeFee3M38M
