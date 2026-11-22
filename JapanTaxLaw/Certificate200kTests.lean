import JapanTaxLaw.Certificate200kSpec

/-! Kernel-decided boundary examples: 0/199999/200000/200001 円. -/

namespace JapanTaxLaw.Certificate200kTests

open JapanTaxLaw.Certificate200k
open JapanTaxLaw.Certificate200kSpec

example : withinCertificate200k 0 = true := by decide
example : withinCertificate200k 199999 = true := by decide
example : withinCertificate200k 200000 = true := by decide
example : withinCertificate200k 200001 = false := by decide
example : specWithin 199999 = true := by decide
example : specWithin 200000 = true := by decide
example : specWithin 200001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 199999 := agree_thm 199999
example : agree 200000 := agree_thm 200000
example : agree 200001 := agree_thm 200001

end JapanTaxLaw.Certificate200kTests
