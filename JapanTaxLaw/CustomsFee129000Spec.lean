import JapanTaxLaw.CustomsFee129000

/-! # CustomsFee129000 spec — 二つの手数料額の独立定式 (law 329CO0000000164 / art.4)
原文の二つの金額を独立に再記述し、各分岐の一致をカーネルで確認する。 -/

namespace JapanTaxLaw.CustomsFee129000

def specStandardFee : Nat := 129_000
def specDesignatedFee : Nat := 128_000

def specFee (designated : Bool) : Nat :=
  if designated then specDesignatedFee else specStandardFee

example : specFee false = 129_000 := by decide
example : specFee true = 128_000 := by decide

def agreeCustomsFee129000 : Bool :=
  ([false, true]).all fun flag => fee flag == specFee flag

example : agreeCustomsFee129000 = true := by decide

end JapanTaxLaw.CustomsFee129000
