import JapanTaxLaw.CorpOrderArt7TeachingHours450And800Spec

/-!
# CorpOrderArt7TeachingHours450And800 tests — kernel-decided boundary checks

Pinned to law 340M50000040012 / revision 340M50000040012_20261001_505M60000040013.
境界: 449/450 と 799/800。
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours450And800

example : meetsBoth 0 0 = false := by decide
example : meetsBoth 1 1 = false := by decide
example : meetsBoth 449 800 = false := by decide
example : meetsBoth 450 800 = true := by decide
example : meetsBoth 450 799 = false := by decide
example : meetsBoth 451 801 = true := by decide
example : specMeets 449 800 = false := by decide
example : specMeets 450 799 = false := by decide
example : annualMin = specAnnual := by decide
example : totalMin = specTotal := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours450And800
