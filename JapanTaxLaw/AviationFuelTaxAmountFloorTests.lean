import JapanTaxLaw.AviationFuelTaxAmountFloor
import JapanTaxLaw.AviationFuelTaxAmountFloorSpec

/-
# AviationFuelTaxAmountFloorTests — kernel-decided boundary checks for 国税局課税部等所掌事務範囲省令 第二条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 五千万円 (= 50,000,000 円) threshold neighbourhood, saturation/identity,
and impl/spec agreement on the boundary grid.

Pinned source: law 352M50000040032, revision 352M50000040032_20220710_504M60000040044,
sha256 d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed,
Article Num 2, needle「当該積込みの場所において一年中に航空機に積み込まれた航空機燃料に係る航空機燃料税の額に相当する金額が五千万円以上であること」.
-/

namespace JapanTaxLaw.AviationFuelTaxAmountFloor

-- (a) zero amount does not meet the floor.
example : meetsFloor 0 = false := by decide

-- (b) small positive inputs and the 五千万円 threshold neighbourhood.
example : meetsFloor 1 = false := by decide
example : meetsFloor 2 = false := by decide
example : meetsFloor 49_999_999 = false := by decide
example : meetsFloor 50_000_000 = true := by decide
example : meetsFloor 50_000_001 = true := by decide

-- (c) saturation / identity at the statutory floor 五千万円 (= 50,000,000).
example : amountFloor = 50_000_000 := by decide
example : amountFloor <= 50_000_000 := by decide
example : 50_000_000 - 50_000_000 = 0 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : meetsFloor 49_999_999 = false := below_floor_false
example : meetsFloor 50_000_000 = true := at_floor_true
example : meetsFloor 50_000_001 = true := above_floor_true
example : meetsFloor 0 = false := zero_false

-- direct-inequality monotonicity (no `Monotone`), universal.
example {amount amount' : Nat} (h : meetsFloor amount = true)
    (hle : amount <= amount') : meetsFloor amount' = true :=
  meetsFloor_of_ge h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : meetsFloor 0 = specMeets 0 := by decide
example : meetsFloor 1 = specMeets 1 := by decide
example : meetsFloor 49_999_999 = specMeets 49_999_999 := by decide
example : meetsFloor 50_000_000 = specMeets 50_000_000 := by decide
example : meetsFloor 50_000_001 = specMeets 50_000_001 := by decide
example (x : Nat) : meetsFloor x = specMeets x := agreeFloor x

end JapanTaxLaw.AviationFuelTaxAmountFloor
