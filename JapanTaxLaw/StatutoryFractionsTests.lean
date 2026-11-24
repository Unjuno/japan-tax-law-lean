import JapanTaxLaw.StatutoryFractionsSpec

/-! Regression tests — 16 法定割合（分数). -/

namespace JapanTaxLaw.StatutoryFractions

example : fractionOf FractionKind.f22_78 = (22, 78) := by decide
example : fractionOf FractionKind.f1_3 = (1, 3) := by decide
example : fractionOf FractionKind.f1_2 = (1, 2) := by decide
example : fractionOf FractionKind.f1_5 = (1, 5) := by decide
example : fractionOf FractionKind.f4_5 = (4, 5) := by decide
example : fractionOf FractionKind.f1_10 = (1, 10) := by decide
example : fractionOf FractionKind.f9_10 = (9, 10) := by decide
example : fractionOf FractionKind.f90_100 = (90, 100) := by decide
example : fractionOf FractionKind.f94_100 = (94, 100) := by decide
example : fractionOf FractionKind.f25_100 = (25, 100) := by decide
example : fractionOf FractionKind.f5_100 = (5, 100) := by decide
example : fractionOf FractionKind.f50_100 = (50, 100) := by decide
example : fractionOf FractionKind.f80_100 = (80, 100) := by decide
example : fractionOf FractionKind.f6_100 = (6, 100) := by decide
example : fractionOf FractionKind.f60_100 = (60, 100) := by decide
example : fractionOf FractionKind.f10_100 = (10, 100) := by decide

example : fractionOf FractionKind.f1_3 = specFraction FractionKind.f1_3 := agreeFractions _
example : fractionOf FractionKind.f94_100 = specFraction FractionKind.f94_100 := agreeFractions _
example : (fractionOf FractionKind.f1_2).2 > 0 := denominator_pos _

end JapanTaxLaw.StatutoryFractions
