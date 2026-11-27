import JapanTaxLaw.OfficeFeeSpecialWardAmount

/-! # OfficeFeeSpecialWardAmount spec — 二つの額の独立定式 (law 325AC0000000226 / art.734)
額を円単位の定数として再記述し、双方の分岐を照合する。 -/

namespace JapanTaxLaw.OfficeFeeSpecialWardAmount

def specOutsideWardsAmount : Nat := 175 * 10000
def specOtherAmount : Nat := 229 * 10000

def specAmount (alsoOutsideSpecialWards : Bool) : Nat :=
  if alsoOutsideSpecialWards then specOutsideWardsAmount else specOtherAmount

example : specAmount true = 1_750_000 := by decide
example : specAmount false = 2_290_000 := by decide

def agreeOfficeFeeSpecialWardAmount : Bool :=
  [true, false].all fun b => amount b == specAmount b

example : agreeOfficeFeeSpecialWardAmount = true := by decide

end JapanTaxLaw.OfficeFeeSpecialWardAmount
