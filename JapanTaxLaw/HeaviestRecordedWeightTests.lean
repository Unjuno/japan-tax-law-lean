import JapanTaxLaw.HeaviestRecordedWeightSpec

/-! Kernel-decided boundary examples for 登録免許税法施行規則 art.5(2). -/
namespace JapanTaxLaw.HeaviestRecordedWeight

example : heaviest 10000 9000 = 10000 := by decide
example : heaviest 9000 10000 = 10000 := by decide
example : heaviest 0 0 = 0 := by decide
example : specHeaviest 10000 9000 = 10000 := by decide
example : specHeaviest 9000 10000 = 10000 := by decide
example : specHeaviest 10000 9000 = heaviest 10000 9000 := agreeHeaviest 10000 9000
example : specHeaviest 9000 10000 = heaviest 9000 10000 := agreeHeaviest 9000 10000
example : 10000 <= heaviest 10000 9000 := heaviestAtLeastLeft 10000 9000
example : 10000 <= heaviest 9000 10000 := heaviestAtLeastRight 9000 10000
example : heaviest 10000 9000 <= heaviest 11000 9000 := heaviestMonotoneLeft 10000 11000 9000 (by decide)

end JapanTaxLaw.HeaviestRecordedWeight
