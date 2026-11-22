import JapanTaxLaw.ForeignDesignation

/-!
# ForeignDesignation tests — 指定外国 smoke checks
Decidable smoke tests, pinned to law 337CO0000000227 / revision 337CO0000000227_20260401_508CO0000000083.
台湾(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.ForeignDesignation

example : isDesignatedForeign 0 = true := by decide
example : isDesignatedForeign 1 = false := by decide
example : isDesignatedForeign 2 = false := by decide

end JapanTaxLaw.ForeignDesignation
