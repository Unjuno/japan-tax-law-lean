import JapanTaxLaw.CustomsPermissionFee21800

/-! # CustomsPermissionFee21800 spec — 二つの手数料の独立定式 (law 329CO0000000164 / art.2)
円単位の定数を 万/千/百 の合成で再記述し、双方の分岐を照合する。 -/

namespace JapanTaxLaw.CustomsPermissionFee21800

def specStandardFee : Nat := 2 * 10000 + 1 * 1000 + 8 * 100
def specDesignatedFee : Nat := 2 * 10000 + 1 * 1000 + 7 * 100

def specFee (isDesignated : Bool) : Nat :=
  if isDesignated then specDesignatedFee else specStandardFee

example : specFee false = 21_800 := by decide
example : specFee true = 21_700 := by decide

def agreeCustomsPermissionFee21800 : Bool :=
  [true, false].all fun b => fee b == specFee b

example : agreeCustomsPermissionFee21800 = true := by decide

end JapanTaxLaw.CustomsPermissionFee21800
