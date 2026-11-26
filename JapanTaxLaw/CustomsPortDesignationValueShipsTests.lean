import JapanTaxLaw.CustomsPortDesignationValueShipsSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.CustomsPortDesignationValueShipsTests

open JapanTaxLaw.CustomsPortDesignationValueShips
open JapanTaxLaw.CustomsPortDesignationValueShipsSpec

example : bothExceeded 0 0 = false := by decide
example : bothExceeded 1 1 = false := by decide
example : bothExceeded 49999999 49999999 = false := by decide
example : bothExceeded 50000000 50000000 = false := by decide
example : bothExceeded 50000001 50000001 = true := by decide
example : bothExceeded 10 10 = false := by decide
example : bothExceeded 11 11 = false := by decide
example : bothExceeded 12 12 = false := by decide
example : agree 49999999 49999999 := agree_thm 49999999 49999999
example : agree 50000000 50000000 := agree_thm 50000000 50000000
example : agree 50000001 50000001 := agree_thm 50000001 50000001
example : agree 11 11 := agree_thm 11 11

end JapanTaxLaw.CustomsPortDesignationValueShipsTests
