import JapanTaxLaw.CustomsFee76000

/-! # CustomsFee76000 spec — 二つの手数料額の独立定式 (law 329CO0000000164 / art.2)
原文の二つの金額を独立に再記述し、各分岐の一致をカーネルで確認する。 -/

namespace JapanTaxLaw.CustomsFee76000

def specStandardFee : Nat := 76_000
def specDesignatedFee : Nat := 75_400

def specFee (designated : Bool) : Nat :=
  if designated then specDesignatedFee else specStandardFee

example : specFee false = 76_000 := by decide
example : specFee true = 75_400 := by decide

def agreeCustomsFee76000 : Bool :=
  ([false, true]).all fun flag => fee flag == specFee flag

example : agreeCustomsFee76000 = true := by decide

end JapanTaxLaw.CustomsFee76000
