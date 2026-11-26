import JapanTaxLaw.ConsumptionTaxRate10or8

/-! # ConsumptionTaxRate10or8 spec — 10%/8% 分岐の独立定式 (law 363AC0000000108 / art.34)
原文の二つの割合を独立に再記述し、分岐ごとの一致をカーネルで確認する。 -/

namespace JapanTaxLaw.ConsumptionTaxRate10or8

def specStandardNum : Nat := 10
def specReducedNum : Nat := 8
def specRateDen : Nat := 100

def specRate (reduced : Bool) : Nat :=
  if reduced then specReducedNum else specStandardNum

example : specRate false = 10 := by decide
example : specRate true = 8 := by decide

def agreeConsumptionTaxRate10or8 : Bool :=
  ([false, true]).all fun flag => rate flag == specRate flag

example : agreeConsumptionTaxRate10or8 = true := by decide

end JapanTaxLaw.ConsumptionTaxRate10or8
