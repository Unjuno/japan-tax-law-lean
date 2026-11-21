import JapanTaxLaw.AreaThreshold2Ha
import JapanTaxLaw.AreaThreshold2HaSpec

/-
# AreaThreshold2HaTests — kernel-decided boundary checks for 第三条 区域面積二ヘクタール以上

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 二ヘクタール (= 2 ha) threshold neighbourhood, saturation/identity, and
impl/spec agreement on the boundary grid.

Pinned source: law 348AC0000000102, revision 348AC0000000102_20010106_411AC0000000160,
sha256 1aff9700ac6c8028a1901fc056959c771fb539c1c40da205f498bab4f67a063b,
Article Num 3, needle「当該区域の面積が二ヘクタール以上であること」.
-/

namespace JapanTaxLaw.AreaThreshold2Ha

-- (a) zero hectares is below the 2 ha floor.
example : meetsAreaFloor 0 = false := by decide

-- (b) small positive inputs and the 二ヘクタール (= 2) threshold neighbourhood.
example : meetsAreaFloor 1 = false := by decide
example : meetsAreaFloor 2 = true := by decide
example : meetsAreaFloor 3 = true := by decide
example : meetsAreaFloor 4 = true := by decide
example : meetsAreaFloor 5 = true := by decide
example : meetsAreaFloor 10 = true := by decide
example : meetsAreaFloor 39 = true := by decide

-- (c) saturation / identity at the statutory floor 二ヘクタール (= 2).
example : 2 - 2 = 0 := by decide
example : areaFloor = 2 := by decide
example : specFloor = 2 := by decide
example : areaFloor <= 2 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : meetsAreaFloor 0 = false := zero_false
example : meetsAreaFloor 1 = false := one_false
example : meetsAreaFloor 2 = true := two_true
example : meetsAreaFloor 3 = true := three_true

-- direct-inequality monotonicity (no typeclass), universal.
example {ha ha' : Nat} (h : meetsAreaFloor ha = true)
    (hle : ha <= ha') : meetsAreaFloor ha' = true :=
  meetsAreaFloor_of_ge h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : meetsAreaFloor 0 = specMeets 0 := by decide
example : meetsAreaFloor 1 = specMeets 1 := by decide
example : meetsAreaFloor 2 = specMeets 2 := by decide
example : meetsAreaFloor 3 = specMeets 3 := by decide
example : meetsAreaFloor 10 = specMeets 10 := by decide
example (x : Nat) : meetsAreaFloor x = specMeets x := agreeArea x

end JapanTaxLaw.AreaThreshold2Ha
