import JapanTaxLaw.AntennaPowerCeiling
import JapanTaxLaw.AntennaPowerCeilingSpec

/-
# AntennaPowerCeilingTests — kernel-decided boundary checks for 登録免許税法施行令 第十二条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 五百ワット (= 500 W) threshold neighbourhood, saturation above the ceiling,
and impl/spec agreement on the boundary grid.

Pinned source: law 342CO0000000146, revision 342CO0000000146_20261001_507CO0000000124,
sha256 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b,
Article Num 12, needle「法別表第一第五十四号（二）に規定する政令で定める登録は、基本送信機の規模が空中線電力五百ワット以下の無線局の登録とする。」.
-/

namespace JapanTaxLaw.AntennaPowerCeiling

-- (a) zero antenna power is within the ceiling.
example : withinPowerCeiling 0 = true := by decide

-- (b) small positive inputs.
example : withinPowerCeiling 1 = true := by decide
example : withinPowerCeiling 2 = true := by decide

-- (c) the 五百ワット (= 500 W) threshold neighbourhood: below / at / above.
example : withinPowerCeiling 499 = true := by decide
example : withinPowerCeiling 500 = true := by decide
example : withinPowerCeiling 501 = false := by decide

-- (d) saturation well above the ceiling.
example : withinPowerCeiling 1000 = false := by decide

-- (e) the statutory ceiling literal is exactly 五百ワット = 500 W.
example : powerCeilingWatts = 500 := by decide

-- (f) the named impl theorems apply at the boundary points.
example : withinPowerCeiling 0 = true := zero_true
example : withinPowerCeiling 1 = true := one_true
example : withinPowerCeiling 499 = true := below_true
example : withinPowerCeiling 500 = true := at_true
example : withinPowerCeiling 501 = false := above_false
example : powerCeilingWatts = 500 := ceiling_is_500

-- (g) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinPowerCeiling 0 = specWithin 0 := by decide
example : withinPowerCeiling 1 = specWithin 1 := by decide
example : withinPowerCeiling 499 = specWithin 499 := by decide
example : withinPowerCeiling 500 = specWithin 500 := by decide
example : withinPowerCeiling 501 = specWithin 501 := by decide
example : powerCeilingWatts = specCeiling := agreeCeiling
example (watts : Nat) : withinPowerCeiling watts = specWithin watts := agreeWithin watts

end JapanTaxLaw.AntennaPowerCeiling
