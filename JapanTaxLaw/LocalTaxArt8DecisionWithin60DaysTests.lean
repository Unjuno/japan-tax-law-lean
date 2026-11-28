import JapanTaxLaw.LocalTaxArt8DecisionWithin60DaysSpec

/-!
# LocalTaxArt8DecisionWithin60Days tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 59 / 60 / 61（六十日以内）。
-/

namespace JapanTaxLaw.LocalTaxArt8DecisionWithin60Days

example : withinLimit 0 = true := by decide
example : withinLimit 1 = true := by decide
example : withinLimit 59 = true := by decide
example : withinLimit 60 = true := by decide
example : withinLimit 61 = false := by decide
example : specWithin 59 = true := by decide
example : specWithin 60 = true := by decide
example : limitDays = specLimit := by decide
example : limitDays = 60 := by decide
example : withinLimit 120 = specWithin 120 := by decide

end JapanTaxLaw.LocalTaxArt8DecisionWithin60Days
