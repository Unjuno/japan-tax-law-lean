import JapanTaxLaw.ForeignRelatedCorpTaxRate20

/-! # ForeignRelatedCorpTaxRate20 tests — 20%境界 (law 332AC0000000026 / art.40の7) -/

namespace JapanTaxLaw.ForeignRelatedCorpTaxRate20

example : atLeast20 0 = false := by decide
example : atLeast20 19 = false := by decide
example : atLeast20 20 = true := by decide
example : atLeast20 21 = true := by decide
example : atLeast20 50 = true := by decide
example : atLeast20 100 = true := by decide

end JapanTaxLaw.ForeignRelatedCorpTaxRate20
