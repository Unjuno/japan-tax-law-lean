import JapanTaxLaw.Vessel500TonSpec

/-! Kernel-decided boundary examples: 0/499/500/501 t. -/

namespace JapanTaxLaw.Vessel500TonTests

open JapanTaxLaw.Vessel500Ton
open JapanTaxLaw.Vessel500TonSpec

example : hasVessel500Ton 0 = false := by decide
example : hasVessel500Ton 499 = false := by decide
example : hasVessel500Ton 500 = true := by decide
example : hasVessel500Ton 501 = true := by decide
example : specWithin 499 = false := by decide
example : specWithin 500 = true := by decide
example : specWithin 501 = true := by decide
example : agree 0 := agree_thm 0
example : agree 499 := agree_thm 499
example : agree 500 := agree_thm 500
example : agree 501 := agree_thm 501

end JapanTaxLaw.Vessel500TonTests
