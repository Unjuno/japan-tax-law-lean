import JapanTaxLaw.PenaltyCapsSpec

/-! Regression tests — 23 penalty caps. -/

namespace JapanTaxLaw.PenaltyCaps
example : fineOf PenaltyKind.p00 = (300000, 0) := by decide
example : fineOf PenaltyKind.p01 = (300000, 1) := by decide
example : fineOf PenaltyKind.p02 = (30000000, 5) := by decide
example : fineOf PenaltyKind.p03 = (3000000, 5) := by decide
example : fineOf PenaltyKind.p04 = (200000, 0) := by decide
example : fineOf PenaltyKind.p05 = (200000, 0) := by decide
example : fineOf PenaltyKind.p06 = (2000000, 1) := by decide
example : fineOf PenaltyKind.p07 = (2000000, 10) := by decide
example : fineOf PenaltyKind.p08 = (50000, 0) := by decide
example : fineOf PenaltyKind.p09 = (500000, 0) := by decide
example : fineOf PenaltyKind.p10 = (500000, 1) := by decide
example : fineOf PenaltyKind.p11 = (500000, 3) := by decide
example : fineOf PenaltyKind.p12 = (5000000, 3) := by decide
example : fineOf PenaltyKind.p13 = (5000000, 5) := by decide
example : fineOf PenaltyKind.p14 = (100000, 0) := by decide
example : fineOf PenaltyKind.p15 = (10000000, 5) := by decide
example : fineOf PenaltyKind.p16 = (10000000, 10) := by decide
example : fineOf PenaltyKind.p17 = (1000000, 0) := by decide
example : fineOf PenaltyKind.p18 = (1000000, 1) := by decide
example : fineOf PenaltyKind.p19 = (1000000, 3) := by decide
example : fineOf PenaltyKind.p20 = (1000000, 2) := by decide
example : fineOf PenaltyKind.p21 = (1000000, 5) := by decide
example : fineOf PenaltyKind.p22 = (1000000, 10) := by decide

example : fineOf PenaltyKind.p00 = specFine PenaltyKind.p00 := agreeCaps _
example : fineOf PenaltyKind.p22 = specFine PenaltyKind.p22 := agreeCaps _

end JapanTaxLaw.PenaltyCaps
