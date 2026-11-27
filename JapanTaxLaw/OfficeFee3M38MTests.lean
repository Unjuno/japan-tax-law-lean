import JapanTaxLaw.OfficeFee3M38M

/-! # tests — 300万/380万円 (law 325AC0000000226 / art.734) -/

namespace JapanTaxLaw.OfficeFee3M38M

example : outsideWardsAmount = 3_000_000 := by decide
example : otherAmount = 3_800_000 := by decide
example : amount true = 3_000_000 := by decide
example : amount false = 3_800_000 := by decide

end JapanTaxLaw.OfficeFee3M38M
