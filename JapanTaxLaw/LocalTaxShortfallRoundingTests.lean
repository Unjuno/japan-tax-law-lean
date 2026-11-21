import JapanTaxLaw.LocalTaxShortfallRounding

/-!
# LocalTaxShortfallRounding tests — 地方税等減収補てん臨時交付金 art.5 smoke checks
Decidable smoke tests, pinned to law 420M60000008116 / revision 420M60000008116_20081022_000000000000000.
境界: 499→0 / 500→1000 / 999→1000 / 1499→1000 / 1500→2000。
-/

namespace JapanTaxLaw.LocalTaxShortfallRounding

example : roundToThousand 0 = 0 := by decide
example : roundToThousand 499 = 0 := by decide
example : roundToThousand 500 = 1000 := by decide
example : roundToThousand 999 = 1000 := by decide
example : roundToThousand 1000 = 1000 := by decide
example : roundToThousand 1499 = 1000 := by decide
example : roundToThousand 1500 = 2000 := by decide
example : roundToThousand 12345 = 12000 := by decide

end JapanTaxLaw.LocalTaxShortfallRounding
