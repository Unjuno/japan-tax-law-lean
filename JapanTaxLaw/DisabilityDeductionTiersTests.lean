import JapanTaxLaw.DisabilityDeductionTiers

/-! # DisabilityDeductionTiers tests — 1万円/10万円 (law 325AC0000000226 / art.37) -/

namespace JapanTaxLaw.DisabilityDeductionTiers

example : standardPerPerson = 10_000 := by decide
example : specialPerPerson = 100_000 := by decide
example : total false 0 = 0 := by decide
example : total false 1 = 10_000 := by decide
example : total false 3 = 30_000 := by decide
example : total true 1 = 100_000 := by decide
example : total true 3 = 300_000 := by decide

end JapanTaxLaw.DisabilityDeductionTiers
