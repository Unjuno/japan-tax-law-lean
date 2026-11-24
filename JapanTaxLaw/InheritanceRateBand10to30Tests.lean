import JapanTaxLaw.InheritanceRateBand10to30Spec

/-! Boundary tests for the ¥10M<amount≤¥30M band; all kernel-decided. -/
namespace JapanTaxLaw.InheritanceRateBand10to30

example : lowerYen = 10_000_000 := by decide
example : upperYen = 30_000_000 := by decide

example : inBand 9_999_999 = false := by decide
example : inBand 10_000_000 = false := by decide
example : inBand 10_000_001 = true := by decide
example : inBand 20_000_000 = true := by decide
example : inBand 30_000_000 = true := by decide
example : inBand 30_000_001 = false := by decide

example : specInBand 10_000_000 = false := by decide
example : specInBand 10_000_001 = true := by decide
example : specInBand 30_000_000 = true := by decide
example : specInBand 30_000_001 = false := by decide

example : specInBand 10_000_000 = inBand 10_000_000 := agree_spec_impl 10_000_000
example : specInBand 10_000_001 = inBand 10_000_001 := agree_spec_impl 10_000_001
example : specInBand 30_000_000 = inBand 30_000_000 := agree_spec_impl 30_000_000
example : specInBand 30_000_001 = inBand 30_000_001 := agree_spec_impl 30_000_001

end JapanTaxLaw.InheritanceRateBand10to30
