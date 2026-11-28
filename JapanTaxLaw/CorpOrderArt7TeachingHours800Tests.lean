import JapanTaxLaw.CorpOrderArt7TeachingHours800Spec

/-!
# CorpOrderArt7TeachingHours800 tests — kernel-decided boundary checks

Pinned to law 340M50000040012 / revision 340M50000040012_20261001_505M60000040013.
境界: 799 / 800 / 801（八百時間以上）。
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours800

example : meetsRequirement 0 = false := by decide
example : meetsRequirement 1 = false := by decide
example : meetsRequirement 799 = false := by decide
example : meetsRequirement 800 = true := by decide
example : meetsRequirement 801 = true := by decide
example : specMeets 799 = false := by decide
example : specMeets 800 = true := by decide
example : requiredHours = specMin := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours800
