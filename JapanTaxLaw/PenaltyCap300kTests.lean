import JapanTaxLaw.PenaltyCap300kSpec

/-! Boundary tests for the ¥300,000 inclusive fine cap; kernel-decided. -/
namespace JapanTaxLaw.PenaltyCap300k

example : capYen = 300_000 := by decide
example : withinCap 0 = true := by decide
example : withinCap 299_999 = true := by decide
example : withinCap 300_000 = true := by decide
example : withinCap 300_001 = false := by decide

example : specWithinCap 300_000 = true := by decide
example : specWithinCap 300_001 = false := by decide

example : specWithinCap 0 = withinCap 0 := agree_spec_impl 0
example : specWithinCap 299_999 = withinCap 299_999 := agree_spec_impl 299_999
example : specWithinCap 300_000 = withinCap 300_000 := agree_spec_impl 300_000
example : specWithinCap 300_001 = withinCap 300_001 := agree_spec_impl 300_001

end JapanTaxLaw.PenaltyCap300k
