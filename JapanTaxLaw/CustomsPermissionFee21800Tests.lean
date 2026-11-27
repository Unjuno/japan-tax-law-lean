import JapanTaxLaw.CustomsPermissionFee21800

/-! # CustomsPermissionFee21800 tests — 21,800/21,700円 (law 329CO0000000164 / art.2) -/

namespace JapanTaxLaw.CustomsPermissionFee21800

example : standardFee = 21_800 := by decide
example : designatedFee = 21_700 := by decide
example : fee false = 21_800 := by decide
example : fee true = 21_700 := by decide

end JapanTaxLaw.CustomsPermissionFee21800
