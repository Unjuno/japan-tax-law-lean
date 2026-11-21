import JapanTaxLaw.ContainerSpec

/-!
# ContainerSpec tests — 大型コンテナ寸法 smoke checks
Decidable smoke tests, pinned to law 329CO0000000155 / revision 329CO0000000155_20260401_508CO0000000085.
境界: 24/29（1/10m 単位）。
-/

namespace JapanTaxLaw.ContainerSpec

example : meetsDimensions 24 24 29 = true := by decide
example : meetsDimensions 23 24 29 = false := by decide
example : meetsDimensions 24 23 29 = false := by decide
example : meetsDimensions 24 24 28 = false := by decide
example : meetsDimensions 30 25 120 = true := by decide

end JapanTaxLaw.ContainerSpec
