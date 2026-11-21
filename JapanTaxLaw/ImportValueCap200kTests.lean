import JapanTaxLaw.ImportValueCap200k
import JapanTaxLaw.ImportValueCap200kSpec

/-
# ImportValueCap200kTests — kernel-decided boundary checks for 関税定率法施行令 第十三条の六

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 二十万円 (= 200,000) threshold neighbourhood, saturation/identity, and
impl/spec agreement on the boundary grid.

Pinned source: law 329CO0000000155, revision 329CO0000000155_20260401_508CO0000000085,
sha256 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01,
Article Num 13_6, needle「輸入する者ごとに財務省令で定めるところにより計算した輸入する物品の額の総額が二十万円を超えない範囲内において財務省令で定める額以下である場合における当該輸入する物品以外のもの」.
-/

namespace JapanTaxLaw.ImportValueCap200k

-- (a) zero amount is within the cap.
example : withinCap 0 = true := by decide

-- (b) small positive inputs and the 二十万円 threshold neighbourhood.
example : withinCap 1 = true := by decide
example : withinCap 2 = true := by decide
example : withinCap 199_999 = true := by decide
example : withinCap 200_000 = true := by decide
example : withinCap 200_001 = false := by decide

-- (c) saturation / identity at the statutory cap 二十万円 (= 200,000).
example : 200_000 - 200_000 = 0 := by decide
example : valueCap = 200_000 := by decide
example : valueCap <= 200_000 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : withinCap 199_999 = true := below_cap_true
example : withinCap 200_000 = true := at_cap_true
example : withinCap 200_001 = false := above_cap_false
example : withinCap 0 = true := zero_true

-- direct-inequality monotonicity (no `Monotone`), universal.
example {amount amount' : Nat} (h : withinCap amount = true)
    (hle : amount' <= amount) : withinCap amount' = true :=
  withinCap_of_le h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinCap 0 = specWithin 0 := by decide
example : withinCap 1 = specWithin 1 := by decide
example : withinCap 199_999 = specWithin 199_999 := by decide
example : withinCap 200_000 = specWithin 200_000 := by decide
example : withinCap 200_001 = specWithin 200_001 := by decide
example (x : Nat) : withinCap x = specWithin x := agreeWithin x

end JapanTaxLaw.ImportValueCap200k
