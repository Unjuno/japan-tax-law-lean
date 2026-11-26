import JapanTaxLaw.RailPassengerVolume10k150kSpec

/-! Kernel-decided boundary examples. -/

namespace JapanTaxLaw.RailPassengerVolume10k150kTests

open JapanTaxLaw.RailPassengerVolume10k150k
open JapanTaxLaw.RailPassengerVolume10k150kSpec

example : inBand 0 = false := by decide
example : inBand 1 = false := by decide
example : inBand 9999 = false := by decide
example : inBand 10000 = true := by decide
example : inBand 10001 = true := by decide
example : inBand 149999 = true := by decide
example : inBand 150000 = false := by decide
example : inBand 150001 = false := by decide
example : agree 9999 := agree_thm 9999
example : agree 10000 := agree_thm 10000
example : agree 149999 := agree_thm 149999
example : agree 150000 := agree_thm 150000

end JapanTaxLaw.RailPassengerVolume10k150kTests
